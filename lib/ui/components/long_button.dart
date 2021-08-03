import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  const LongButton({
    Key? key,
    required this.width,
    required this.title,
    required this.onClick,
    this.bgColor: Colors.white,
    this.textColor: Colors.black,
    this.loading: false,
  }) : super(key: key);

  final double width;
  final VoidCallback onClick;
  final String title;
  final Color bgColor, textColor;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8.0),
        primary: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: AnimatedContainer(
        width: loading ? 80 : width,
        height: size.height >= 800 ? size.height * 0.03 : size.height * 0.047,
        duration: Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn,
        child: Center(
            child: loading
                ? CircularProgressIndicator(
                    backgroundColor: bgColor,
                    valueColor: AlwaysStoppedAnimation(textColor),
                  )
                : Text(
                    title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: textColor),
                  )),
      ),
    );
  }
}
