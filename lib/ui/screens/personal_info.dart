import 'package:flutter/material.dart';
import 'package:register/ui/components/circle-timeline.dart';
import 'package:register/ui/components/long_button.dart';
import 'package:register/ui/components/password-requirement.dart';
import 'package:register/ui/components/timeline.dart';
import 'package:register/utils/constants.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  _PersonalInformationScreenState createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  bool _goalValidator = false;
  bool hide = true;
  String choosedIncome = "0";
  String choosedExpense = "0";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: custom_blue,
        centerTitle: false,
        title: Text(
          "Personal Information",
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
              index: 3,
            ),
            SizedBox(height: 30),
            Text("Personal Information", style: white_800_20),
            SizedBox(height: 6),
            Text(
                "Please fill in the information below and your goal for digital saving.",
                style: white_normal_14),
            SizedBox(height: 30),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: goalController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    _goalValidator = value.length != 0;
                  });
                },
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    labelText: "Goal for activation",
                    contentPadding:
                        EdgeInsets.only(bottom: 4, right: 8, left: 8),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: custom_blue, width: 1.0),
                    ),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    labelStyle: TextStyle(),
                    labelText: 'Monthly Income'),
                items: [
                  DropdownMenuItem(
                    child: new Text("- Choose Option -"),
                    value: "0",
                  ),
                  DropdownMenuItem(
                    child: new Text("< 1.000.000"),
                    value: "1",
                  ),
                  DropdownMenuItem(
                    child: new Text("1.000.000 - 3.000.000"),
                    value: "2",
                  ),
                  DropdownMenuItem(
                    child: new Text("3.000.001 - 8.000.000"),
                    value: "3",
                  ),
                  DropdownMenuItem(
                    child: new Text("> 8.000.000"),
                    value: "4",
                  ),
                ],
                value: choosedIncome,
                onChanged: (value) {
                  setState(() {
                    choosedIncome = value.toString();
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none),
                    labelStyle: TextStyle(),
                    labelText: 'Monthly Expense'),
                items: [
                  DropdownMenuItem(
                    child: new Text("- Choose Option -"),
                    value: "0",
                  ),
                  DropdownMenuItem(
                    child: new Text("< 500.000"),
                    value: "1",
                  ),
                  DropdownMenuItem(
                    child: new Text("500.000 - 2.000.000"),
                    value: "2",
                  ),
                  DropdownMenuItem(
                    child: new Text("2.000.001 - 5.000.000"),
                    value: "3",
                  ),
                  DropdownMenuItem(
                    child: new Text("5.000.001 - 8.000.000"),
                    value: "4",
                  ),
                  DropdownMenuItem(
                    child: new Text("> 8.000.000"),
                    value: "5",
                  ),
                ],
                value: choosedExpense,
                onChanged: (value) {
                  setState(() {
                    choosedExpense = value.toString();
                  });
                },
              ),
            ),
            SizedBox(height: 15),
            RichText(
                text: TextSpan(
                    text: "Complexity : ",
                    style: white_normal_14,
                    children: [
                  TextSpan(text: "Very Weak", style: orange_600_14)
                ])),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PasswordRequirement(
                  complete: false,
                  text: "a",
                  name: "Lowercase",
                ),
                PasswordRequirement(
                  complete: false,
                  text: "A",
                  name: "Uppercase",
                ),
                PasswordRequirement(
                  complete: false,
                  text: "123",
                  name: "Numeric",
                ),
                PasswordRequirement(
                  complete: false,
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
            bgColor: custom_blue_disable,
            textColor: Colors.white,
            loading: false,
            width: size.width,
            title: "Next",
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PersonalInformationScreen()));
            }),
      ),
    );
  }
}
