import 'package:flutter/material.dart';
import 'package:register/ui/components/circle-ripple.dart';
import 'package:register/ui/components/circle-timeline.dart';
import 'package:register/ui/components/curve-wave.dart';
import 'package:register/ui/components/long_button.dart';
import 'package:register/ui/components/password-requirement.dart';
import 'package:register/ui/components/timeline.dart';
import 'package:register/utils/constants.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with TickerProviderStateMixin {
  TextEditingController passwordController = TextEditingController();
  bool hide = true;
  String choosedIncome = "0";
  String choosedExpense = "0";
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget rippleComponents() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                Color.lerp(Colors.white, custom_blue_disable, 0.6)!,
                Colors.white,
              ],
            ),
          ),
          child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: CurveWave(),
                ),
              ),
              child: Container(
                padding:EdgeInsets.all(2),
                color: Colors.white,
                child: Icon(
                  Icons.calendar_today_sharp,
                  color: custom_blue,
                  size: 30,
                ),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: custom_blue,
        centerTitle: false,
        title: Text(
          "Create Account",
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
            Center(
                child: CustomPaint(
              painter: CirclePainter(
                _animationController,
                color: Colors.white,
              ),
              child: SizedBox(
                width: 100,
                height: 100,
                child: rippleComponents(),
              ),
            )),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 20),
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
            Container(
              height: 50,
              margin: EdgeInsets.only(top: 20),
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ScheduleScreen()));
            }),
      ),
    );
  }
}
