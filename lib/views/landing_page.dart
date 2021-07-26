import 'package:bookshop/views/home_page.dart';
import 'package:bookshop/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }
        //connecction made firebase is running
        if (snapshot.connectionState == ConnectionState.done) {
          //streambuilder can check the login state
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              //if stream snapshot has error
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }
              //connection state sctive - Do the user login check inside the
              //...if statement
              if (streamSnapshot.connectionState == ConnectionState.active) {
                //get the user
                Object? _user = streamSnapshot.data;
                //if the user is null, we're not logged in
                if (_user == null) {
                  return LoginPage();
                } else {
                  //the user is logged in, head to homepage
                  return HomePage();
                }
              }
              //checking the auth state- loading
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          );
        }

        //initalizing firebase app .... loading
        return Scaffold(
            body: Center(
          child:CircularProgressIndicator()
        ));
      },
    );
  }
}
