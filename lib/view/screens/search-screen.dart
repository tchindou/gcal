import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gcal/utils/colors.dart';
import 'package:gcal/view/widgets/export-widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isClicked = false; // Ajoutez l'initialisation ici
  List<bool> filterStates = List.generate(
      7, (index) => false); // 7 est la longueur de votre liste d'items
  String selectedFilter = "Tous";
  String selectedCategory = "Tous";

  TextEditingController searchController = TextEditingController();

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
    List<OrderDesc> list = [];

    if (searchController.text.isNotEmpty) {
      list = orderDescList
          .where((orderDesc) =>
              (selectedCategory == "Tous" ||
                  orderDesc.categorie == selectedCategory) &&
              (searchController.text.isNotEmpty &&
                  orderDesc.name
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase())))
          .toList();
    } else {
      list = orderDescList
          .where((orderDesc) =>
              selectedCategory == "Tous" ||
              orderDesc.categorie == selectedCategory)
          .toList();
    }
    return list;
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

  void updateSearch() {
    setState(() {
      getFilteredOrderDescList();
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
                ),
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
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
                  'Search',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'for your',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: black,
                        ),
                      ),
                      TextSpan(
                        text: ' favorite food',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: green,
                        ),
                      ),
                    ],
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
                    Navigator.pushNamed(context, "/profile");
                  },
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

  Widget searchBar() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 60,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        children: [
          Expanded(
            child: InpField(
                type: "text",
                text: "Recherche",
                onChanged: (value) {
                  // Appeler la méthode de mise à jour ici
                  updateSearch();
                },
                textController: searchController),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              bottomSheet();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(Icons.filter_list, color: white0),
              ),
            ),
          )
        ],
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

  Future<void> bottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 60,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const HeaderDesc(title: "Filtre"),
              Wrap(
                alignment: WrapAlignment.start,
                children: items.asMap().entries.map((entry) {
                  int index = entry.key;
                  String item = entry.value;
                  return filter(
                    item,
                    item == selectedCategory ? green : White1,
                    index,
                  );
                }).toList(),
              ),
              ElevatedButton(
                child: const Text('Close BottomSheet'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            appbar(),
            searchBar(),
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
                      const Gap(10),
                      const HeaderDesc(title: "Categories"),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics()
                            .applyTo(const BouncingScrollPhysics()),
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
                        physics: const ClampingScrollPhysics()
                            .applyTo(const BouncingScrollPhysics()),
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
}
