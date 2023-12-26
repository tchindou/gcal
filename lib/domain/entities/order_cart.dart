import 'package:gcal/domain/entities/order.dart';

class OrderCart {
  final int id;
  int qte;
  final Order order;

  OrderCart({
    required this.id,
    required this.qte,
    required this.order,
  });

  factory OrderCart.fromJson(Map<String, dynamic> json) {
    return OrderCart(
      id: json['id'],
      qte: json['qte'],
      order: Order.fromJson(json['order']),
    );
  }
}
