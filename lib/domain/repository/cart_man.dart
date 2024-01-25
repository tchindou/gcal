import 'package:gcal/domain/entities/order_cart.dart';
import 'package:gcal/domain/usecase/order_cart_uc.dart';

class CartManip implements CartUseCase {
  List<OrderCart> orderCartList = [];
  double price = 0;

  CartManip._privateConstructor();

  // Instance unique
  static final CartManip _instance = CartManip._privateConstructor();

  // Point d'accès global
  static CartManip get instance {
    return _instance;
  }

  @override
  Future<List<OrderCart>> getCart() {
    return Future.value(orderCartList);
  }

  // Définissez votre flux (stream) ici
  Stream<int> get cartLengthStream async* {
    while (true) {
      await Future.delayed(
          const Duration(seconds: 1)); // Attendre 1 seconde entre chaque appel
      yield await getCart().then((cart) => cart.length);
    }
  }

  @override
  Future<void> addCart(OrderCart orderCart) async {
    orderCartList.add(orderCart);
  }

  @override
  Future<void> removeCart(int index) async {
    orderCartList.remove(orderCartList[index]);
  }

  @override
  Future<void> updateQte(OrderCart orderCart, {required String type}) async {
    if (type == "inc") {
      orderCart.qte = orderCart.qte + 1;
    } else if (type == "dec") {
      orderCart.qte = orderCart.qte - 1;
    } else {
      orderCart.qte = orderCart.qte;
    }
  }

  @override
  Future<void> clearCart() async {
    orderCartList.clear();
  }

  double getPrice() {
    for (var element in orderCartList) {
      price += double.parse(element.order.price) * element.qte;
    }
    return price;
  }
}
