import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../controllers/camera_controller_web.dart';

class PreviewWidget extends StatelessWidget {
  final CameraControllerWeb controller;

  const PreviewWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.obx(
        (state) => CameraPreview(controller.controller),
      );
}
