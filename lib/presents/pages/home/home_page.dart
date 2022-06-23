import 'package:dephalem/controllers/camera_controller_web.dart';
import 'package:dephalem/presents/widgets/preview_widget_web.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/goods_controller.dart';
import '../../../controllers/line_chart_controller.dart';
import '../../../models/goods.dart';
import '../../widgets/line_chart_widget.dart';
import '../../widgets/main_widget.dart';
import '../../widgets/main_widget_controller.dart';

class HomePageController extends GetxController {
  final cameraController = Get.put(CameraControllerWeb());
  final goodsController = Get.find<GoodsController>();
  final mainWidgetController = MainWidgetController();
  final chartController = Get.find<LineChartController>();

  final selectedGood = Good(name: '', price: [], popularity: []).obs;

  @override
  void onInit() {
    super.onInit();
    if (goodsController.state != null) {
      _setupValues();
    } else {
      goodsController.addListener(() => _setupValues());
    }
    cameraController.setupCamera();
  }

  void _setupValues() {
    ever(selectedGood, ((Good selectedGood) {
      mainWidgetController.setGood(selectedGood);
    }));
    selectedGood.value = goodsController.goods.shoe;
  }
}

class HomePage extends GetView<HomePageController> {
  static const name = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Scaffold(
        body: Center(
          child: controller.goodsController.obx(
            (state) => Stack(
              children: [
                // PreviewWidget(controller.cameraController),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainWidget(controller.mainWidgetController),
                    const SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: LineChartWidget(),
                    ),
                  ],
                ),
              ],
            ),
            onLoading: Container(),
          ),
        ),
      ),
    );
  }
}
