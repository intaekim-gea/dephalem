import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LikeWidget extends StatelessWidget {
  const LikeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Lottie.asset('assets/lotties/6523-like.json'),
        const SizedBox(width: 10),
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
