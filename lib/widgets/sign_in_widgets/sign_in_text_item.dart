import 'package:flutter/material.dart';
// import 'package:todo_list_app/screens/auth_screen/sign_up_screen.dart';

class SignInTextItem extends StatelessWidget {
  final String labeltext;
  final TextEditingController controller;
  final bool obscureText;

  const SignInTextItem(this.labeltext, this.controller,this.obscureText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 45,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: labeltext,
          labelStyle: TextStyle(fontSize: 17, color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
