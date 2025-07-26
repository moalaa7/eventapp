import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final Color borderColor;
  final Color errorborderColor;
  String? hintText;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController controller;
  int? maxlines;
  Validator? validation;
  CustomTextFormField(
      {super.key,
     this.validation,
      this.maxlines,
      required this.controller,
      this.hintStyle = AppStyle.bold16gray,
      this.hintText,
      this.errorborderColor = AppColor.redColor,
      this.borderColor = AppColor.grayColor,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
   
    return TextFormField(
      validator: validation,
      maxLines: maxlines,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: prefixIcon,
          prefixIconColor: borderColor,
          suffixIcon: suffixIcon,
          suffixIconColor: borderColor,
          focusedErrorBorder: builtBorder(borderColor: errorborderColor),
          errorBorder: builtBorder(borderColor: errorborderColor),
          focusedBorder: builtBorder(borderColor: borderColor),
          enabledBorder: builtBorder(borderColor: borderColor)),
    );
  }

  OutlineInputBorder builtBorder({required Color borderColor}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 2, color: borderColor));
  }
}
