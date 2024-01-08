import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gcal/utils/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  String url = dotenv.env['SUPABASE_URL']!;
  String key = dotenv.env['SUPABASE_KEY']!;

  await Supabase.initialize(
    url: url,
    anonKey: key,
  );
  if (kDebugMode) {
    print("supabase \n\t-url : $url\n\t-key : $key");
  }
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
