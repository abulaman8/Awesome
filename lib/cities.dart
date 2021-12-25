import 'package:faker/faker.dart';
import './constants.dart';

class CityData {
  static final faker = Faker();

  // static final List<String> cities =
  //     List.generate(150, (index) => faker.address.city());

  static List<String> getSuggestions(String query) =>
      List.of(Constants.cities).where((city) {
        final cityLower = city.toLowerCase();
        final queryLower = query.toLowerCase();

        return cityLower.contains(queryLower);
      }).toList();
}