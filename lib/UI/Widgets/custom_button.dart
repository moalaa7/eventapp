import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onpressed;
  String text;
  CustomButton({
    required this.onpressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: height * 0.015),
            backgroundColor: AppColor.primaryLightColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: onpressed,
        child: Text(
          text,
          style: AppStyle.bold20white,
        ));
  }
}
