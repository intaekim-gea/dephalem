import 'package:dephalem/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'widgets/like_widget.dart';
import 'widgets/price_widget.dart';

class TestHomeController extends GetxController {}

class TestHome extends StatelessWidget {
  const TestHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MainWidget(),
            PriceWidget(),
          ],
        ),
      ),
    );
  }
}
