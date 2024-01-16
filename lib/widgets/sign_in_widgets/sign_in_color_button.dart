import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:todo_list_app/screens/home_page.dart';

class SignInColorButton extends StatefulWidget {
  final firebase_auth.FirebaseAuth firebaseAuth;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool circular;

  SignInColorButton({
    required this.firebaseAuth,
    required this.emailController,
    required this.passwordController,
    this.circular = false,
  });

  @override
  _SignInColorButtonState createState() => _SignInColorButtonState();
}

class _SignInColorButtonState extends State<SignInColorButton> {
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          circular = true;
        });
        try {
          firebase_auth.UserCredential userCredential =
          await widget.firebaseAuth.signInWithEmailAndPassword(
            email: widget.emailController.text,
            password: widget.passwordController.text,
          );
          print(userCredential.user?.email);
          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomePage()),
                  (route) => false);
        } catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 90,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.circular ? 30 : 20),
          gradient: LinearGradient(
            colors: [
              Color(0xfffd746c),
              Color(0xffff9068),
              Color(0xfffd746c),
            ],
          ),
        ),
        child: Center(
          child: circular
              ? CircularProgressIndicator()
              : Text(
            "Sign In",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
