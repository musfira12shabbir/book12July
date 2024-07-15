import 'package:carousel_slider/carousel_slider.dart';
import 'package:eproject/MVC/register_screen/register_controller.dart';
import 'package:eproject/addtocart.dart';
import 'package:eproject/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'description_screen.dart';


class UserDashBoard extends StatefulWidget {
  const UserDashBoard({super.key});

  @override
  State<UserDashBoard> createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {

  String uEmail = "";

  List bookImages = [
    'https://img.freepik.com/free-photo/free-photo-ramadan-kareem-eid-mubarak-royal-elegant-lamp-with-mosque-holy-gate-with-fireworks_1340-23600.jpg',
    'data:image/jpeg;base64,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',
  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.parrucchierilucapiattelli.it%2F%3Fo%3Dthe-30-best-selling-novels-of-all-time-how-mm-V4LDbSx&psig=AOvVaw34ZYcSbgWN2ZJGdc2vUmbm&ust=1709967080256000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCJi9lfyJ5IQDFQAAAAAdAAAAABAJ',
  'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.goodreads.com%2Fbook%2Fshow%2F12380695-man-o-salwa&psig=AOvVaw2mJtVyB58av0eN3YlWtp86&ust=1709967293271000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCICdqduK5IQDFQAAAAAdAAAAABAE'
  ];

  List bookCate = ["Adventure", "Adventure","Adventure","Adventure" ];
  // Book Name
  List bookName = ["Harry Potter", "Rich dad poor dad"];
  // Book Price
  List bookPrice = ["\$49", "\$100"];
  // Book Rating
  List bookRating = [4.5, 5];

  UserRegisterLogin userRegisterLogin = UserRegisterLogin();

  @override
  void initState() {
    // TODO: implement initState
    UserRegisterLogin.userCredGet().then((val){
      setState(() {
        uEmail = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation =2.0;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("logo.png"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(child: Text(uEmail,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),)),
            const Center(
              child: SizedBox(
                width: 40,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WishListScreen(),));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const ListTile(
                  leading: Icon(Iconsax.heart),
                  title: Text("Your WishList"),
                ),
              ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const ListTile(
                  leading: Icon(Iconsax.shopping_bag),
                  title: Text("Your Cart"),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const ListTile(
                leading: Icon(Iconsax.user),
                title: Text("Your Profile"),
              ),
            ),
            GestureDetector(
              onTap: (){
                userRegisterLogin.userLogout(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: const ListTile(
                  leading: Icon(Iconsax.logout_1, color: Colors.red,),
                  title: Text("Logout", style: TextStyle(color: Colors.red),),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                width: double.infinity,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Builder(builder: (context) => IconButton(
                      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
                      onPressed: (){
                      Scaffold.of(context).openDrawer();
                    }, icon: const Icon(Iconsax.textalign_justifyright
                      ,),),),

                    const Text("Book App", style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),

                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue[500],
                      backgroundImage: const AssetImage('images/logo.png'),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                  ),

                  const SizedBox(
                    width: 6,
                  ),

                  const Text("Categories We Deal", style: TextStyle(color: Colors.black ,fontSize: 14,fontWeight: FontWeight.w600),),

                  const SizedBox(
                    width: 6,
                  ),

                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 16,
              ),

              CarouselSlider.builder(
                  itemCount: bookImages.length,
                  itemBuilder:  (context, index, realIndex) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      width: double.infinity,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                            image: NetworkImage(bookImages[index]))
                      ),
                      child:  Container(
                          margin: const EdgeInsets.only(left: 14,top: 120),
                          child:  Text(bookCate[index], style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),)),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 180,
                    viewportFraction: 1,
                    autoPlayInterval: const Duration(milliseconds: 2000),
                    scrollDirection: Axis.vertical
                  )),

              const SizedBox(
                height: 16,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                  ),

                  const SizedBox(
                    width: 6,
                  ),

                  const Text("Our Best Selling", style: TextStyle(color: Colors.black ,fontSize: 14,fontWeight: FontWeight.w600),),

                  const SizedBox(
                    width: 6,
                  ),

                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 16,
              ),

              SizedBox(
                width: double.infinity,
                height: 240,
                child: Hero(
                  tag: "bookImage",
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                    return index != 3 ? GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDescription( bookImage: bookImages[index]),));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                        width: 160,
                        height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                                image: NetworkImage(bookImages[index])),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: 1,
                                  blurRadius: 10
                              )
                            ]
                        ),
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, top: 140),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Islamic Book", style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                                Row(  
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 12,
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                      },
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Text("4.5", style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                const Text("View Details", style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                              ],
                            )),
                      ),
                    ) : Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 160,
                      height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),

                        ),
                        alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("View All", style: TextStyle(color: Colors.red ,fontSize: 14,fontWeight: FontWeight.w600),),
                          SizedBox(width: 4,),
                          Icon(Icons.chevron_right_sharp, color: Colors.red,)
                        ],
                      )
                    );
                  },),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                  ),

                  const SizedBox(
                    width: 6,
                  ),

                  const Text("New To Shell", style: TextStyle(color: Colors.black ,fontSize: 14,fontWeight: FontWeight.w600),),

                  const SizedBox(
                    width: 6,
                  ),

                  SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1,
                    ),
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              SizedBox(
                width: double.infinity,
                height: 240,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return index != 3 ? GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDescription(bookImage: bookImages[index]),));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                        width: 160,
                        height: 220,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                                image: NetworkImage(bookImages[index])),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: 1,
                                  blurRadius: 10
                              )
                            ]
                        ),
                        child: Container(
                            margin: const EdgeInsets.only(left: 10, top: 140),
                            child:  Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Mystery Book", style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                                Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 12,
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                      },
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Text("4.5", style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                                  ],
                                ),
                                const Text("View Details", style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w400),),
                              ],
                            )),
                      ),
                    ) : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: 160,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),

                        ),
                        alignment: Alignment.center,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("View All", style: TextStyle(color: Colors.red ,fontSize: 14,fontWeight: FontWeight.w600),),
                            SizedBox(width: 4,),
                            Icon(Icons.chevron_right_sharp, color: Colors.red,)
                          ],
                        )
                    );
                  },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
