import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LikeWidget extends StatelessWidget {
  const LikeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 130,
            height: 130,
            child: Lottie.asset('assets/lotties/lf30_editor_7qj5ddd1.json')),
        const SizedBox(width: 0),
        const Text(
          '355',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
