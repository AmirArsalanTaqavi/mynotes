import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEnailView extends StatefulWidget {
  const VerifyEnailView({super.key});

  @override
  State<VerifyEnailView> createState() => _VerifyEnailViewState();
}

class _VerifyEnailViewState extends State<VerifyEnailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
      ),
      body: Column(
        children: [
          const Text('Please verify your email adress'),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                user?.sendEmailVerification();
              },
              child: const Text('Send verification email'))
        ],
      ),
    );
  }
}
