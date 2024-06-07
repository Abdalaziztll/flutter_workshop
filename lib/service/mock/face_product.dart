import 'package:mockito/mockito.dart';
import 'package:mock_and_init_careem/service/real/product_service.dart';

class SuccessMockProduct extends Mock implements RealService {
  @override
  sayHi() {
    print("Fake Hello ");
  }
}
