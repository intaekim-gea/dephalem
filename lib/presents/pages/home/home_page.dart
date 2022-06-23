import 'package:dephalem/controllers/camera_controller_web.dart';
import 'package:dephalem/presents/widgets/bag_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/goods_controller.dart';
import '../../../controllers/line_chart_controller.dart';
import '../../../models/goods.dart';
import '../../widgets/line_chart_widget.dart';
import '../../widgets/main_widget.dart';
import '../../widgets/main_widget_controller.dart';
import '../../widgets/progress_widget.dart';

class HomePageController extends GetxController {
  final cameraController = Get.put(CameraControllerWeb());
  final goodsController = Get.find<GoodsController>();
  final mainWidgetController = MainWidgetController();
  final chartController = Get.find<LineChartController>();

  final selectedGood = Good(name: '', price: [], popularity: []).obs;
  final beingProcess = false.obs;

  @override
  void onInit() {
    super.onInit();
    goodsController.fetch().then((value) async {
      await cameraController.setupCamera();
      _setupValues();
    });
  }

  void _setupValues() {
    ever(selectedGood, ((Good selectedGood) {
      mainWidgetController.setGood(selectedGood);
      chartController.setGood(selectedGood);
    }));
    selectedGood.value = goodsController.goods.value.shoe;
  }
}

class HomePage extends GetView<HomePageController> {
  static const name = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (tabupDetail) {
        controller.cameraController.capture();
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              // PreviewWidget(controller.cameraController),
              Obx(
                () {
                  if (controller.beingProcess.value == true) {
                    return Container(
                      color: Colors.black,
                      child: const ProgressWidget(),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // BagWidget(controller.mainWidgetController),
                      Obx(() {
                        bool isBag = controller.selectedGood.value.name ==
                            controller.goodsController.goods.value.bag.name;
                        if (isBag) {
                          return BagWidget(controller.mainWidgetController);
                        } else {
                          return MainWidget(controller.mainWidgetController);
                        }
                      }),
                      const SizedBox(
                        width: double.infinity,
                        height: 120,
                        child: LineChartWidget(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
