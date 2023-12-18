import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gcal/utils/colors.dart';
import 'package:gcal/view/widgets/export-widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isClicked = false; // Ajoutez l'initialisation ici
  List<bool> filterStates = List.generate(
      7, (index) => false); // 7 est la longueur de votre liste d'items
  String selectedFilter = "Tous";
  String selectedCategory = "Tous";

  final List<String> items = [
    "Tous",
    "Vegetables",
    "Fruits",
    "Boissons",
    "Dessert",
    "Epicerie",
    "Cremerie"
  ];

  List<OrderDesc> getFilteredOrderDescList() {
    List<String> categories = [
      "Vegetables",
      "Fruits",
      "Boissons",
      "Dessert",
      "Epicerie",
      "Cremerie"
    ];

    List<String> vegetableNames = [
      "Tomatoes",
      "Carrots",
      "Spinach",
      "Cucumber"
    ];
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

      orderDescList.add(OrderDesc(categorie: category, name: name));
    }

    return orderDescList
        .where((orderDesc) =>
            selectedCategory == "Tous" ||
            orderDesc.categorie == selectedCategory)
        .toList();
  }

  void updateItemsOrder(String clickedItem, String category) {
    setState(() {
      if (clickedItem != selectedFilter) {
        items.remove(clickedItem); // Retire l'élément de sa position actuelle
        items.insert(0, clickedItem); // Ajoute l'élément en début de liste
        selectedFilter = clickedItem;
        selectedCategory = clickedItem;
      }
    });
  }

  Widget appbar() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(left: 5, right: 10, top: 0),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://img.icons8.com/?size=80&id=uBUm8aDTEKsV&format=png'),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TCHINDOU Alaise',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '@alaise_tchindou',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFFC1C1C1),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 10),
              child: badges.Badge(
                showBadge: true,
                position: badges.BadgePosition.topEnd(top: 1, end: 1),
                badgeContent: const Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: red,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/search");
                  },
                  icon: const Icon(
                    Icons.notifications_outlined,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 10),
              child: badges.Badge(
                showBadge: true,
                position: badges.BadgePosition.topEnd(top: 1, end: 1),
                badgeContent: const Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: red,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appbar(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.98,
                      ),
                      Text(
                        "Salut, Soulaf",
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Que voulez vous commander aujourd'hui?",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF383838),
                        ),
                      ),
                      const Gap(20),
                      const HomeOrderPub(),
                      const Gap(10),
                      const HeaderDesc(title: "Categories"),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: items.asMap().entries.map((entry) {
                            int index = entry.key;
                            String item = entry.value;

                            return Row(
                              children: [
                                filter(
                                  item,
                                  item == selectedFilter ? green : White1,
                                  index,
                                ),
                                const Gap(15),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                      const HeaderDesc(title: "Vos favoris"),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var orderDesc
                                in getFilteredOrderDescList()) ...[
                              orderDesc,
                              const SizedBox(width: 20),
                            ],
                          ],
                        ),
                      ),
                      const HeaderDesc(title: "Recents ajouts"),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var orderDesc
                                in getFilteredOrderDescList()) ...[
                              orderDesc,
                              const SizedBox(width: 20),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget filter(String name, Color color, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          for (int i = 0; i < filterStates.length; i++) {
            filterStates[i] = false;
          }
          filterStates[index] = true;
          updateItemsOrder(name, name);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(name),
      ),
    );
  }
}
