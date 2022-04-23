import 'package:flutter/material.dart';
import 'package:merointernship/data/carddata.dart';

class ContentBar extends StatefulWidget {
  const ContentBar({Key? key}) : super(key: key);

  @override
  State<ContentBar> createState() => _ContentBarState();
}

class _ContentBarState extends State<ContentBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: ScrollPhysics(),
        // to disable GridView's scrolling
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: cardData.length,
        itemBuilder: (context, i) => InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(cardData[i]["image"]),
                  Flexible(
                    child: Text(
                      cardData[i]["title"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      cardData[i]["subtitle"],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
