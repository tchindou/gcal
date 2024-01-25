import 'dart:math';

import 'package:gcal/domain/entities/order.dart';
import 'package:gcal/view/widgets/export_widget.dart';

final List<String> items = [
  "Tous",
  "Vegetables",
  "Fruits",
  "Boissons",
  "Dessert",
  "Epicerie",
  "Cremerie"
];

String selected = "Tous";
String? value;

List<OrderDesc> getFilteredOrderDescList({required selected, value}) {
  List<String> categories = [
    "Vegetables",
    "Fruits",
    "Boissons",
    "Dessert",
    "Epicerie",
    "Cremerie"
  ];

  List<String> vegetableNames = ["Tomatoes", "Carrots", "Spinach", "Cucumber"];
  List<String> fruitNames = ["Orange", "Apple", "Banana", "Grapes"];
  List<String> drinkNames = ["Coca Cola", "Water", "Orange Juice", "Coffee"];
  List<String> dessertNames = ["Ice Cream", "Cake", "Cookies", "Pudding"];
  List<String> groceryNames = ["Rice", "Pasta", "Canned Goods", "Spices"];
  List<String> dairyNames = ["Milk", "Cheese", "Yogurt", "Butter"];

  List<List<String>> namesList = [
    vegetableNames,
    fruitNames,
    drinkNames,
    dessertNames,
    groceryNames,
    dairyNames,
  ];

  List<OrderDesc> orderDescList = [];

  Random random = Random();

  for (int i = 0; i < 25; i++) {
    int categoryIndex = random.nextInt(categories.length);
    int nameIndex = random.nextInt(namesList[categoryIndex].length);

    String category = items[categoryIndex];
    String name = namesList[categoryIndex][nameIndex];

    orderDescList.add(
      OrderDesc(
        order: Order(
            id: i,
            name: name,
            category: category,
            price: "1000",
            description: "description",
            image:
                "https://web-assets.bcg.com/3c/3d/794ddde7481695d246407d66e179/food-for-thought-the-untapped-climate-opportunity-in-alternative-proteins-rectangle.jpg"),
      ),
    );
  }

  List<OrderDesc> list = [];

  if (value != null) {
    if (value.isNotEmpty) {
      list = orderDescList
          .where((orderDesc) =>
              (selected == "Tous" || orderDesc.order.category == selected) &&
              (value.isNotEmpty &&
                  orderDesc.order.name
                      .toLowerCase()
                      .contains(value.toLowerCase())))
          .toList();
    } else {
      list = orderDescList
          .where((orderDesc) =>
              selected == "Tous" || orderDesc.order.category == selected)
          .toList();
    }
  } else {
    list = orderDescList
        .where((orderDesc) =>
            selected == "Tous" || orderDesc.order.category == selected)
        .toList();
  }

  return list;
}
