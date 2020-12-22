import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_sign_in/github_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _fbAuth = FirebaseAuth.instance;
  // ignore: unused_field
  var _accessToken;

  Future<UserCredential> signInWithGitHub(BuildContext context) async {
    // Create a GitHubSignIn instance
    final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: '2160c93b28024fba2f13',
        clientSecret: '14727153d5db7a6b28fde717410d4ed5c9b615b2',
        redirectUrl:
            'https://githubdemoclient.firebaseapp.com/__/auth/handler');

    // Trigger the sign-in flow
    final result = await gitHubSignIn.signIn(context);

    // Create a credential from the access token
    final AuthCredential githubAuthCredential =
        GithubAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    var credentials = await _fbAuth.signInWithCredential(githubAuthCredential);

    var pref = await SharedPreferences.getInstance();
    pref.setString("accessToken", result.token);
    return credentials;
  }

  Future<String> getAcessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  Stream<User> get currentUser {
    return _fbAuth.authStateChanges();
  }

  Future signOut() {
    return _fbAuth.signOut();
  }
}
