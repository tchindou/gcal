import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gcal/utils/colors.dart';
import 'package:gcal/view/widgets/header/header-title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                ),
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Pofile',
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 5, left: 10),
              child: badges.Badge(
                showBadge: true,
                position: badges.BadgePosition.topEnd(top: 1, end: 1),
                badgeContent: const Text(
                  "2",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: red,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> bottomSheet() {
    return showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 60,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const HeaderDesc(title: "Filtre"),
              ElevatedButton(
                child: const Text('Close BottomSheet'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

// Données à afficher.
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Chapitre A',
      'children': [
        {'title': 'Section A1'},
        {'title': 'Section A2'},
      ],
    },
    {
      'title': 'Chapitre B',
      'children': [
        {'title': 'Section B0'},
        {'title': 'Section B1'},
      ],
    },
  ];

  Widget _buildTiles(Map<String, dynamic> root) {
    if (root['children'] == null || (root['children'] as List).isEmpty) {
      return ListTile(title: Text(root['title']));
    }

    return ExpansionTile(
      key: PageStorageKey<String>(root['title']),
      title: HeaderDesc(title: root['title']),
      collapsedIconColor: green,
      children: (root['children'] as List)
          .map((child) => _buildTiles(child))
          .toList(),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      badges.Badge(
                        showBadge: true,
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: green,
                        ),
                        position: badges.BadgePosition.bottomEnd(
                          bottom: 10,
                          end: -10,
                        ),
                        badgeContent: IconButton(
                          onPressed: () {
                            bottomSheet();
                          },
                          color: green,
                          iconSize: 30,
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          width: 150,
                          height: 150,
                          child: const CircleAvatar(
                            backgroundImage:
                                NetworkImage("https://i.pravatar.cc/300"),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Text(
                        'TCHINDOU Alaise',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'alaise_tchindou.com',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: const Color(0xFFC1C1C1),
                        ),
                      ),
                      const Gap(10),
                      for (var entry in data) _buildTiles(entry),
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
