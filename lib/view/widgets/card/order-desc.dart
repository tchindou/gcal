import 'package:flutter/material.dart';
import 'package:gcal/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class OrderDesc extends StatefulWidget {
  final String categorie;
  final String name;
  const OrderDesc({super.key, required this.categorie, required this.name});

  @override
  State<OrderDesc> createState() => _OrderDescState();
}

class _OrderDescState extends State<OrderDesc> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned(
              right: 0,
              top: 0,
              child: Container(
                height: 110,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://web-assets.bcg.com/3c/3d/794ddde7481695d246407d66e179/food-for-thought-the-untapped-climate-opportunity-in-alternative-proteins-rectangle.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Positioned(
              top: 80,
              child: badges.Badge(
                showBadge: true,
                position: badges.BadgePosition.topStart(top: 7, start: 17),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: green,
                ),
                child: Container(
                  width: 140,
                  height: 80,
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
                  transform: Transform.translate(offset: const Offset(10, 0))
                      .transform,
                  decoration: BoxDecoration(
                    color: white0,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xAAc1c1c1),
                        offset: Offset(0, 1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        ". ${widget.name} .",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                          child: Text(
                            "Ajouter",
                            style: TextStyle(color: white0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
