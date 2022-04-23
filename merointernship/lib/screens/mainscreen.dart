import 'package:flutter/material.dart';
import 'package:merointernship/theme/color.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../utils/authenticationservice.dart';
import 'signupscreen.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Mero Internship",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: primarycolor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: primarycolor),
                      border: OutlineInputBorder(),
                      labelText: "Enter your username",
                      hintText: "Username",
                      labelStyle: TextStyle(
                        color: primarycolor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: primarycolor,
                      ),
                      border: OutlineInputBorder(),
                      labelText: "Enter your Password",
                      hintText: "Password",
                      labelStyle: TextStyle(
                        color: primarycolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                color: primarycolor,
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                }),
            SizedBox(
              height: 10,
            ),
            InkWell(
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Sign up',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 14))
                      ]),
                ),
                onTap: () {
                  Get.to(SignupScreen());
                }),
          ],
        ),
      )),
    );
  }
}
