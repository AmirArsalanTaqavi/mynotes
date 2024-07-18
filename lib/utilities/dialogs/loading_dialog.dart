import 'package:flutter/material.dart';

typedef CloseDialog = void Function();

CloseDialog showLoadingDialoog({
  required BuildContext context,
  required String text,
}) {
  final dialog = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 10.0),
        Text(text),
      ],
    ),
  );
  showDialog(
    context: context,
    builder: (context) => dialog,
    barrierDismissible: false,
  );
  return () => Navigator.of(context).pop();
}
