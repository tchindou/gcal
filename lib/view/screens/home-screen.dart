import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gcal/view/widgets/export-widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    fontSize: 18,
                  ),
                ),
                Text(
                  '@alaise_tchindou',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xFFC1C1C1),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.only(right: 5, left: 10),
              child: Icon(
                Icons.qr_code_scanner_outlined,
                size: 30,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 5, left: 10),
              child: Icon(
                Icons.notifications_outlined,
                size: 30,
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
                            fontSize: 28, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Que voulez vous commander aujourd'hui?",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xFF383838),
                        ),
                      ),
                      const Gap(20),
                      HomeOrderPub(),
                      const Gap(20),
                      HeaderDesc(title: "Categories"),
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
