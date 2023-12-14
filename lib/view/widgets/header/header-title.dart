import 'package:flutter/material.dart';
import 'package:gcal/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDesc extends StatelessWidget {
  final String title;
  const HeaderDesc({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 26,
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5),
          child: Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
