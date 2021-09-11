import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/feeds_screen.dart';

class SplashScreen extends StatelessWidget {
  static String id = 'SplashScreen';
  @override
  Widget build(BuildContext context) {
    navigateToFeedsScreen() async {
      Navigator.pushReplacementNamed(context, FeedsScreen.id);
    }
    double height = MediaQuery.of(context).size.height;

    Timer(Duration(seconds: 2), () => navigateToFeedsScreen());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        child: Padding(
          padding: EdgeInsets.only(top: height * 0.4),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/fb-logo.png',
                  height: 65,
                  width: 65,
                ),
                Spacer(),
                Text(
                  'facebook',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/facebook-black.png' , height: 16, width: 16 , color: Colors.grey,),
                      SizedBox(width: 2,),
                      Image.asset('assets/icons/messenger-black.png' , height: 16, width: 16, color: Colors.grey,),
                      SizedBox(width: 2,),
                      Image.asset('assets/icons/instagram_black.png' , height: 16, width: 16, color: Colors.grey,),
                      SizedBox(width: 2,),
                      Image.asset('assets/icons/whatsapp-black.png' , height: 16, width: 16, color: Colors.grey,),
                      SizedBox(width: 2,),
                      Image.asset('assets/icons/linkedin-black.png' , height: 16, width: 16, color: Colors.grey,),

                    ],
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
