import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpButtonItem extends StatelessWidget {
  final String imagepath;
  final String buttonName;
  final double size;
  final VoidCallback onTap;

  const SignUpButtonItem(
      this.imagepath,
      this.buttonName,
      this.size,
      this.onTap,
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Card(
            color: Colors.black,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  imagepath,
                  height: size,
                  width: size,
                ),
                SizedBox(width: 15,),
                Text(
                  buttonName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
