import 'package:flutter/material.dart';

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

Future<void> showSnackBar(
  BuildContext context,
  String message,
) async {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
