import 'package:demo_shop/entities/repository.dart';
import 'package:demo_shop/screens/repository_info.dart';
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
