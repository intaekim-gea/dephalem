import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Future<void> setMinWindowSize() async {
  if (GetPlatform.isDesktop) {
    await DesktopWindow.setMinWindowSize(const Size(1024, 600));
  }
}
