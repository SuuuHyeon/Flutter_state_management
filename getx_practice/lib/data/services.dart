import 'package:http/http.dart' as http;

import '../model/product_model.dart';

class Services {
  static var client = http.Client();
  
  static Future<List<Product>?> fetchProducts() async {
    final response = await client.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      final jsonData = response.body;
      return productFromJson(jsonData);
    } else {
      print('(api) 리스트 조회 실패');
      return null;
    }
  }
}