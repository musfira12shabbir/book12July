import 'dart:io';

import 'package:eproject/Register.dart';
import 'package:eproject/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  File? userProfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(color: Colors.black12.withOpacity(0.1),spreadRadius: 1, blurRadius: 10)
                      ]
                  ),
                  child: Column(

                    children: [

                      const SizedBox(height: 20,),

                      Text("Login.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),

                      const SizedBox(
                        height: 20,
                      ),


                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.message,color: Colors.black,),
                              hintText: "Enter Your Email..",
                              hintStyle: TextStyle(fontSize: 12),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                              )
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.key1,color: Colors.black,),
                              hintText: "Enter Your Password..",
                              hintStyle: TextStyle(fontSize: 12),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black, width: 2),
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                              )
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const UserDashBoard(),));
                      }, style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.black)
                      ), child: const Text("Login",style: TextStyle(color: Colors.white),),),

                      const SizedBox(
                        height: 10,
                      ),



                    ],
                  ),
                ),


            const SizedBox(
              height: 10,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
