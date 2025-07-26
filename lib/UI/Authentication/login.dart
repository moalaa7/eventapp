import 'package:eventapp/UI/Widgets/custom_button.dart';
import 'package:eventapp/UI/Widgets/custom_text_formfield.dart';
import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_routes.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:eventapp/Utilis/dialog_utilis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.05),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    AppAsset.eventlylogoPrimaryColor,
                    height: height * 0.2,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    prefixIcon: Icon(Icons.email),
                    hintText: AppLocalizations.of(context)!.email,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: AppLocalizations.of(context)!.password,
                    suffixIcon: Icon(Icons.visibility_off),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            textAlign: TextAlign.end,
                            AppLocalizations.of(context)!.forgot_password,
                            style: AppStyle.bold16primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.primaryLightColor,
                            ),
                          )),
                    ],
                  ),
                  CustomButton(
                      onpressed: login,
                      text: AppLocalizations.of(context)!.login),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dont_have_an_account,
                        style: Theme.of(context)
                            .copyWith()
                            .textTheme
                            .headlineLarge,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.signupRouteName);
                          },
                          child: Text(
                            textAlign: TextAlign.end,
                            AppLocalizations.of(context)!.sign_up,
                            style: AppStyle.bold20primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.primaryLightColor,
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Divider(
                        indent: width * 0.03,
                        endIndent: width * 0.03,
                        color: AppColor.primaryLightColor,
                        thickness: 2,
                      )),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: AppStyle.bold18primary,
                      ),
                      Expanded(
                          child: Divider(
                        indent: width * 0.03,
                        endIndent: width * 0.03,
                        color: AppColor.primaryLightColor,
                        thickness: 2,
                      )),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.015),
                          backgroundColor: AppColor.transparentColor,
                          shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: AppColor.primaryLightColor),
                              borderRadius: BorderRadius.circular(16))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppAsset.googleLogo),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            AppLocalizations.of(context)!.login_with_google,
                            style: AppStyle.bold18primary,
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtilis.showLoading(context: context, loadingText: 'Loading...');
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);

        DialogUtilis.hideLoading(context: context);
        DialogUtilis.showMessage(
          postActionName: "ok",
          posAction: () {
            Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
            // Navigator.pushNamed(context, AppRoutes.homeRouteName);
          },
          context: context,
          message: AppLocalizations.of(context)!.login_success,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          DialogUtilis.hideLoading(context: context);
          DialogUtilis.showMessage(
              context: context, message: 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          DialogUtilis.hideLoading(context: context);
          DialogUtilis.showMessage(
              context: context,
              message: 'Wrong password provided for that user.');
        }
      } catch (e) {
        DialogUtilis.hideLoading(context: context);
        DialogUtilis.showMessage(context: context, message: e.toString());
      }
    }
  }
}
