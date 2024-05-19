import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/login_vews.dart';
import 'package:mynotes/views/register_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                //   const verified = Text('you are verified');
                //   return verified;
              } else {
                // const notVerified =
                //     Text('not verifed yet. please verify your email.');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VerifyEnailView()));
              }
              return const Text('done');
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}

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
