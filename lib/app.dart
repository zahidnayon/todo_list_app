import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/auth_screen/sign_up_screen.dart';

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}