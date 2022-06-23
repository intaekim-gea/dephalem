import 'dart:async';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:dephalem/controllers/goods_controller.dart';
import 'package:dephalem/presents/pages/home/home_page.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../models/model.dart';

class CameraControllerWeb extends GetxController
    with StateMixin<CameraController> {
  final connect = Get.find<GetConnect>();
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
      return controller;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> capture() async {
    final file = await controller.takePicture();
    final bytes = await file.readAsBytes();

    _sendImageDio(bytes);
  }

  void _sendImageDio(Uint8List bytes) async {
    var client = dio.Dio();

    var formData = dio.FormData.fromMap({
      'uploadFile': dio.MultipartFile.fromBytes(bytes),
    });

    final goodsController = Get.find<GoodsController>();
    final homeController = Get.find<HomePageController>();
    homeController.beingProcess.value = true;
    try {
      var response = await client.post<String>(
        'http://192.168.1.65:3333/classify/',
        data: formData,
      );
      homeController.beingProcess.value = false;
      if (response.data != null) {
        final model = modelFromJson(response.data!);
        // if (model.data.prediction == 'bag') {
        homeController.selectedGood.value = goodsController.goods.value.bag;
        // }
        print(response.data.toString());
      }
    } catch (e) {
      Future.delayed(Duration(seconds: 3), () {
        homeController.beingProcess.value = false;
        homeController.selectedGood.value = goodsController.goods.value.bag;
      });
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
