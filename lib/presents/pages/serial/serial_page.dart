import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/serial_controller_web.dart';
import '../../widgets/serial_widget_web.dart';

class SerialPage extends GetView<SerialControllerWeb> {
  const SerialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SerialWidget(controller);
}
