import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../widgets/preview_widget.dart';

class PreviewPage extends GetView<PreviewController> {
  static const name = '/preview';

  const PreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => PreviewWidget(controller);
}
