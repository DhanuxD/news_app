// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app/Provider/change_theme.dart';
import 'package:news_app/constant/themes.dart';
import 'package:provider/provider.dart';

class CategoriesWidget extends StatelessWidget {
  String? typeNews;
  CategoriesWidget({required this.typeNews, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 26,
        width: 90,
        decoration: BoxDecoration(
          color: Provider.of<ChangeTheme>(context, listen: false).themeData ==
                  lightTheme
              ? Colors.black
              : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Center(
          child: Text(
            maxLines: 1,
            typeNews!,
            style: TextStyle(
                color:
                    Provider.of<ChangeTheme>(context, listen: false).themeData ==
                            lightTheme
                        ? Colors.white
                        : Colors.black,
                fontFamily: "font3"),
          ),
        ),
      ),
    );
  }
}
