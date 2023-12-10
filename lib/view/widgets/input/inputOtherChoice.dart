import 'package:flutter/material.dart';

class InpOther extends StatelessWidget {
  final String type;

  const InpOther({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
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
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset('assets/images/icons/signs/email.png'),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('Email'),
              ],
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerLeft,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xAAF2F2F2),
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
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset('assets/images/icons/signs/google.png'),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('Google'),
              ],
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.05,
        ),
      ],
    );
  }
}
