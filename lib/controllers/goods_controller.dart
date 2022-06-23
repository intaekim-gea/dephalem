import 'dart:async';

import 'package:get/get.dart';

import '../models/goods.dart';

class GoodsController extends GetxController {
  // http://192.168.1.42:8080/data.json
  final connect = GetConnect();
  final goods = Goods(
    shoe: Good(name: '', goods: [], popularity: []),
    pokemon: Good(name: '', goods: [], popularity: []),
    favorites: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    startPolling(0);
  }

  Future<void> fetch() async {
    final response = await connect.get<Goods>(
      'http://192.168.1.42:8080/data.json',
      decoder: (data) => Goods.fromJson(data),
    );
    final goods = response.body;
    if (goods != null) {
      this.goods.value = goods;
      print('object');
    }
  }

  Future<void> startPolling(int seconds) {
    final completer = Completer();
    Future.delayed(Duration(seconds: seconds), () async {
      try {
        await fetch();
      } catch (_) {}
      startPolling(2);
      completer.complete();
    });
    return completer.future;
  }
}
