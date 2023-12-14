import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeOrderPub extends StatefulWidget {
  const HomeOrderPub({super.key});

  @override
  State<HomeOrderPub> createState() => _HomeOrderPubState();
}

class _HomeOrderPubState extends State<HomeOrderPub> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width * 0.96,
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.01,
        right: MediaQuery.of(context).size.width * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0xAAc1c1c1),
            offset: Offset(0, 1),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 30,
            top: 40,
            child: Image.asset(
              "assets/images/home/plate.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 100,
              height: 180,
              decoration: const BoxDecoration(
                color: Color(0x47000000),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    "Choisissez votre plat frais & sain",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    "Nous avons une multitude de plat qui feront votre plaisir",
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: const Color(0xFF383838),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(5),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Commandez!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
