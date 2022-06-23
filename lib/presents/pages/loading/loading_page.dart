import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoadingPageController extends GetxController {}

class LoadingPage extends StatelessWidget {
  static const name = '/loading';

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Stack(
            children: [
              Positioned(
                left: 50,
                top: 100,
                child: SizedBox(width: 350, height: 350, child: Lottie.asset('lotties/lf30_editor_hpgd11wb.json'))
            ),
              Positioned(
                  left: 200,
                  top: 300,
                  child: SizedBox(width: 700, height: 700, child: Lottie.asset('lotties/lf30_editor_kdxtwpsm.json'))
              ),
              Positioned(
                  left: 900,
                  top: 600,
                  child: SizedBox(width: 550, height: 550, child: Lottie.asset('lotties/lf30_editor_kl2meq0q.json'))
              ),
              Positioned(
                  left: 700,
                  top: 0,
                  child: SizedBox(width: 850, height: 850, child: Lottie.asset('lotties/lf30_editor_nru4gtmr.json'))
              ),
            ],
          ),
        );
      }),
    );
  }
}