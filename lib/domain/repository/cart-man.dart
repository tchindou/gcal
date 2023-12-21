import 'package:gcal/domain/entities/orderCart.dart';
import 'package:gcal/domain/usecase/order-cart-uc.dart';

class CartManip implements CartUseCase {
  List<OrderCart> orderCartList = [];

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
          Duration(seconds: 1)); // Attendre 1 seconde entre chaque appel
      yield await getCart().then((cart) => cart.length);
    }
  }

  @override
  Future<void> addCart(OrderCart orderCart) async {
    orderCartList.add(orderCart);
  }

  @override
  Future<void> removeCart(OrderCart orderCart) async {
    orderCartList.remove(orderCart);
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
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
