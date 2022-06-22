import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presents/platforms/utilities_desktop.dart'
    if (dart.library.html) 'presents/platforms/utilities_web.dart';

import 'presents/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setMinWindowSize();
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
          createPreviewPage('/preview'),
          createSerialPage('/serial'),
        ],
      );
}
