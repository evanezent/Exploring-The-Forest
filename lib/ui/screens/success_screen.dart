import 'package:flutter/material.dart';
import 'package:register/utils/constants.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: custom_blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: custom_blue_disable,
                borderRadius: BorderRadius.circular(50)),
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(45)),
              child: Icon(Icons.check, size: 40, color: custom_blue),
            ),
          )
        ],
      ),
    );
  }
}
