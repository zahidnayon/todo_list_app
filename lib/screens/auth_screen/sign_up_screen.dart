import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/auth_screen/phone_auth_screen.dart';
import 'package:todo_list_app/screens/auth_screen/sign_in_screen.dart';
import 'package:todo_list_app/widgets/sign_up_widgets/sign_up_button_item.dart';
import 'package:todo_list_app/widgets/sign_up_widgets/sign_up_color_button.dart';
import 'package:todo_list_app/widgets/sign_up_widgets/sign_up_text_item.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todo_list_app/sevices/auth_service.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SignUpButtonItem(
                "assets/images/google.svg",
                "Continue with Google",
                40,
                      () async {
                    await authClass.googleSignIn(context);
                  }
              ),
              SizedBox(
                height: 10,
              ),
              SignUpButtonItem(
                "assets/images/phone.svg",
                "Continue with Mobile",
                40,
                  (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => PhoneAuthScreen()));
                  }
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Or",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              SignUpTextItem("Email", _emailController,false),
              SizedBox(
                height: 15,
              ),
              SignUpTextItem("Password", _passwordController,true),
              SizedBox(
                height: 30,
              ),
          SignUpColorButton(
            firebaseAuth: firebaseAuth,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you have already an account? ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (builder) => SignInScreen()),
                              (route) => false);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
