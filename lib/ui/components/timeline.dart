import 'package:flutter/material.dart';
import 'package:register/ui/components/circle-timeline.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleTimeline(
          active: 1 >= index,
          text: '1',
        ),
        Container(
          width: 40,
          height: 5,
          color: Colors.white,
        ),
        CircleTimeline(
          active: 2 >= index,
          text: '2',
        ),
        Container(
          width: 40,
          height: 5,
          color: Colors.white,
        ),
        CircleTimeline(
          active: 3 >= index,
          text: '3',
        ),
        Container(
          width: 40,
          height: 5,
          color: Colors.white,
        ),
        CircleTimeline(
          active: 4 >= index,
          text: '4',
        ),
      ],
    );
  }
}