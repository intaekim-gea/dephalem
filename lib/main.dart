import 'package:dephalem/controllers/goods_controller.dart';
import 'package:dephalem/presents/pages/chart/line_chart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presents/platforms/utilities_desktop.dart'
    if (dart.library.html) 'presents/platforms/utilities_web.dart';

import 'presents/pages/home/home_page.dart';

void locator() {
  Get.put(GoodsController(), permanent: true);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setMinWindowSize();
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'de Phalem',
        theme: ThemeData(
          fontFamily: 'LEMONMILK',
          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.name,
        getPages: [
          GetPage(
              name: HomePage.name,
              page: () => const HomePage(),
              binding: BindingsBuilder.put(() => HomePageController())),
          GetPage(
              name: LineChartPage.name,
              page: () => const LineChartPage(),
              binding: BindingsBuilder.put(() => LineChartController())),
          createPreviewPage('/preview'),
          createSerialPage('/serial'),
        ],
      );
}
