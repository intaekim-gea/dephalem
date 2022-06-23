import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../widgets/line_chart_widget.dart';

class LineChartController extends GetxController {}

class LineChartPage extends GetView<LineChartController> {
  static const name = '/chart';
  const LineChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LineChartWidget();
}
