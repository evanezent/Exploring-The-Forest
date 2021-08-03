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
      radius: 24,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        backgroundColor: active ? custom_blue : Colors.white,
        radius: 20,
        child: Text(
          '$text',
          style:
              TextStyle(color: active ? Colors.white : custom_blue, fontSize: 20),
        ),
      ),
    );
  }
}
