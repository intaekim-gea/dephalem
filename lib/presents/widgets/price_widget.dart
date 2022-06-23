import 'package:flutter/material.dart';

import 'price_widget_controller.dart';

class PriceWidget extends StatelessWidget {
  final PriceWidgetController controller;
  const PriceWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: const Color(0xff031e64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 49),
            child: Text(
              controller.name.value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 49),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/q@3x.png',
                      scale: 3,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      controller.price.value,
                      style: const TextStyle(
                        color: Color(0xff94a4cc),
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Text(
                  controller.delta.value,
                  style: const TextStyle(
                    color: Color(0xff94a4cc),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
