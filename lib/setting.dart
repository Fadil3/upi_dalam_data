import 'dart:ui';

import 'package:flutter/material.dart';

Widget settingPage(){
  return Column(
    children: [
      SizedBox(
        height: 115,
        width: 115,
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/01/21/992560672.png"),
        ),
      )
    ],
  );
}