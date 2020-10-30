import 'package:github_demo_client/entities/repository.dart';
import 'package:github_demo_client/screens/repository_info.dart';
import 'package:flutter/material.dart';

class RepositoryPage extends StatelessWidget {
  final Repository repo;
  static const String routeName = '/repository-page';

  RepositoryPage({this.repo});

  @override
  Widget build(BuildContext context) {
    return RepositoryInfoScreen(repository: repo);
  }
}
