import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_datastore/types/DataStoreHubEvents/DataStoreHubEvent.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_with_friends_flutter_demo/messages_view.dart';
import 'package:flutter/material.dart';

import 'amplifyconfiguration.dart';
import 'auth_view.dart';
import 'models/ModelProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _email;

  @override
  void initState() {
    super.initState();
    _configureAmplify().then((_) => _attemptAutoSignIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Navigator(
      pages: [
        MaterialPage(
            child:
                AuthView(didSignIn: (email) => setState(() => _email = email))),
        if (_email != null)
          MaterialPage(
              child: MessagesView(
            email: _email,
          ))
      ],
      onPopPage: (route, result) => route.didPop(result),
    ));
  }

  Future<void> _configureAmplify() async {
    try {
      await Amplify.addPlugins([
        AmplifyAuthCognito(),
        AmplifyAPI(),
        AmplifyDataStore(modelProvider: ModelProvider.instance)
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        // _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  void _attemptAutoSignIn() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      final String email = attributes
          .firstWhere((element) => element.userAttributeKey == "email")
          .value;
      setState(() => _email = email);
    } catch (e) {
      print(e);
    }
  }

  void _observeHub() {
    Amplify.Hub.listen([HubChannel.DataStore], (event) {
      print(event);
    });
  }
}
