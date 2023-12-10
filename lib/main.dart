import 'package:flutter/material.dart';
import 'package:gcal/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute, //const Home();
    );
  }
}
