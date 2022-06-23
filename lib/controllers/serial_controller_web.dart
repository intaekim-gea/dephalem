import 'dart:async';
import 'dart:typed_data';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:get/get.dart';
import 'package:serial/serial.dart';

class SerialControllerWeb extends GetxController {
  SerialPort? port;
  final received = <String>[].obs;

  Future<bool> openPort() async {
    if (this.port != null) {
      return true;
    }

    final port = await window.navigator.serial.requestPort();
    await port.open(SerialOptions(baudRate: 9600));
    this.port = port;

    return true;
  }

  Future<void> writeToPort() async {
    if (port == null) {
      throw UnimplementedError();
    }

    final text = Uint8List.fromList('Hello World.'.codeUnits);
    final writer = port!.writable.writer;
    await writer.ready;
    await writer.write(text);

    await writer.ready;
    await writer.close();
  }

  Future<void> readFromPort() async {
    if (port == null) {
      throw UnimplementedError();
    }

    final reader = port!.readable.reader;

    while (true) {
      final result = await reader.read();
      final text = String.fromCharCodes(result.value);
      received.add(text);
    }
  }
}
