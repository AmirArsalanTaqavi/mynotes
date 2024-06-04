// import 'package:flutter/material.dart';

// Future<void> showErrorDialog(
//   BuildContext context,
//   String text,
// ) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: const Text('An Error occurd'),
//         content: Text(text),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('ok'),
//           )
//         ],
//       );
//     },
//   );
// }

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as devtools;

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Future<void> signInUser(BuildContext context, String email, String password,
    String notesRoute) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.of(context).pushNamedAndRemoveUntil(
      notesRoute,
      (route) => false,
    );
  } on FirebaseAuthException catch (e) {
    devtools.log('FirebaseAuthException: ${e.code} - ${e.message}');
    if (e.code == 'user-not-found') {
      showSnackBar(context, 'Username not found');
    } else if (e.code == 'wrong-password') {
      showSnackBar(context, 'Wrong Password');
    } else {
      showSnackBar(context, 'Error: ${e.code}');
    }
  } catch (e) {
    devtools.log('Exception: ${e.toString()}');
    showSnackBar(context, 'Unexpected error: ${e.toString()}');
  }
}
