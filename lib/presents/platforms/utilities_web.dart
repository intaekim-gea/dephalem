import 'package:dephalem/controllers/serial_controller_web.dart';
import 'package:dephalem/presents/pages/serial/serial_page.dart';
import 'package:get/get.dart';

import '../../controllers/camera_controller_web.dart';
import '../pages/preview/preview_page.dart';

Future<void> setMinWindowSize() async {}

GetPage createPreviewPage(String name) => GetPage(
      name: name,
      page: () => const PreviewPage(),
      binding: BindingsBuilder.put(() => Get.put(CameraControllerWeb())),
    );

GetPage createSerialPage(String name) => GetPage(
      name: name,
      page: () => const SerialPage(),
      binding: BindingsBuilder.put(() => Get.put(SerialControllerWeb())),
    );
