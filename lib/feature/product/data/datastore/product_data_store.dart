import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc_api/core/http/http_helper.dart';
import 'package:flutter_bloc_api/feature/product/data/model/model_product.dart';


abstract class ProductRemoteDataStore {
  Future<ModelProduct> getProduct();
}

class ProductRemoteDataStoreImpl implements ProductRemoteDataStore {
  @override
  Future<ModelProduct> getProduct() async {
    try {
      final response = await HttpHelper()
          .getRequest(endPoint: "https://dummyjson.com/products");
      if (response.statusCode == 200) {
        return ModelProduct.fromJson(jsonDecode(response.body));
      } else {
        throw "Error loading product";
      }
    } catch (e) {
      log("error = $e");
      rethrow;
    }
  }
}
