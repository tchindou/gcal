import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 5, right: 10, top: 5),
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
                                'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 50,
                        height: 50,
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
                      child: badge.Badge(
                        badgeContent: Text(
                          '8',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        badgeStyle: badge.BadgeStyle(
                          badgeColor: Colors.red,
                          padding: EdgeInsets.all(5),
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(children: []),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
