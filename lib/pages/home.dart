import 'package:firebase_auth/firebase_auth.dart';
import 'package:github_demo_client/api/queries/gists.dart';
import 'package:github_demo_client/entities/repository.dart';
import 'package:github_demo_client/pages/repository.dart';
import 'package:flutter/material.dart';
import 'package:github_demo_client/services/auth.dart';
import 'package:provider/provider.dart';

Future fetchGists() async {
  return {'description': 'Text-description'};
}

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  final AuthService _authService = AuthService();

  final repositories = [Repository(name: 'Ios'), Repository(name: 'Android')];

  Function _navigateToRepositoryPage(BuildContext context) =>
      (Repository repository) {
        Navigator.pushNamed(context, RepositoryPage.routeName,
            arguments:
                repositories.firstWhere((e) => e.name == repository.name));
      };

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isAuthenticated = user != null;

    return Scaffold(
      appBar: AppBar(
        title:
            isAuthenticated ? Text('You logged as: ${user.displayName}') : null,
        actions: [
          isAuthenticated
              ? FlatButton(
                  onPressed: _authService.signOut, child: Text('Logout'))
              : Text('')
        ],
      ),
      body: isAuthenticated
          ? Column(
              children: [
                Container(child: Text(user.displayName)),
                // Expanded(
                //     child: RepositoriesListPage(
                //   repositories: repositories,
                //   onTap: _navigateToRepositoryPage(context),
                // )),
                Expanded(
                  child: QueryGists(),
                )
              ],
            )
          : Column(children: [
              FlatButton(
                  onPressed: () {
                    _authService.signInWithGitHub(context);
                  },
                  child: Text('Login'))
            ]),
    );
  }
}
