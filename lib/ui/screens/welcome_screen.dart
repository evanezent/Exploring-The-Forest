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
            Positioned(
                top: size.height * 0.33,
                child: Container(
                  width: size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to",
                        style: black_bold_30,
                      ),
                      SizedBox(height: 5),
                      RichText(
                          text: TextSpan(
                              text: "GIN",
                              style: black_bold_30,
                              children: [
                            TextSpan(text: " Finans", style: blue_bold_30)
                          ])),
                      SizedBox(height: 20),
                      Text(
                        "Welcome to The Bank of The Future. Manage and track your accounts on the go.",
                        style: black_semi_16,
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
