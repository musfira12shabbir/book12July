import 'dart:io';

import 'package:eproject/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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

                      Text("Register.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),),

                      const SizedBox(height: 10,),

                      userProfile == null ? Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap:()async{
                                XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                                if(selectedImage != null){
                                  File convertedFile = File(selectedImage.path);
                                  setState(() {
                                    userProfile = convertedFile;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image Selected"),backgroundColor: Colors.green, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
                                }
                                else{
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image not Selected"),backgroundColor: Colors.red, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
                                  }
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                width: 100,
                                height: 40,
                                margin: const EdgeInsets.only(right: 14,bottom: 14),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera, size: 14,),
                                    Text("Choose Photo",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ) : Container(
                        width: double.infinity,
                        height: 150,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(userProfile!))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap:()async{
                                XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                                if(selectedImage != null){
                                  File convertedFile = File(selectedImage.path);
                                  setState(() {
                                    userProfile = convertedFile;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image Selected"),backgroundColor: Colors.green, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
                                }
                                else{
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Image not Selected"),backgroundColor: Colors.red, margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),behavior: SnackBarBehavior.floating,));
                                  }
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 40,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.only(right: 14,bottom: 14),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.camera, size: 14,),
                                    Text("Change Photo",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.user4,color: Colors.black,),
                            hintText: "Enter Your Name..",
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
                              prefixIcon: Icon(Iconsax.refresh1,color: Colors.black,),
                              hintText: "Enter Your Age..",
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
                              prefixIcon: Icon(Iconsax.house,color: Colors.black,),
                              hintText: "Enter Your Address..",
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
                              prefixIcon: Icon(Iconsax.key,color: Colors.black,),
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
                        if(context.mounted){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        }
                      }, style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.black)
                      ), child: const Text("Register",style: TextStyle(color: Colors.white),),),

                      const SizedBox(
                        height: 10,
                      ),



                    ],
                  ),
                ),


            const SizedBox(
              height: 10,
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
