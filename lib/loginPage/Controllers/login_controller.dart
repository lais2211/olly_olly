import 'package:flutter/material.dart';
import 'package:olly_olly_test/loginPage/l10n/login_page_l10n.dart';

class LoginController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final LoginPageL10n l10n = LoginPageL10n();


  bool validateUser() {
    if (emailController.text == 'test@gmail.com' && passwordController.text == '123@') {
      return true;
    } else{
      return false;
    }
  }
}