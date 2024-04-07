import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class RecognizedObjectWidget extends StatelessWidget {
  const RecognizedObjectWidget({
    super.key,
    required this.detectedObject,
    required this.sizeCamera,
  });
  final DetectedObject detectedObject;
  final Size sizeCamera;

  Rect get boundingBox => detectedObject.boundingBox;
  List<Label> get labels => detectedObject.labels;

  double get availableHeight =>
      Get.height - kToolbarHeight - kBottomNavigationBarHeight;

  double get widthScaleFactor => Get.width / sizeCamera.flipped.width;
  double get heightScaleFactor => availableHeight / sizeCamera.flipped.height;
  double get scaledWidth => boundingBox.width * widthScaleFactor;
  double get scaledHeight => boundingBox.height * heightScaleFactor;

  @override
  Widget build(BuildContext context) {
    if (labels.isEmpty) return Container();

    return Positioned.fromRect(
      rect: Rect.fromLTWH(rectLeft, rectTop, rectWidth, rectHeight),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Get.back(result: labels.first.text),
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(8.0),
              color: color.withOpacity(.4),
            ),
            child: Container(
              color: color,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    labels.first.text,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double get rectLeft {
    final scaledLeft = boundingBox.left * widthScaleFactor;

    if (scaledLeft < 0) return 0;

    final width = Get.width - scaledWidth;
    if (scaledLeft > width) return width;

    return scaledLeft;
  }

  double get rectTop {
    double rectTop = boundingBox.top * heightScaleFactor;

    if (rectTop < 0) return 0;

    final height = availableHeight - scaledHeight;
    if (rectTop > height) return height;

    return rectTop;
  }

  double get rectWidth {
    double scaledRight = rectLeft + scaledWidth;
    if (scaledRight < 0) {
      scaledRight = 0;
    } else if (scaledRight > Get.width) {
      scaledRight = Get.width;
    }

    return scaledRight - rectLeft;
  }

  double get rectHeight {
    double scaledBottom = rectTop + scaledHeight;
    if (scaledBottom < 0) {
      scaledBottom = 0;
    } else if (scaledBottom > Get.height) {
      scaledBottom = Get.height;
    }

    return scaledBottom - rectTop;
  }

  Color get color => Get.theme.cardColor;
}
