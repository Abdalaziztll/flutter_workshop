import 'package:flutter_test/flutter_test.dart';
import 'package:notification_map_tdd/model/hub_model.dart';

void main() {
  group("All HubModel Fuctions", () {
    
    test("Success White test Fof Hub Model ...  Hub.FromMap", () {
      HubModel hub = HubModel.fromMap({
        "id": 3,
        "name": "وزارة التربية",
        "latitude": 33.52529715551463,
        "longitude": 36.29175313253385,
        "description": "دوارة التربية  - الجبة"
      });

      expect(hub.runtimeType, HubModel);
    });

    test("Empty Map Test with HubMode.FromMap", () {
      HubModel hub = HubModel.fromMap({});

      expect(hub.runtimeType, HubModel);
    });
  });
}
