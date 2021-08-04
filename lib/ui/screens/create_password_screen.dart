import 'package:flutter/material.dart';
import 'package:register/ui/components/circle-timeline.dart';
import 'package:register/ui/components/long_button.dart';
import 'package:register/ui/components/password-requirement.dart';
import 'package:register/ui/components/timeline.dart';
import 'package:register/ui/screens/personal_info_screen.dart';
import 'package:register/utils/constants.dart';

class CreatePaswordScreen extends StatefulWidget {
  const CreatePaswordScreen({Key? key}) : super(key: key);

  @override
  _CreatePaswordScreenState createState() => _CreatePaswordScreenState();
}

class _CreatePaswordScreenState extends State<CreatePaswordScreen> {
  TextEditingController passwordController = TextEditingController();
  bool hide = true;
  int count = 0;
  List complexity = ["", "Very Weak", "Weak", "Strong", "Very Strong"];
  int complexLevel = 0;
  List indexComplexity = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: custom_blue,
        centerTitle: false,
        title: Text(
          "Create Password",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: custom_blue,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Timeline(
              index: 2,
            ),
            SizedBox(height: 30),
            Text("Create Password", style: white_800_20),
            SizedBox(height: 6),
            Text("Password will be used to login account",
                style: white_normal_14),
            SizedBox(height: 30),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: hide,
                onChanged: (value) {
                  int counter = 0;
                  List index = [false, false, false, false];
                  if (value.length > 4) {
                    if (value.length >= 9) {
                      index[3] = true;
                      counter++;
                    }
                    if (value.contains(RegExp(r"[0-9]"))) {
                      index[2] = true;
                      counter++;
                    }
                    if (RegExp(r"[A-Z]").hasMatch(value)) {
                      index[1] = true;
                      counter++;
                    }
                    if (RegExp(r"[a-z]").hasMatch(value)) {
                      index[0] = true;
                      counter++;
                    }
                  }

                  setState(() {
                    indexComplexity = index;
                    complexLevel = counter;
                  });
                },
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        icon: Icon(
                          hide ? Icons.remove_red_eye : Icons.remove_red_eye,
                          color: hide ? Colors.grey : custom_blue,
                        )),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(height: 15),
            RichText(
                text: TextSpan(
                    text: "Complexity : ",
                    style: white_normal_14,
                    children: [
                  TextSpan(
                      text: "${complexity[complexLevel]}",
                      style: complexLevel > 2 ? green_600_14 : orange_600_14)
                ])),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PasswordRequirement(
                  complete: indexComplexity[0],
                  text: "a",
                  name: "Lowercase",
                ),
                PasswordRequirement(
                  complete: indexComplexity[1],
                  text: "A",
                  name: "Uppercase",
                ),
                PasswordRequirement(
                  complete: indexComplexity[2],
                  text: "123",
                  name: "Numeric",
                ),
                PasswordRequirement(
                  complete: indexComplexity[3],
                  text: "9+",
                  name: "Characters",
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 40, right: 20, left: 20),
        child: LongButton(
            bgColor: complexLevel > 2 ? custom_blue_disable : custom_blue,
            textColor: Colors.white,
            loading: false,
            width: size.width,
            title: "Next",
            onClick: () {
              if (complexLevel > 2)
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PersonalInformationScreen()));
            }),
      ),
    );
  }
}
