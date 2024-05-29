import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_api/core/error/failure.dart';
import 'package:flutter_bloc_api/core/usecase/use_case.dart';
import 'package:flutter_bloc_api/feature/product/data/model/model_product.dart';
import 'package:flutter_bloc_api/feature/product/domain/repository/product_repository.dart';


class ProductUseCase extends UseCase<ModelProduct, void> {
  ProductRepository repository;

  ProductUseCase({required this.repository});

  @override
  Future<Either<Failure, ModelProduct>> execute(void inputParams) {
    return repository.getProduct();
  }
}
