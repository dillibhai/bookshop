
import 'package:bookshop/views/landing_page.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFE7E9F5),
        accentColor: Color(0xFFE7E9F5),
      ),
      home: LandingPage(),
    );
  }
}
