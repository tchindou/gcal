import 'package:flutter/material.dart';

class AppBarInp extends StatefulWidget implements PreferredSizeWidget {
  final String type;
  final double screenHeight;
  final TabController tabController;

  const AppBarInp(
      {required this.type,
      required this.tabController,
      required this.screenHeight,
      Key? key})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(screenHeight * 0.3);

  @override
  _AppBarInpState createState() => _AppBarInpState();
}

class _AppBarInpState extends State<AppBarInp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = widget
        .tabController; // Utilisez le TabController passé en tant que propriété
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/images/icons/vunope.png'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'gcal',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: '',
                      color: Color(0xFF312BA1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(
              top: 30,
            ),
            child: const Text(
              'Bienvenue à la page de connexion',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Dosis',
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TabBar(
                controller: _tabController,
                isScrollable: false,
                tabs: const [
                  Tab(text: 'Se connecter'),
                  Tab(text: "S'inscrire"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
