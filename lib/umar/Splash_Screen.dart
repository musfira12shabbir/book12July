import 'dart:async';

import 'package:eproject/Register.dart';
import 'package:flutter/material.dart';

import '../login.dart';
import '../main.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(milliseconds: 3000),  () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),)),);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('images/Logo.png',)),
          ),
        ),
      ),
    );
  }
}