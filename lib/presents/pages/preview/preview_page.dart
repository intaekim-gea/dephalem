import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controllers/camera_controller_web.dart';
import '../../widgets/preview_widget_web.dart';

class PreviewPage extends GetView<CameraControllerWeb> {
  const PreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => PreviewWidget(controller);
}
