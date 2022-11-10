import 'package:flutter/material.dart';

Future<void> showRule(BuildContext context, String title, String content ,String content2 ,String content3) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text(content),
                Text(content2),
                Text(content3),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              // todo:
              Navigator.of(context).pop(); // ปิด dialog
            },
          ),
        ],
      );
    },
  );
}