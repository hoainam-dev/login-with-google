import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_with_google/page/home_page.dart';
import 'package:login_with_google/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'MainPage';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData.dark().copyWith(accentColor: Colors.indigo),
      home: HomePage(),
    )
  );
}
