import 'package:flutter/material.dart';
import 'package:register/ui/components/long_button.dart';
import 'package:register/ui/screens/welcome_screen.dart';
import 'package:register/utils/constants.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: custom_blue,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              height: 250,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: custom_blue_disable,
                  borderRadius: BorderRadius.circular(200)),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(150)),
                child: Icon(Icons.check, size: 120, color: custom_blue),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Success", style: white_800_20),
            SizedBox(
              height: 10,
            ),
            Text("The schedule will be sent to your email!",
                style: white_normal_14)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 40, right: 20, left: 20),
        child: LongButton(
            bgColor: custom_blue_disable,
            textColor: Colors.white,
            loading: false,
            width: size.width,
            title: "OK",
            onClick: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => WelcomScreen()));
            }),
      ),
    );
  }
}
