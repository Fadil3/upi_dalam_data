import 'dart:ui';

import 'package:flutter/material.dart';

Widget settingPage(){
  return Column(
    children: [
      SizedBox(
        height: 115,
        width: 115,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/Profile Image.png"),
        ),
      )
    ],
  );
}