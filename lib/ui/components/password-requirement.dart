import 'package:flutter/material.dart';
import 'package:register/utils/constants.dart';

class PasswordRequirement extends StatelessWidget {
  const PasswordRequirement(
      {Key? key,
      required this.complete,
      required this.text,
      required this.name})
      : super(key: key);

  final bool complete;
  final String text, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !complete
            ? Text("$text", style: white_800_30)
            : Icon(
                Icons.check_circle_rounded,
                color: custom_green,
                size: 36,
              ),
        Text("$name", style: white_normal_12),
      ],
    );
  }
}
