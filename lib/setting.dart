import 'dart:ui';

import 'package:flutter/material.dart';

Widget settingPage(){
  return Column(
    children: [

      Padding(
        padding: EdgeInsets.all(20)
      ),

      SizedBox(
        height: 115,
        width: 115,
        child: CircleAvatar(
          backgroundImage: NetworkImage("https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2022/01/21/992560672.png"),
        ),
      ),

      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Asep Knalpot\n1900141\nIlmu Komputer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),

      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () { },
        child: Text('Ganti Bahasa'),
      ),

      TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        ),
        onPressed: () {},
        child: Text('Logout'),
      )

    ],
  );
}