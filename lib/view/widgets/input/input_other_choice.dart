import 'package:flutter/material.dart';

class InpOther extends StatelessWidget {
  const InpOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFF2F2F2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xAABEBEBE),
                  offset: Offset(10, 10),
                  blurRadius: 30,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-10, -10),
                  blurRadius: 30,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Image.asset('assets/images/input/email.png'),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFF2F2F2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xAABEBEBE),
                  offset: Offset(10, 10),
                  blurRadius: 30,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-10, -10),
                  blurRadius: 30,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Image.asset('assets/images/input/google.png'),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFFF2F2F2),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xAABEBEBE),
                  offset: Offset(10, 10),
                  blurRadius: 30,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-10, -10),
                  blurRadius: 30,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: Image.asset('assets/images/input/phone.png'),
            ),
          ),
        ),
      ],
    );
  }
}
