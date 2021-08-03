import 'package:flutter/material.dart';
import 'package:register/ui/components/circle-timeline.dart';
import 'package:register/ui/components/timeline.dart';
import 'package:register/utils/constants.dart';

class CreatePaswordScreen extends StatefulWidget {
  const CreatePaswordScreen({Key? key}) : super(key: key);

  @override
  _CreatePaswordScreenState createState() => _CreatePaswordScreenState();
}

class _CreatePaswordScreenState extends State<CreatePaswordScreen> {
  @override
  Widget build(BuildContext context) {
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
        body: ListView(
          children: [
            Timeline(
              index: 2,
            )
          ],
        ));
  }
}


