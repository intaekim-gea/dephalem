import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PriceWidgetController extends GetxController {
  final name = 'AIR JORDAN 4 MILITARY BLACK'.obs;
  final delta = ''.obs;
  final price = ''.obs;

  @override
  void onInit() {
    super.onInit();
    setDelta(-2000.0);
    setPrice(298000.0);
  }

  void setDelta(double delta) {
    final format = NumberFormat.simpleCurrency(name: '');
    this.delta.value = format.format(delta);
  }

  void setPrice(double price) {
    final format = NumberFormat.simpleCurrency(name: '');
    this.price.value = format.format(price);
  }
}
