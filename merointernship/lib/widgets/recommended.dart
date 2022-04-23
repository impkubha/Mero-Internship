import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:merointernship/data/carddata.dart';

Widget recommendedList() => InkWell(
      child: Container(
        child: CarouselSlider.builder(
          itemCount: recommendedJobs.length,
          options: CarouselOptions(
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          itemBuilder: (context, i, realIdx) {
            return Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              //color: recommendedJobs[i]["color"],
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Image.asset(
                        recommendedJobs[i]["image"],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 8),
                      child: Text(
                        recommendedJobs[i]["company"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            recommendedJobs[i]["title"],
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.location_on),
                          Text(
                            recommendedJobs[i]["location"],
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
      onTap: () {
        print("list is clicked");
      },
    );
