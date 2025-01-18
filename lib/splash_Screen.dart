import 'dart:async';

import 'package:flutter/material.dart';
import 'package:product_api/singup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   @override
  void initState(){
     super.initState();
     Timer(Duration(seconds: 5),(){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
     });


   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asstes/image/delevery boy.jpg', height: 250),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
