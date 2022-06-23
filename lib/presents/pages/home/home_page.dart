import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/goods_controller.dart';
import '../../../models/goods.dart';
import '../../widgets/main_widget.dart';
import '../../widgets/main_widget_controller.dart';
import '../../widgets/price_widget.dart';
import '../../widgets/price_widget_controller.dart';

class HomePageController extends GetxController {
  final goodsController = Get.find<GoodsController>();
  final mainWidgetController = MainWidgetController();
  final priceWidgetController = PriceWidgetController();

  final selectedGood = Good(name: '', price: [], popularity: []).obs;

  @override
  void onInit() {
    super.onInit();
    if (goodsController.state != null) {
      _setupValues();
    } else {
      goodsController.addListener(() => _setupValues());
    }
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
    return Scaffold(
      body: Center(
        child: controller.goodsController.obx(
          (state) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainWidget(controller.mainWidgetController),
              PriceWidget(controller.priceWidgetController),
            ],
          ),
        ),
      ),
    );
  }
}
