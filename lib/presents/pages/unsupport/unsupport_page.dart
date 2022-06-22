import 'package:flutter/material.dart';

class UnsupportPage extends StatelessWidget {
  final String name;

  const UnsupportPage(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text('${name.replaceAll('/', '')} is not supported'),
      );
}
