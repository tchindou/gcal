import 'package:flutter/material.dart';
import 'package:gcal/utils/colors.dart';
import 'package:gcal/utils/routes.dart';
import 'package:gcal/view/screens/landing-screen.dart';

// ignore: must_be_immutable
class WalkBottom extends StatefulWidget {
  WalkBottom({Key? key, required this.controller, required this.index})
      : super(key: key);

  PageController controller;
  int index;

  @override
  State<WalkBottom> createState() => _WalkBottomState();
}

class _WalkBottomState extends State<WalkBottom> {
  @override
  void dispose() {
    widget.controller.removeListener(_handlePageChange);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handlePageChange);
  }

  void _handlePageChange() {
    setState(() {
      widget.index = widget.controller.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.index == 0)
        ? Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, '/landing');
                  },
                  child: const Text('SKIP'),
                ),
                Row(
                  children: List.generate(3, (itr) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.index == itr ? green : White1,
                      ),
                    );
                  }),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: green,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: white0,
                    ),
                    onPressed: () {
                      widget.controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : (widget.index == 1)
            ? Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: green,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: white0,
                        ),
                        onPressed: () {
                          widget.controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                      ),
                    ),
                    Row(
                      children: List.generate(3, (itr) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.index == itr ? green : white0,
                          ),
                        );
                      }),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: green,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          color: white0,
                        ),
                        onPressed: () {
                          widget.controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: 100,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: green,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: white0,
                        ),
                        onPressed: () {
                          widget.controller.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        },
                      ),
                    ),
                    Row(
                      children: List.generate(3, (itr) {
                        return Container(
                          width: 10.0,
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.index == itr ? green : white0,
                          ),
                        );
                      }),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, '/landing');
                      },
                      child: const Text('Finish'),
                    ),
                  ],
                ),
              );
  }
}

// Rest of your code remains unchanged...
