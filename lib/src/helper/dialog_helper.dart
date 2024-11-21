import 'package:flutter/material.dart';

class DialogHelper {
  static Future dialogWithAction(
      BuildContext context, String title, String desc,
      {required void Function() onPressed,
      bool dismissible = true,
      bool popAfterPressedYes = true}) {
    return showDialog<bool>(
        barrierDismissible: dismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(desc),
            actions: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue[400],
                    side: const BorderSide(color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  onPressed();
                  if (popAfterPressedYes) Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0, foregroundColor: Colors.blue[400]),
                child: const Text('Okay'),
              )
            ],
          );
        });
  }

  static Future dialogWithOutActionWarning(
    BuildContext context,
    String title, {
    bool dismissible = true,
  }) {
    return showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, foregroundColor: Colors.blue[400]),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Okay'))
            ],
          );
        });
  }
}
