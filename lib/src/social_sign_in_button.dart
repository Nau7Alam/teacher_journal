// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import './custom_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton(
      {required String text,
      required Color color,
      required Color textColor,
      required VoidCallback onPressed,
      required double height,
      required String logo,
      required String opaque
      })
      : assert(text != null),
        assert(logo != null),
        assert(opaque != null),
        super(
          child: Center(
            child: Text(text,textAlign: TextAlign.center, style: TextStyle(color: textColor, fontSize: 18)),
          ),
          color: color,
          onPressed: onPressed,
          height: height,
        );
}