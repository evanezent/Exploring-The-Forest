import 'package:flutter/material.dart';
import 'package:register/utils/constants.dart';

class CircleTimeline extends StatelessWidget {
  const CircleTimeline({Key? key, required this.active, this.text})
      : super(key: key);
  final bool active;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: active ? custom_blue : Colors.white,
      child: Text(
        '$text',
        style:
            TextStyle(color: active ? Colors.white : custom_blue, fontSize: 20),
      ),
    );
  }
}
