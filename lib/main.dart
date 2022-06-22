import 'package:dephalem/presents/pages/preview/preview_page.dart';
import 'package:dephalem/presents/widgets/preview_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presents/platforms/desktop/utilities_desktop.dart'
    if (dart.library.html) 'presents/platforms/web/utilities_web.dart'
    as utilities;

import 'presents/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await utilities.setMinWindowSize();
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
        initialRoute: PreviewPage.name,
        getPages: [
          GetPage(
              name: HomePage.name,
              page: () => const HomePage(),
              binding: BindingsBuilder.put(() => HomePageController())),
          GetPage(
              name: PreviewPage.name,
              page: () => const PreviewPage(),
              binding: BindingsBuilder.put(() => PreviewController())),
        ],
      );
}
