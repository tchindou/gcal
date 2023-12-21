class Order {
  final int id;
  final String name;
  final String category;
  final String price;
  final String description;
  final String image;

  Order({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.image,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
    );
  }

  @override
  String toString() {
    return 'Order{id: $id, name: $name, category: $category, price: $price, description: $description, image: $image}';
  }
}
