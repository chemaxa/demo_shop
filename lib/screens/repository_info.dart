import 'package:flutter/material.dart';
import 'package:github_demo_client/entities/repository.dart';

class RepositoryInfoScreen extends StatelessWidget {
  final Repository repository;

  RepositoryInfoScreen({
    @required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Repository page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(repository.name, style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}
