import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:github_demo_client/pages/home.dart';
import 'package:github_demo_client/pages/repository.dart';
import 'package:flutter/material.dart';
import 'package:github_demo_client/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:github_demo_client/main.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DemoGuthubApp());
}

class DemoGuthubApp extends StatelessWidget {
  final HttpLink httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final AuthLink authLink = AuthLink(
      getToken: () async {
        var token = await _authService.getAcessToken();
        return 'Bearer $token';
      },
    );
    final Link link = authLink.concat(httpLink);
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: link,
      ),
    );
    return GraphQLProvider(
      client: client,
      child: StreamProvider<User>.value(
          value: _authService.currentUser,
          child: MaterialApp(
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
          )),
    );
  }
}
