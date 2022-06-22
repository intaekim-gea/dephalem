import 'dart:async';

import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraControllerWeb extends GetxController
    with StateMixin<CameraController> {
  CameraController get controller => value!;

  @override
  void onInit() {
    super.onInit();
    append(() => setupCamera);
  }

  Future<CameraController> setupCamera() async {
    try {
      final cameras = await availableCameras();
      final controller = CameraController(cameras[0], ResolutionPreset.max);
      await controller.initialize();
      // startCapture();
      return controller;
    } catch (e) {
      rethrow;
    }
  }

  void startCapture() {
    Timer(const Duration(seconds: 2), () async {
      // final file = await controller.takePicture();
      // final bytes = await file.readAsBytes();
      startCapture();
    });
  }
}
