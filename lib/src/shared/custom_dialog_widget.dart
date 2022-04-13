// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    this.title = 'Warning',
    required this.message,
    this.firstButton = 'OK',
    required this.firstOnTap,
    required this.secondButton,
    required this.secondOnTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final String message;
  final String firstButton;
  final VoidCallback firstOnTap;
  final String secondButton;
  final VoidCallback secondOnTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text(
            firstButton,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: firstOnTap,
        ),
        if (secondButton != null && secondOnTap != null)
          ElevatedButton(
            child: Text(
              secondButton,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: secondOnTap,
          ),
      ],
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 20.0, decoration: TextDecoration.none),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Divider(
            color: Colors.grey,
            height: 4.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
            child: Text(message),
          ),
        ],
      ),
    );
  }
}
