import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/feature/product/data/datastore/product_data_store.dart';
import 'package:flutter_bloc_api/feature/product/data/repositoryimpl/product_repository_impl.dart';
import 'package:flutter_bloc_api/feature/product/domain/repository/product_repository.dart';
import 'package:flutter_bloc_api/feature/product/domain/usecase/product_use_case.dart';
import 'package:flutter_bloc_api/feature/product/presenter/bloc/product_bloc.dart';
import 'package:flutter_bloc_api/feature/product/presenter/page/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return BlocProvider(
      create: (_) => ProductBloc(
          productUseCase: ProductUseCase(
              repository: ProductRepositoryImpl(
                  remoteDataStoreImpl: ProductRemoteDataStoreImpl()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
                data: mediaQueryData.copyWith(
                    textScaler: const TextScaler.linear(1.0)),
                child: child!);
          },
          home: HomePage()),
    );
  }
}
