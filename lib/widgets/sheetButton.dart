import 'package:flutter/material.dart';

class SheetButton extends StatelessWidget {
  const SheetButton({this.title, this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 40,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(30.0),
      ),
      child: RaisedButton(
        color: Colors.green,
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
