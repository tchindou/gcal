import 'package:flutter/material.dart';
import 'package:gcal/domain/export_domain.dart';
import 'package:gcal/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class AppBar extends StatefulWidget {
  const AppBar({super.key});

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
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
                position: badges.BadgePosition.topEnd(top: 1, end: -1),
                badgeContent: const Text(
                  "3",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.square,
                  badgeColor: red,
                  padding: const EdgeInsets.all(5),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
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
                position: badges.BadgePosition.topEnd(top: 1, end: -1),
                badgeContent: StreamBuilder<int>(
                  stream: CartManip.instance.cartLengthStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Erreur : ${snapshot.error}');
                    }
                    if (!snapshot.hasData) {
                      return const Text("0");
                    }
                    return Text(
                      "${snapshot.data}",
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    );
                  },
                ),
                badgeStyle: badges.BadgeStyle(
                  shape: badges.BadgeShape.square,
                  badgeColor: red,
                  padding: const EdgeInsets.all(5),
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10),
                    right: Radius.circular(10),
                  ),
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/cart");
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
}
