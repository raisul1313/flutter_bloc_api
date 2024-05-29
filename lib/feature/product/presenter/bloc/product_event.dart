abstract class ProductEvent {
  ProductEvent();
}

class GetProductEvent extends ProductEvent{
  GetProductEvent();
}

class GetProductResetStateEvent extends ProductEvent {
  GetProductResetStateEvent();
}