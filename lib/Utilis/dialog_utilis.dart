import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:flutter/material.dart';

class DialogUtilis {
  static void hideLoading({required BuildContext context}) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      required String message,
      String? postActionName,
      Function? posAction}) {
    List<Widget>? actions = [];
    if (postActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            posAction?.call();
          },
          child: Text(postActionName)));
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: actions,
        backgroundColor: AppColor.whiteColor,
        content: Text(
          message,
          style: AppStyle.bold18gray,
        ),
      ),
    );
  }

  static void showLoading(
      {required BuildContext context, required String loadingText}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.whiteColor,
        content: Row(
          children: [
            CircularProgressIndicator(
              color: AppColor.primaryLightColor,
            ),
            Text(
              loadingText,
              style: AppStyle.bold18gray,
            )
          ],
        ),
      ),
    );
  }
}
