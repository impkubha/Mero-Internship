import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/color.dart';
import '../utils/authenticationservice.dart';

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _cpasswprdController = TextEditingController();

class SignupScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 350,
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _cpasswprdController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: primarycolor,
                        ),
                        border: OutlineInputBorder(),
                        labelText: "Enter your Confirm Password",
                        hintText: "Confirm Password",
                        labelStyle: TextStyle(
                          color: primarycolor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                        child: Text(
                          "Signup",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: primarycolor,
                        onPressed: () {
                          context.read<AuthenticationService>().signUp(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                                cpassword: _cpasswprdController.text.trim(),
                              );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
