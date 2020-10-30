import 'package:github_demo_client/pages/home.dart';
import 'package:github_demo_client/pages/repository.dart';
import 'package:flutter/material.dart';

main() => runApp(DemoGuthubApp());

class DemoGuthubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Github App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        HomePage.routeName: (c) => HomePage(),
      },
      onGenerateRoute: (RouteSettings settings) {
        String routeName = settings.name;
        switch (routeName) {
          case HomePage.routeName:
            return MaterialPageRoute(builder: (c) => HomePage());
          case RepositoryPage.routeName:
            return MaterialPageRoute(
                builder: (c) => RepositoryPage(
                      repo: settings.arguments,
                    ));
          default:
            return MaterialPageRoute(
              builder: (c) => HomePage(),
            );
        }
      },
    );
  }
}
