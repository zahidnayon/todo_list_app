import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/sign_in_widgets/sign_in_button_item.dart';
import 'package:todo_list_app/widgets/sign_in_widgets/sign_in_color_button.dart';
import 'package:todo_list_app/widgets/sign_in_widgets/sign_in_text_item.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool circular = false;

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
                "Sign In",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SignInButtonItem(
                "assets/images/google.svg",
                "Continue with Google",
                40,
              ),
              SizedBox(
                height: 10,
              ),
              SignInButtonItem(
                "assets/images/phone.svg",
                "Continue with Mobile",
                40,
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
              SignInTextItem("Email", _emailController,false),
              SizedBox(
                height: 15,
              ),
              SignInTextItem("Password", _passwordController,true),
              SizedBox(
                height: 30,
              ),
              SignInColorButton(
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
                    "If you haven't an account? ",
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
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text(
                "Forgot Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
