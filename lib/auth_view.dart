import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  final Function(String) didSignIn;

  AuthView({this.didSignIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Sign In'),
          onPressed: _webSignIn,
        ),
      ),
    );
  }

  void _webSignIn() async {
    try {
      final result = await Amplify.Auth.signInWithWebUI();
      if (result.isSignedIn) {
        final attributes = await Amplify.Auth.fetchUserAttributes();
        final String email = attributes
            .firstWhere((element) => element.userAttributeKey == "email")
            .value;
        didSignIn(email);
      }
    } catch (e) {
      print(e);
    }
  }
}
