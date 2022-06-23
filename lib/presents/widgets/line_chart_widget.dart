import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/line_chart_controller.dart';

class LineChartWidget extends GetView<LineChartController> {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(color: Color(0xff232d37)),
          child: Obx(
            () => LineChart(
              controller.lineChartData.value,
            ),
          ),
        ),
      ],
    );
  }
}
