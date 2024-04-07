import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'utils/camera_state.dart';
import './widgets/bot_nav_bar.dart';
import 'widgets/camera_widget.dart';
import 'widgets/take_picture_button.dart';
import '../../utils/utils_translator.dart';
import 'translator_camera_cubit/translator_camera_cubit.dart';
import 'widgets/recognized_object_widget.dart';
import './screens/loading_recognized_screen.dart';
import '../translator_page/translator_cubit/translator_cubit.dart';
import '../translator_page/widgets/change_both_languages_widget.dart';

class TranslatorCameraPage extends StatefulWidget {
  const TranslatorCameraPage({
    super.key,
    required this.activeIndex,
  });
  final int activeIndex;

  @override
  State<TranslatorCameraPage> createState() => _TranslatorCameraPageState();
}

class _TranslatorCameraPageState extends State<TranslatorCameraPage> {
  late final TranslatorCameraCubit translatorCameraCubit;
  late final translatorCubit = BlocProvider.of<TranslatorCubit>(context);
  late final CameraState? cameraState;

  late int activeIndex = widget.activeIndex;

  @override
  void initState() {
    super.initState();
    translatorCameraCubit = BlocProvider.of<TranslatorCameraCubit>(context);
    init();
  }

  void init() async {
    await translatorCameraCubit.initTranslator(widget.activeIndex);
    cameraState = CameraState(translatorCameraCubit);
    WidgetsBinding.instance.addObserver(cameraState!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslatorCameraCubit, TranslatorCameraState>(
      builder: (context, state) {
        final isActiveButton = state.maybeMap<bool>(
          initial: (val) => val.isActiveButton,
          orElse: () => true,
        );
        return WillPopScope(
          onWillPop: () async => isActiveButton,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(translatorCameraCubit.getTitleFromIndex(activeIndex)),
              leading: UtilsTranslator.leftArrowButton(
                isActiveButton ? Get.back : null,
              ),
            ),
            body: BlocBuilder<TranslatorCubit, TranslatorState>(
              builder: (context, translatorState) {
                return state.map(
                  loading: (value) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  initial: (value) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: Get.height -
                              kToolbarHeight -
                              kBottomNavigationBarHeight,
                          width: Get.width,
                          child: CameraWidget(
                            cameraController: value.cameraController,
                          ),
                        ),
                        if (activeIndex == 0) ...[
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: ChangeBothLanguagesWidget(
                                onSwap: translatorCubit.swapLanguages,
                                isActiveButton: isActiveButton,
                                swapColor: Theme.of(context).cardColor,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TakePictureButton(
                                    isActiveButton: isActiveButton,
                                    onTakePicture: () =>
                                        translatorCameraCubit.takePicture(
                                      translatorState.fromLanguageModel.isoCode,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                ],
                              ),
                            ),
                          ),
                        ] else if (activeIndex == 1) ...[
                          for (final detectedObject in value.detectedObjects)
                            RecognizedObjectWidget(
                              detectedObject: detectedObject,
                              sizeCamera: value.sizeCamera,
                            ),
                        ],
                      ],
                    );
                  },
                  noPermission: (value) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'You have not given permission to use the camera\n'
                            'Please issue to use this feature',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const TextButton(
                            onPressed: openAppSettings,
                            child: Text('Open App Settings'),
                          ),
                        ],
                      ),
                    );
                  },
                  noSupportedCamera: (value) {
                    return Center(
                      child: Text(
                        'Sorry, but you do not have a suitable camera to use this feature\n'
                        'But you can use image import',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  },
                );
              },
            ),
            bottomNavigationBar: BotNavBar(
              curIndex: activeIndex,
              onTap: (val) {
                if (!isActiveButton) return;
                if (val == 0 && activeIndex != 0) {
                  translatorCameraCubit.removeStreamCamera();
                }
                if (val == 1 && activeIndex != 1) {
                  translatorCameraCubit.addStreamCamera();
                }
                if (val == 2) {
                  Get.to(() => LoadingRecognizedScreen(
                        onImportImage: translatorCameraCubit.importImage,
                      ));
                  return;
                }

                setActiveIndex(val);
              },
            ),
          ),
        );
      },
    );
  }

  void setActiveIndex(int index) => setState(() => activeIndex = index);

  @override
  void dispose() {
    if (cameraState != null) {
      WidgetsBinding.instance.removeObserver(cameraState!);
    }
    translatorCameraCubit.dispose();
    super.dispose();
  }
}
