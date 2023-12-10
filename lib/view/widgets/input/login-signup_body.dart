import 'package:flutter/material.dart';

class LoginSignUpBody extends StatefulWidget {
  final int index;

  // Utilisez "key" comme argument nommé dans le constructeur
  const LoginSignUpBody({Key? key, required this.index}) : super(key: key);

  @override
  State<LoginSignUpBody> createState() => _LoginSignUpBodyState();
}

class _LoginSignUpBodyState extends State<LoginSignUpBody> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    // Créez le contrôleur de tab en fonction de l'index passé
    _tabController = TabController(length: 2, vsync: this);

    // Sélectionnez l'onglet en fonction de l'index passé
    _tabController.index = widget.index;
  }

  @override
  void dispose() {
    // Assurez-vous de libérer le contrôleur lorsque vous n'en avez plus besoin
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: [],);
  }
}
