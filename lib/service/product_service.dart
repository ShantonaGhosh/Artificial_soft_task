import 'dart:convert';
import 'package:artificial_soft_task/common/const.dart';
import 'package:artificial_soft_task/model/products_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ProductsServies {
  static Future<List<Data>> getProducts({required int id}) async {
    List<Data> productData = [];
    try {
      String url = '$base_url/product-by-category/$id';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = ProductsModel.fromJson(jsonDecode(response.body));
        productData = data.data ?? [];
        return productData;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return productData;
  }
}

