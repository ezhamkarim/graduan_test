import 'package:flutter/material.dart';

extension ListWidgetExtension on List<Widget> {
  List<Widget> separatorListWidget(Widget separator) {
    final list = <Widget>[];
    for (var i = 0; i < length; ++i) {
      if (i == 0) {
        list.add(this[i]);
      } else {
        list
          ..add(separator)
          ..add(this[i]);
      }
    }

    return list;
  }
}
