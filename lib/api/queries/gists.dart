import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String readGists = """
  query ReadRepositories(\$nGists: Int!) {
    viewer {
      gists(last: \$nGists) {
        nodes {
          description
        }
      }
    }
  }
""";

class QueryGists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Query(
        options: QueryOptions(
          documentNode:
              gql(readGists), // this is the query string you just created
          variables: {
            'nGists': 50,
          },
          pollInterval: 10,
        ),
        // Just like in apollo refetch() could be used to manually trigger a refetch
        // while fetchMore() can be used for pagination purpose
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return Text('Loading');
          }

          // it can be either Map or List
          List gists = result.data['viewer']['gists']['nodes'];
          return ListView.builder(
              itemCount: gists.length,
              itemBuilder: (context, index) {
                final gist = gists[index];

                return Text(gist['description'] ?? 'Empty description');
              });
        },
      ),
    );
  }
}
