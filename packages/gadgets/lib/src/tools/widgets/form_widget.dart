import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> childrenFields;

  const FormWidget({
    super.key,
    required this.formKey,
    required this.childrenFields,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: childrenFields,
      ),
    );
  }
}
