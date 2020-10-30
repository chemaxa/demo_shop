import 'package:github_demo_client/entities/repository.dart';
import 'package:github_demo_client/pages/repositories_list.dart';
import 'package:github_demo_client/pages/repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';
  final bool _isAuthenticated = false;
  final repositories = [Repository(name: 'Ios'), Repository(name: 'Android')];
  Function _navigateToRepositoryPage(BuildContext context) =>
      (Repository repository) {
        Navigator.pushNamed(context, RepositoryPage.routeName,
            arguments:
                repositories.firstWhere((e) => e.name == repository.name));
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isAuthenticated
          ? RepositoriesListPage(
              repositories: repositories,
              onTap: _navigateToRepositoryPage(context),
            )
          : Text('You ane not Logged'),
    );
  }
}
