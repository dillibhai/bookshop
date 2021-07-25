
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
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Center(
          child: Text("hello world"),
        ),
      ),
    );
  }
}