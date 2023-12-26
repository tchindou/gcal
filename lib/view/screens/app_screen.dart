// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:gcal/view/export_view.dart';
import 'package:gcal/view/widgets/export_widget.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (_currentIndex == 0)
            ? const Home()
            : (_currentIndex == 1)
                ? const Search()
                : (_currentIndex == 2)
                    ? const Profile()
                    : const Profile(),
      ),
      bottomNavigationBar: BtmNavBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
