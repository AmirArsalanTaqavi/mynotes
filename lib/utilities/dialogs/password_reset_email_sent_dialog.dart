import 'package:flutter/material.dart';
import 'package:mynotes/utilities/dialogs/generic_dialog.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: 'Password reset request',
    content:
        'We have sent you a password link via email. Please check your email for more information.',
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
