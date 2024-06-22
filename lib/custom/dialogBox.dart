import 'package:flutter/material.dart';

class DialogHelper {
  static void showAlertDialog(BuildContext context, String titleText,
      String subtitleText, Function()? onOkPressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titleText),
          content: Text(subtitleText),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onOkPressed != null) {
                  onOkPressed();
                }
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
