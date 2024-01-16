import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  void signup() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: "zahidnet@gmail.com", password: "123456");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List App"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            signup();
          },
          child: Text("signup"),
        ),
      ),
    );
  }
}
