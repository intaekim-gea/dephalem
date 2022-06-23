import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'like_widget.dart';
import 'main_widget_controller.dart';

class MainWidget extends StatelessWidget {
  final MainWidgetController controller;
  const MainWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(36, 43, 81, 0),
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LikeWidget(controller.favorite.value),
                  Text(
                    controller.name.value,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    '₩',
                    style: TextStyle(
                      fontSize: 100,
                      color: Color(0xFF008db5),
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    controller.price.value,
                    style: const TextStyle(
                      fontSize: 150,
                      color: Color(0xFF008db5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
