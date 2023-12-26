import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gcal/domain/export_domain.dart';

class SlideableCart extends StatefulWidget {
  final OrderCart cart;
  const SlideableCart({super.key, required this.cart});

  @override
  State<SlideableCart> createState() => _SlideableCartState();
}

class _SlideableCartState extends State<SlideableCart> {
  bool isClosed = false;
  double price = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    price = CartManip.instance.getPrice();
    setState(
        () {}); // Rafraîchit l'interface graphique après avoir récupéré les données.
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(5),
          bottom: Radius.circular(5),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            height: 110,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
                right: Radius.circular(10),
              ),
              child: Image.network(
                widget.cart.order.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.cart.order.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Row(
                        children: [
                          Text('4.7'),
                          Icon(
                            Icons.star_border_outlined,
                            color: Colors.yellow,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Le plat est constitué de tout ce qui ravira vos papilles gustative. Bon appetit !!',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  height: 30,
                  padding: const EdgeInsets.fromLTRB(8, 5, 8, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${price} fcfa',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            child: SizedBox(
                              child: IconButton(
                                onPressed: () {
                                  if (widget.cart.qte > 1) {
                                    CartManip.instance
                                        .updateQte(widget.cart, type: "dec");
                                    setState(() {
                                      widget.cart.qte;
                                    });
                                  }
                                },
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const Gap(5),
                          Text(
                            "${widget.cart.qte}",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                          const Gap(5),
                          InkWell(
                            child: SizedBox(
                              child: IconButton(
                                onPressed: () {
                                  CartManip.instance
                                      .updateQte(widget.cart, type: "inc");
                                  setState(() {
                                    widget.cart.qte;
                                  });
                                },
                                icon: const Icon(
                                  Icons.add_circle_outline,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
