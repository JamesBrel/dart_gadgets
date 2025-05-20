import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastKit {
  static void _showToast({
    required String message,
    required Color backgroundColor,
    Color? textColor,
    double fontSize = 14.0,
    Toast toastLength = Toast.LENGTH_LONG,
    int timeInSecForIosWeb = 1,
    bool showCloseButton = false,
  }) {
    Fluttertoast.cancel(); // Annule les toasts précédents

    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: ToastGravity.TOP,
      backgroundColor: backgroundColor,
      textColor: textColor ?? _getAutoTextColor(backgroundColor),
      fontSize: fontSize,
      webPosition: 'center',
      timeInSecForIosWeb: timeInSecForIosWeb,
      webShowClose: showCloseButton,
    );
  }

  static Color _getAutoTextColor(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.4
        ? Colors.black
        : Colors.white;
  }

  void success({required String message, double fontSize = 14.0}) {
    _showToast(
      message: message,
      backgroundColor: const Color(0xFF4CAF50), // Vert Material Design
      fontSize: fontSize,
      timeInSecForIosWeb: 2,
    );
  }

  void error({required String message, double fontSize = 14.0}) {
    _showToast(
      message: message,
      backgroundColor: const Color(0xFFEF5350), // Rouge Material Design
      fontSize: fontSize,
      timeInSecForIosWeb: 2,
    );
  }
}
