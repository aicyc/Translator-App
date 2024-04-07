part of 'translator_camera_cubit.dart';

abstract class TranslatorCameraCubitHelper
    extends Cubit<TranslatorCameraState> {
  TranslatorCameraCubitHelper(super.initialState);

  final _uuid = const Uuid();
  bool _hasStream = false;
  ObjectDetector? _objectDetector;

  Permission get _cameraPermission => Permission.camera;

  ImagePicker get _imagePicker => ImagePicker();

  _Initial get _initialState => state as _Initial;

  bool get _isLoadingState => state is _Loading;
  bool get _isNoPermissionState => state is _NoPermission;
  bool get _isNoSupportedCameraState => state is _NoSupportedCamera;

  Future<PermissionStatus> _getPermissionCamera() async {
    var camera = await _cameraPermission.status;
    if (!camera.isGranted) {
      camera = await _cameraPermission.request();
    }
    return camera;
  }

  Future<String> _getModel(String assetPath) async {
    final tmpPath = '${DirectoryUtils.applicationDir.path}/$assetPath}';
    await Directory(path.dirname(tmpPath)).create(recursive: true);
    final file = File(tmpPath);
    final isExistFile = await file.exists();
    if (!isExistFile) {
      final byteData = await rootBundle.load(assetPath);
      await file.writeAsBytes(byteData.buffer.asUint8List(
        byteData.offsetInBytes,
        byteData.lengthInBytes,
      ));
    }
    return file.path;
  }

  Future<ObjectDetector> _initializeObjectDetector() async {
    final modelPath =
        await _getModel('assets/object_detection_object_labeler_v1.tflite');
    final optionsDetector = LocalObjectDetectorOptions(
      mode: DetectionMode.stream,
      modelPath: modelPath,
      classifyObjects: true,
      multipleObjects: true,
    );
    return ObjectDetector(options: optionsDetector);
  }

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    final sensorOrientation =
        _initialState.cameraController.description.sensorOrientation;

    final rotationCompensation = (sensorOrientation + 360) % 360;
    final rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
    if (rotation == null) return null;

    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    if (format == null || format != InputImageFormat.nv21) return null;

    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation,
        format: format,
        bytesPerRow: plane.bytesPerRow,
      ),
    );
  }

  Future<void> _initializeCameraController(
    CameraDescription cameraDescription,
  ) async {
    final cameraController = _getCameraController(cameraDescription);
    await cameraController.initialize();

    emit(TranslatorCameraState.initial(
      cameraController: cameraController,
    ));
  }

  Future<File> _createFileFromBytes({
    required Uint8List bytes,
    required String ext,
  }) async {
    final tempName = _uuid.v4();
    final tempPath = DirectoryUtils.tempDir.path;
    final file = await File('$tempPath/$tempName.$ext').create();
    await file.writeAsBytes(bytes);

    return file;
  }

  CameraController _getCameraController(CameraDescription description) =>
      CameraController(
        description,
        ResolutionPreset.max,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.nv21,
      );

  TextRecognitionScript _getScriptByIsoCode(String isoCode) {
    if (isoCode.contains('zh')) return TextRecognitionScript.chinese;
    if (isoCode == 'ko') return TextRecognitionScript.chinese;
    if (isoCode == 'ja') return TextRecognitionScript.japanese;
    return TextRecognitionScript.latin;
  }

  Future<RecognizedText> _getRecognizedTextFromImage({
    required String isoCode,
    required InputImage inputImage,
  }) async {
    final script = _getScriptByIsoCode(isoCode);
    final textRecognizer = TextRecognizer(script: script);
    await textRecognizer.close();
    return textRecognizer.processImage(inputImage);
  }

  Future<File> _getFileFromXFile(XFile xFile) async {
    final bytesPricture = await xFile.readAsBytes();
    final ext = path.extension(xFile.name);
    return _createFileFromBytes(
      bytes: bytesPricture,
      ext: ext,
    );
  }
}
