import 'package:flutter/material.dart';
import 'package:merointernship/theme/color.dart';
import 'package:provider/provider.dart';

import '../utils/authenticationservice.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: primarycolor,
              ),
              accountName: Text("Pradeep Khadka"),
              accountEmail: Text("impkubha@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("/pk.jpg"),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Logout',
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
