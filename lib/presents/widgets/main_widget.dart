import 'package:flutter/material.dart';

import 'like_widget.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(36, 43, 81, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              LikeWidget(),
              Text(
                'NIKE DUNK LOW RETRO BLACK',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  '₩',
                  style: TextStyle(
                    fontSize: 100,
                    color: Color(0xFF008db5),
                  ),
                ),
              ),
              Text(
                '298,000',
                style: TextStyle(
                  fontSize: 150,
                  color: Color(0xFF008db5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
