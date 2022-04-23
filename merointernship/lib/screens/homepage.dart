import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merointernship/data/post.dart';
import 'package:merointernship/screens/profilescreen.dart';
import 'package:merointernship/screens/search.dart';
import 'package:merointernship/theme/color.dart';
import 'package:merointernship/widgets/contentbar.dart';
import 'package:merointernship/widgets/recommended.dart';
import '../utils/remote_services.dart';
import '../widgets/bottomnavbar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MaterialButton(
        height: 60,
        minWidth: 60,
        color: primarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          Get.to(SearchScreen());
        },
        child: Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Recommended Jobs",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.notifications,
                  color: Colors.grey,
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("/pk.jpg"),
                    ),
                    onTap: () {
                      Get.to(Profile());
                    },
                  ),
                ),
              ],
            ),
            recommendedList(),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Top Jobs",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            ContentBar(),
          ],
        ),
      ),
    );
  }
}
