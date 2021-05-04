import 'package:flutter/material.dart';

Widget listTile(text, icon, onTap) {
  return Padding(
    padding: EdgeInsets.only(top: 8.0),
    child: ListTile(
      leading: IconTheme(data: IconThemeData(size: 40), child: icon),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
    ),
  );
}
