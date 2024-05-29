
import 'package:flutter_bloc_api/feature/product/data/model/model_product.dart';

abstract class ProductState {
  ProductState();
}

class ProductInitialState extends ProductState {
  ProductInitialState();
}

class ProductLoadingState extends ProductState {
  ProductLoadingState();
}

class ProductLoadedState extends ProductState {
  ModelProduct modelProductResponse;

  ProductLoadedState({required this.modelProductResponse});
}

class ProductEmptyState extends ProductState {}

class ProductFailedState extends ProductState {
  String? errorMessage;

  ProductFailedState({this.errorMessage});
}
