import 'package:http/http.dart' as http;

import '../models/filter_model.dart';

class HomeRepo {
  static Future<FilterModel?> fetchFilterData() async {
    final url = Uri.parse('https://atom1.blueferns.com/test/filter.json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return filterModelFromJson(response.body);
      } else {
        // Handle errors
        print('Failed to load data. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred: $e');
      return null;
    }
  }
}
