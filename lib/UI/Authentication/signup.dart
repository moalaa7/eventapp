import 'package:eventapp/UI/Widgets/custom_button.dart';
import 'package:eventapp/UI/Widgets/custom_text_formfield.dart';
import 'package:eventapp/Utilis/app_assets.dart';
import 'package:eventapp/Utilis/app_color.dart';
import 'package:eventapp/Utilis/app_style.dart';
import 'package:eventapp/Utilis/dialog_utilis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController rePasswordController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.register,
          style: AppStyle.bold20primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
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
                    controller: nameController,
                    prefixIcon: Icon(Icons.person),
                    hintText: AppLocalizations.of(context)!.username,
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
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextFormField(
                    controller: rePasswordController,
                    hintText: AppLocalizations.of(context)!.re_password,
                    suffixIcon: Icon(Icons.visibility_off),
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomButton(
                      onpressed: register,
                      text: AppLocalizations.of(context)!.sign_up),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.already_have_an_account,
                        style: Theme.of(context)
                            .copyWith()
                            .textTheme
                            .headlineLarge,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            textAlign: TextAlign.end,
                            AppLocalizations.of(context)!.login,
                            style: AppStyle.bold20primary.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColor.primaryLightColor,
                            ),
                          )),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (formKey.currentState?.validate() == true) {
      DialogUtilis.showLoading(context: context, loadingText: 'Loading.....');
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        DialogUtilis.hideLoading(context: context);
        DialogUtilis.showMessage(
            context: context,
            message: AppLocalizations.of(context)!.register_success);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
               DialogUtilis.hideLoading(context: context);
        DialogUtilis.showMessage(
            context: context,
            message: 'The password provided is too weak.');
        
        } else if (e.code == 'email-already-in-use') {
           DialogUtilis.hideLoading(context: context);
        DialogUtilis.showMessage(
            context: context,
            message: 'The account already exists for that email.');
          
        }
      } catch (e) {   DialogUtilis.hideLoading(context: context);
        DialogUtilis.showMessage(
            context: context,
            message:e.toString());
       
      }
    }
  }
}
