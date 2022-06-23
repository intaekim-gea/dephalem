import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'like_widget.dart';
import 'main_widget_controller.dart';

class BagWidget extends StatelessWidget {
  final MainWidgetController controller;
  const BagWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Padding(
        padding: EdgeInsets.zero,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => SizedBox(
                  height: 500,
                  child: Stack(
                    children: [
                      Positioned(child: LikeWidget(controller.favorite.value)),
                      Positioned(
                        right: 40,
                        top: 40,
                        child: Text(
                          controller.name.value,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 40,
                        top: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Text(
                                '\$',
                                style: TextStyle(
                                  fontFamily: 'GoudyBookLetter',
                                  fontSize: 100,
                                  color: Color(0xFF847900),
                                ),
                              ),
                            ),
                            Text(
                              controller.price.value,
                              style: const TextStyle(
                                fontFamily: 'GoudyBookLetter',
                                fontSize: 180,
                                color: Color(0xFF847900),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      );
}