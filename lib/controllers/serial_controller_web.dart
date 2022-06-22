import 'dart:typed_data';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:get/get.dart';
import 'package:serial/serial.dart';

class SerialControllerWeb extends GetxController with StateMixin<bool> {
  late SerialPort port;
  final received = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    append(() => _setupSerial);
  }

  Future<bool> _setupSerial() async {
    final port = await window.navigator.serial.requestPort();
    await port.open(SerialOptions(baudRate: 115200));
    this.port = port;
    return true;
  }

  Future<void> writeToPort() async {
    if (value == null) {
      throw UnimplementedError();
    }

    final writer = port.writable.writer;
    await writer.ready;
    await writer.write(Uint8List.fromList('Hello World.'.codeUnits));

    await writer.ready;
    await writer.close();
  }

  Future<void> readFromPort() async {
    if (value == null) {
      throw UnimplementedError();
    }

    final reader = port.readable.reader;

    while (true) {
      final result = await reader.read();
      final text = String.fromCharCodes(result.value);
      received.add(text);
    }
  }
}
