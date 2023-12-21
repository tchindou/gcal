import 'package:gcal/domain/entities/orderCart.dart';

abstract class CartUseCase {
  Future<List<OrderCart>> getCart();
  Future<void> addCart(OrderCart orderCart);
  Future<void> removeCart(OrderCart orderCart);
  Future<void> updateQte(OrderCart orderCart, {required String type});
}
