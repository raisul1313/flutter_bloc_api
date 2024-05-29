import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/feature/product/presenter/bloc/product_bloc.dart';
import 'package:flutter_bloc_api/feature/product/presenter/bloc/product_event.dart';
import 'package:flutter_bloc_api/feature/product/presenter/bloc/product_state.dart';
import 'package:flutter_bloc_api/feature/product/presenter/widget/product_card.dart';
import 'package:flutter_bloc_api/feature/product/presenter/widget/product_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(GetProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        log("state = $state");
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductLoadedState) {
          return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemCount: state.modelProductResponse.products!.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: ProductPreview(products: state.modelProductResponse.products![index]),
                          );
                        },
                      );
                    },
                    child: ProductCard(
                      products: state.modelProductResponse.products![index],
                    ));
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              });
        }
        if (state is ProductEmptyState) {
          return const Center(
            child: Text(
              "No products found",
              style: TextStyle(color: Colors.green),
            ),
          );
        }
        if (state is ProductFailedState) {
          return Center(child: Text('${state.errorMessage}'));
        }
        return const SizedBox();
      }),
    );
  }
}
