import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import '../models/goods.dart';

class GoodsController extends GetxController with StateMixin<Goods> {
  final connect = GetConnect();
  Goods get goods => value!;

  @override
  void onInit() {
    super.onInit();
    append(() => fetch);
  }

  Future<Goods> fetch() async {
    final response = await connect.get<Goods>(
      'http://192.168.1.42:8080/data.json',
      decoder: (data) => Goods.fromJson(data),
    );
    final goods = response.body;
    if (goods != null) {
      return goods;
    } else {
      return await _createDefault();
    }
  }
}

Future<Goods> _createDefault() async {
  final string = await rootBundle.loadString('assets/default.json');
  return goodsFromJson(string);
}
