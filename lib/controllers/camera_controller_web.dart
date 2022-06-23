import 'dart:async';

import 'package:camera/camera.dart';
import 'package:get/get.dart';

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

    try {
      final multiPart = MultipartFile(bytes, filename: 'avatar.png');
      final form = FormData({
        'uploadFile': bytes,
      });
      final respons = await connect.post<String>(
        'http://192.168.1.65:3333/classify/',
        form,
        // contentType: 'multipart/form-data',
      );

// MultipartFile f =
//         MultipartFile(await file.readAsBytes(), filename: 'avatar.png');
//     FormData form = FormData({
//       'name': pet.name,
//       'gender': pet.gender,
//       'birthday': pet.birthday,
//       'type': pet.type,
//       'want_marraige': pet.wantMarraige,
//       if (pet.breed != null) 'breed': pet.breed,
//       'file': f,
//     });

//     return post(
//       '/create/',
//       form,
//       headers: headers,
//       contentType: "multipart/form-data",
//     );

      print('object');
    } catch (e) {
      print('$e');
    }
    print('object');
  }

  void startCapture() {
    Timer(const Duration(seconds: 2), () async {
      // final file = await controller.takePicture();
      // final bytes = await file.readAsBytes();
      startCapture();
    });
  }
}
