import 'package:flutter/material.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GitHubSignIn gitHubSignIn = GitHubSignIn(
    clientId: 'Ov23liKbSAb18KiTaXim',
    clientSecret: '097f8c73db61f076642692a5a6d946da7d2e5107',
    redirectUrl: 'https://iitjobs-inc.firebaseapp.com/__/auth/handler',
    title: 'GitHub Connection',
    centerTitle: false,
  );

  @override
  void initState() {
    super.initState();
  }

  void _gitHubSignIn(BuildContext context) async {
    var result = await gitHubSignIn.signIn(context);
    switch (result.status) {
      case GitHubSignInResultStatus.ok:
        print(result.token);
        break;

      case GitHubSignInResultStatus.cancelled:
      case GitHubSignInResultStatus.failed:
        print(result.errorMessage);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Plus Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _gitHubSignIn(context);
          },
          child: const Text("GitHub Connection"),
        ),
      ),
    );
  }
}
