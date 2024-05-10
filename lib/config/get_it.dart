import 'package:get_it/get_it.dart';
import 'package:unit_test_project/main.dart';

GetIt config = GetIt.instance;

setup() {
  config.registerSingleton(ErrorPage());
  config.registerSingleton(StaticPage());

  
}
