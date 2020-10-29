import 'package:demo_shop/entities/repository.dart';
import 'package:flutter/material.dart';

class RepositoriesListPage extends StatelessWidget {
  final List<Repository> repositories;
  final Function onTap;
  static const String routeName = '/repositories';

  RepositoriesListPage({this.repositories, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var repo in repositories)
            ListTile(
              title: Text(repo.name),
              onTap: () => onTap(repo),
            )
        ],
      ),
    );
  }
}
