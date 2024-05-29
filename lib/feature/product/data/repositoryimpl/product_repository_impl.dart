import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_api/core/error/failure.dart';
import 'package:flutter_bloc_api/feature/product/data/datastore/product_data_store.dart';
import 'package:flutter_bloc_api/feature/product/data/model/model_product.dart';
import 'package:flutter_bloc_api/feature/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRemoteDataStoreImpl remoteDataStoreImpl;

  ProductRepositoryImpl({required this.remoteDataStoreImpl});

  @override
  Future<Either<Failure, ModelProduct>> getProduct() async {
    try {
      var response = await remoteDataStoreImpl.getProduct();
      return Right(response);
    } catch (error, stack) {
      log("error = ${error.toString()}");
      log("stackTree = ${stack.toString()}");
      return Left(Failure.handleExceptionWithMessage(error));
    }
  }
}
