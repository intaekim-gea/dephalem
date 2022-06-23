import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: const Color(0xff031e64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 49),
            child: Text(
              'AIR JORDAN 4 MILITARY BLACK',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 49),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/q@3x.png',
                      scale: 3,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '328,000',
                      style: TextStyle(
                        color: Color(0xff94a4cc),
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '-2,000',
                  style: TextStyle(
                    color: Color(0xff94a4cc),
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
