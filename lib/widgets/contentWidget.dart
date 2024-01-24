// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContentWidget extends StatelessWidget {
  String title;
  String decription;
  String imgurl;
  String date;
  String author;
  ContentWidget(
      {super.key,
      required this.title,
      required this.decription,
      required this.imgurl,
      required this.date,
      required this.author});

  @override
  Widget build(BuildContext context) {
    var dateParse = DateTime.parse(date);
    final double widthScreen = MediaQuery.of(context).size.width;
    return // Generated code for this Container Widget...
        Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
      child: Container(
        width: widthScreen * 1,
        height: 260,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Color.fromARGB(110, 23, 23, 23),
            width: 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imgurl,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          maxLines: 5,
                          style: TextStyle(
                              color: Color.fromARGB(255, 72, 236, 248),
                              fontWeight: FontWeight.bold,
                              fontFamily: "font3",
                              fontSize: 20),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1, -1),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 8, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  decription,
                  style: TextStyle(fontFamily: "font3", color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    author,
                    style: TextStyle(fontFamily: "font3", color: Colors.black),
                  ),
                  Text(
                    DateFormat.yMd().add_jm().format(dateParse),
                    style: TextStyle(fontFamily: "font3", color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
