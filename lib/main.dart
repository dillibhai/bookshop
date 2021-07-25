
import 'package:firebase_core/firebase_core.dart';
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
class LandingPage extends StatelessWidget {
  final Future<FirebaseApp>_initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
              child: Text("Error:${snapshot.error}"),
            ),
          );
        }
        //connection made to firebase
        if(snapshot.connectionState==ConnectionState.done){
          return Scaffold(
            body: Container(child: Center(child: Text('Firebase App initialized'),),),
          );
        }
        return Scaffold(
          body: Center(
            child: Text(
              'Initialization app.....'
            ),
          ),
        );
      },
    );
  }
}