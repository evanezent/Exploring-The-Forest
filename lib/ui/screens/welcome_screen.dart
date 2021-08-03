import 'package:flutter/material.dart';
import 'package:register/ui/components/shape_background.dart';
import 'package:register/utils/constants.dart';

class WelcomScreen extends StatefulWidget {
  WelcomScreen({Key? key}) : super(key: key);

  @override
  _WelcomScreenState createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: custom_blue,
        body: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: CustomPaint(
                painter: CurvePainter(),
              ),
            ),
          ],
        ));
  }
}


