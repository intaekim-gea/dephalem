import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/goods.dart';

class MainWidgetController extends GetxController {
  final name = ''.obs;
  final price = ''.obs;
  final favorite = ''.obs;

  void setGood(Good good) {
    name.value = good.name;
    price.value = NumberFormat.simpleCurrency(name: '').format(good.price.last);
    favorite.value = '${good.popularity.last.toInt()}';
  }

  @override
  void onInit() {
    super.onInit();
  }
}
