import 'package:eproject/MVC/register_screen/register_model.dart';
import 'package:eproject/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'MVC/register_screen/register_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPassword = TextEditingController();
  UserRegisterLogin userRegisterLogin = UserRegisterLogin();

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

                     const Text("Login.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),

                      const SizedBox(
                        height: 20,
                      ),


                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: userEmail,
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
                          controller: userPassword,
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
                          userRegisterLogin.userLogin(LoginModel(
                            userEmail: userEmail.text,
                            userPassword: userPassword.text
                          ), context);
                      }, style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black)
                      ), child: const Text("Login",style: TextStyle(color: Colors.white),),),

                      const SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),));
                          },
                          child: const Text("Don't have an Account. Create One.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),)),

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
