import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_api/core/error/failure.dart';
import 'package:flutter_bloc_api/feature/product/data/model/model_product.dart';

abstract class ProductRepository {
  Future<Either<Failure, ModelProduct>> getProduct();
}
