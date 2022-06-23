import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/goods_controller.dart';
import 'controllers/line_chart_controller.dart';
import 'presents/pages/loading/loading_page.dart';
import 'presents/platforms/utilities_desktop.dart'
    if (dart.library.html) 'presents/platforms/utilities_web.dart';

import 'presents/pages/home/home_page.dart';

void locator() {
  Get.put(GoodsController(), permanent: true);
  Get.put(LineChartController(), permanent: true);
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
            binding: BindingsBuilder.put(() => HomePageController()),
            transition: Transition.fade,
            transitionDuration: const Duration(seconds: 1),
          ),
          GetPage(
            name: LoadingPage.name,
            page: () => const LoadingPage(),
            binding: BindingsBuilder.put(() {
              final route = Get.arguments?['route'] ?? HomePage.name;
              return LoadingPageController(route);
            }),
          ),
          createPreviewPage('/preview'),
          createSerialPage('/serial'),
        ],
      );
}
