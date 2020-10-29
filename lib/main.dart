import 'package:demo_shop/pages/repository.dart';
import 'package:demo_shop/pages/repositories_list.dart';
import 'package:flutter/material.dart';
import 'package:demo_shop/entities/repository.dart';

main() => runApp(DemoGuthubApp());

class DemoGuthubApp extends StatelessWidget {
  final repositories = [Repository(name: 'Ios'), Repository(name: 'Android')];

  Function _navigateToRepositoryPage(BuildContext context) =>
      (Repository repository) {
        Navigator.pushNamed(context, RepositoryPage.routeName,
            arguments:
                repositories.firstWhere((e) => e.name == repository.name));
      };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Github App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        RepositoriesListPage.routeName: (c) => RepositoriesListPage(
              repositories: repositories,
              onTap: _navigateToRepositoryPage(c),
            ),
      },
      onGenerateRoute: (RouteSettings settings) {
        String routeName = settings.name;
        switch (routeName) {
          case RepositoryPage.routeName:
            return MaterialPageRoute(
                builder: (c) => RepositoryPage(
                      repo: settings.arguments,
                    ));
          default:
            {
              return MaterialPageRoute(
                builder: (c) => RepositoriesListPage(
                  repositories: repositories,
                  onTap: _navigateToRepositoryPage(c),
                ),
              );
            }
        }
      },
    );
  }
}
