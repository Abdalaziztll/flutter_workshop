import 'package:unit_test_project/graphql/config/config.dart';

getData() async {
  var result = await client.query(options);

  return result;
}
