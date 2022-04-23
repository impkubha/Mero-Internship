import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merointernship/main.dart';
import 'package:merointernship/theme/color.dart';
import 'package:merointernship/utils/authenticationservice.dart';
import 'package:merointernship/widgets/bottomnavbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';

bool status = false;

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      bottomNavigationBar: bottomNavigationBar(),
      body: ListView(children: [
        Padding(padding: EdgeInsets.all(10)),
        MaterialButton(
          onPressed: () {
            context.read<AuthenticationService>().signOut();
          },
          color: primarycolor,
          child: Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        FlutterSwitch(
            value: status,
            onToggle: (value) {
              setState(() {
                status = value;
                ThemeData.dark();
              });
            })
      ]),
    );
  }
}
