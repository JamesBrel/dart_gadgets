import 'package:flutter/material.dart';

class AlertKit {
  static Future<T?> _showCustomDialog<T>({
    required BuildContext context,
    required Widget content,
    String? title,
    TextStyle? titleStyle,
    List<Widget>? actions,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder:
          (context) => AlertDialog(
            titlePadding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 0,
            ),
            actionsPadding: const EdgeInsets.all(10),
            title:
                title != null
                    ? Text(
                      title,
                      style:
                          titleStyle ?? Theme.of(context).textTheme.titleLarge,
                    )
                    : null,
            content: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 300),
              child: content,
            ),
            actions: actions,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
    );
  }

  void choiceButtonsDialog({
    required BuildContext context,
    required Widget content,
    String? title,
    TextStyle? titleStyle,
    List<Widget>? actions,
  }) async {
    _showCustomDialog<bool>(
      context: context,
      title: title,
      titleStyle: titleStyle,
      content: content,
      actions: actions,
    );
  }

  void formDialog({
    required BuildContext context,
    required Widget content,
    String? title,
    TextStyle? titleStyle,
    List<Widget>? actions,
  }) {
    _showCustomDialog<String>(
      context: context,
      title: title,
      titleStyle: titleStyle,
      content: SingleChildScrollView(child: content),
      actions: actions,
    );
  }
}
