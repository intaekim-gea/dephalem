import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/serial_controller_web.dart';

class SerialWidget extends StatelessWidget {
  final SerialControllerWeb controller;

  const SerialWidget(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => controller.obx(
        (state) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: controller.received.map((e) => Text(e)).toList(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Send'),
              onPressed: () {
                controller.writeToPort();
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Receive'),
              onPressed: () {
                controller.readFromPort();
              },
            ),
          ],
        ),
      );
}
