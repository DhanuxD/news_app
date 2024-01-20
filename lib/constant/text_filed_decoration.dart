import 'package:flutter/material.dart';

const decorationtextFiled = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.always, 

  hintStyle: TextStyle(fontFamily: "myfont"),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide(color: Color.fromARGB(255, 77, 77, 78), width: 2.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide:
        BorderSide(color: Color.fromARGB(255, 177, 177, 177), width: 2.0),
  ),
  contentPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
);
