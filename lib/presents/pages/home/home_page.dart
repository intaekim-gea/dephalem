import 'package:dephalem/presents/widgets/price_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../widgets/main_widget.dart';
import '../../widgets/price_widget.dart';

class HomePageController extends GetxController {}

class HomePage extends StatelessWidget {
  static const name = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MainWidget(),
            PriceWidget(PriceWidgetController()),
          ],
        ),
      ),
    );
  }
}
