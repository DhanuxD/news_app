import 'package:flutter/material.dart';

showAlertDilog(BuildContext context, String text) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // title: const Text('News Added to Favorite'),
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'font3', fontSize: 18),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              child: const Text('Ok',
                  style: TextStyle(color: Colors.black, fontFamily: 'font3')),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          /*      TextButton(
                            child: const Text('Confirm' , style: TextStyle(color: Colors.black , fontFamily: 'font3'),),
                            onPressed: () {
                              // Handle the confirm action
                            },
                          ),*/
        ],
      );
    },
  );
}
