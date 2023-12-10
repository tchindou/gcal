import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class WalkPage extends StatefulWidget {
  final PageController controller;
  int index;
  WalkPage({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  State<WalkPage> createState() => _WalkPageState();
}

class _WalkPageState extends State<WalkPage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: widget.controller,
      onPageChanged: (page) {
        setState(() {
          widget.index = page;
        });
      },
      children: <Widget>[
        Stack(
          children: [
            SvgPicture.asset(
              'assets/images/third.svg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              left: 15,
              bottom: 50,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          50, // ou une largeur spécifique en pixels
                      child: const Text(
                        'Discover a New Level of Health',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          50, // ou une largeur spécifique en pixels
                      child: const Text(
                        "Choice to unlock your body's full potential. With our comprehensive tools and expert guidance",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            SvgPicture.asset(
              'assets/images/first.svg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              left: 15,
              bottom: 50,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 70, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          50, // ou une largeur spécifique en pixels
                      child: const Text(
                        'Discover a New Level of Health',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          50, // ou une largeur spécifique en pixels
                      child: const Text(
                        "Choice to unlock your body's full potential. With our comprehensive tools and expert guidance",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            SvgPicture.asset(
              'assets/images/second.svg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              left: 15,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        50, // ou une largeur spécifique en pixels
                    child: const Text(
                      'Discover a New Level of Health',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width -
                        50, // ou une largeur spécifique en pixels
                    child: const Text(
                      "Choice to unlock your body's full potential. With our comprehensive tools and expert guidance",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
