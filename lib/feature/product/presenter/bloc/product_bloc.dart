import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api/feature/product/domain/usecase/product_use_case.dart';
import 'package:flutter_bloc_api/feature/product/presenter/bloc/product_event.dart';
import 'package:flutter_bloc_api/feature/product/presenter/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductUseCase productUseCase;

  ProductBloc({required this.productUseCase})
      : super(ProductInitialState()) {
    on<GetProductEvent>(_onGetProductEvent);
    on<GetProductResetStateEvent>(_onReset);
  }

  _onGetProductEvent(GetProductEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());

    final result = await productUseCase.execute(null);
    //log("result = ${result}");
    result.fold((failure) => emit(ProductFailedState(errorMessage: failure.message)),
        (result) => emit(ProductLoadedState(modelProductResponse: result)));
  }

  _onReset(GetProductResetStateEvent event, Emitter<ProductState> emit) {
    emit(ProductInitialState());
  }
}
