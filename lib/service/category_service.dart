import 'dart:convert';

import 'package:artificial_soft_task/common/const.dart';
import 'package:artificial_soft_task/model/product_category.dart';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

class CategorysService {
  static Future<List<Data>> getCategorys() async {
    List<Data> productData = [];
    try {
      String url = '$base_url/get-categories';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = ProductCategoryModel.fromJson(jsonDecode(response.body));
        productData = data.data ?? [];
        return productData;
      }
    } catch (e) {
      debugPrint('error: ${e.toString()}');
    }
    return productData;
  }
}
