// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news_app/Provider/change_theme.dart';
import 'package:news_app/httpoverride.dart';
import 'package:provider/provider.dart';
import 'shared/navigator.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    ChangeNotifierProvider(
      child: const MyApp(),
      create: (context) {
        return ChangeTheme();
      },
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TheNavigator(),
      theme: Provider.of<ChangeTheme>(context).themeData,
    );
  }
}
