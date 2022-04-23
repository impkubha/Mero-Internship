import 'package:flutter/material.dart';

Widget myProgressBar() => Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
        value: 0.7,
      ),
    );
