import 'package:flutter/material.dart';
import 'package:gcal/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDesc extends StatelessWidget {
  final String title;
  const HeaderDesc({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 20,
            decoration: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
