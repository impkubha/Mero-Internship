import 'package:flutter/material.dart';
import 'package:merointernship/widgets/bottomnavbar.dart';
import 'package:merointernship/widgets/progressbar.dart';
import 'package:merointernship/widgets/recommended.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavigationBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage("/pk.jpg"),
                  minRadius: 50,
                ),
              ),
              Text(
                "Pradeep Khadka",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text("UI/UX Designer",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Profile Completeness",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text(
                    "70%",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              myProgressBar(),
              Divider(),
              Text(
                "Recommended Jobs",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              recommendedList(),
            ],
          ),
        ));
  }
}
