import 'package:dephalem/presents/widgets/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingPageController extends GetxController {
  final String route;
  LoadingPageController(this.route);

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 5), (() {
      Get.toNamed(route);
    }));
  }
}

class LoadingPage extends StatelessWidget {
  static const name = '/loading';

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const ProgressWidget(),
    );
  }
}
