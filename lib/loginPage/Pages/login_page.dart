import 'package:flutter/material.dart';
import 'package:olly_olly_test/loginPage/l10n/login_page_l10n.dart';
import 'package:olly_olly_test/widgets/button_login_page.dart';
import 'package:olly_olly_test/widgets/text_field_login_page.dart';
import '../../homePage/Pages/home_page.dart';
import '../Controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController textFieldController = LoginController();
  final LoginPageL10n l10n = LoginPageL10n();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(27),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple,
              Colors.pinkAccent,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              l10n.textDescription,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            TextFieldLoginPage(
              text: l10n.textFieldEmail,
              private: false,
              controller: textFieldController.emailController,
            ),
            const SizedBox(height: 5),
            TextFieldLoginPage(
              text: l10n.textFieldPassword,
              private: true,
              controller: textFieldController.passwordController,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ButtonLoginPage(
                text: l10n.buttonLoginPage,
                onPressed: () {
                  var isValidUser = textFieldController.validateUser();

                  if(isValidUser){
                     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
                  }
                  else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.errorMessage)),
      );
    }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}