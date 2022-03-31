import 'dart:convert';
import 'package:http/http.dart' as http;

class FetchLocation {
  static Future<http.Response> getLocation(String pincode) async {
    final response = await http
        .get(Uri.parse('https://api.postalpincode.in/pincode/$pincode'));
    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      // print(data[0]["PostOffice"][0]["State"]);
      // print(data[0]["PostOffice"][0]["District"]);
      return response;
    } else {
      throw Exception('Failed to load location');
    }
  }
}
