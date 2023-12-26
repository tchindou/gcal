import 'package:gcal/domain/entities/order_cart.dart';

abstract class CartUseCase {
  Future<List<OrderCart>> getCart();
  Future<void> addCart(OrderCart orderCart);
  Future<void> removeCart(int index);
  Future<void> updateQte(OrderCart orderCart, {required String type});
  Future<void> clearCart();
}
