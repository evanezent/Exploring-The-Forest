import 'package:flutter/material.dart';
import 'package:register/ui/components/long_button.dart';
import 'package:register/ui/components/shape_background.dart';
import 'package:register/utils/constants.dart';

class WelcomScreen extends StatefulWidget {
  WelcomScreen({Key? key}) : super(key: key);

  @override
  _WelcomScreenState createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  TextEditingController emailController = TextEditingController();
  bool _emailValidator = false;

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
                      SizedBox(height: 40),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              contentPadding:
                                  EdgeInsets.only(bottom: 4, right: 8, left: 8),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    BorderSide(color: custom_blue, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                      SizedBox(height: 30),
                      LongButton(
                          bgColor: custom_blue_disable,
                          textColor: Colors.white,
                          loading: false,
                          width: size.width,
                          title: "Next",
                          onClick: () {
                            print("KLIK");
                          })
                    ],
                  ),
                ))
          ],
        ));
  }
}
