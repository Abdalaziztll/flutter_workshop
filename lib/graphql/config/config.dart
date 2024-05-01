import 'package:graphql/client.dart';
import 'package:unit_test_project/graphql/gql/data_model.dart';

final _httpLink = HttpLink(
  'https://graphqlzero.almansi.me/api',
);


final GraphQLClient client = GraphQLClient(
  /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
  cache: GraphQLCache(store: HiveStore()),
  link: _httpLink,
);

final QueryOptions options = QueryOptions(
  document: gql(readRepositories)
);