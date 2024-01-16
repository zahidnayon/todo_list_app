import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({Key? key}) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  int start = 30;
  bool wait = false;
  String buttonNane = "Send";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "SignUp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            PhoneTextField(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 30,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                  Text(
                    "Enter 6 Digit OTP",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: Colors.grey,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            PhoneOtpField(),
            SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "Send OTP again in ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellowAccent,
                  ),
                ),
                TextSpan(
                  text: "00:$start",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.pinkAccent,
                  ),
                ),
                TextSpan(
                  text: " sec",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.yellowAccent,
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 120,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 60,
              decoration: BoxDecoration(
                color: Color(0xffff9601),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Let's Go",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xfffbe2ae),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void StartTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget PhoneOtpField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width - 30,
      fieldWidth: 55,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Color(0xff1d1d1d),
        borderColor: Colors.white,
      ),
      style: TextStyle(
        fontSize: 17,
        color: Colors.white,
      ),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        print("Completed: " + pin);
      },
    );
  }

  Widget PhoneTextField() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xff1d1d1d),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your phone number",
          hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            child: Text(
              " (+880) ",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () {
                    StartTimer();
                    setState(() {
                      start = 30;
                      wait = true;
                      buttonNane = "Resend";
                    });
                  },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                buttonNane,
                style: TextStyle(
                    color: wait ? Colors.grey : Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
