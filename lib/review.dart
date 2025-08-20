
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class ReviewProducts extends StatefulWidget{
  @override
  State<ReviewProducts> createState() => _ReviewProductsState();
}

class _ReviewProductsState extends State<ReviewProducts> {
  double _rating=5.0;
  double _rating1=4.0;

  var  itemIndex=0;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Column(
          children: [
            Text(
              "RESTO.COM",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 150,
              height: 25,
              // color: Colors.black,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "MAKE FLASH ORDER",
                  style: TextStyle(
                    color: Colors.amber,
                    // backgroundColor: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.yellow,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(),
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,

                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close, size: 20, grade: 12),
                ),
              ),
            ),
            SizedBox(height: 35),
            ListTile(
              title: Text(
                "My Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdresDetail()));
              },
            ),
            ListTile(
              title: Text(
                "RESTO.COM Bussiness",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Help Centre",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Privacy&Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "LogOut",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.logout),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber,

        onTap: (index) {
          setState(() {
            itemIndex = index;
          });
        },
        currentIndex: itemIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Restaurants"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_activity),
            label: "Activity",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: "Finance",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.support), label: "Support"),

                  ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 18,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_outlined)),
                  ),
                  SizedBox(width: 12,),
                  Text("Rating and Reviews",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: Container(
                    width: 400,
                    height: 275,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 17),
                              child: Text("4.9",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                          SizedBox(width: 12,),
                           ElevatedButton(
                             style: ElevatedButton.styleFrom(fixedSize: Size(214, 35)),
                               onPressed: (){}, child: Row(
                             children: [
                               StarRating(
                        rating: _rating,
                                 allowHalfRating: false,
                                 onRatingChanged: (rating)=>setState(() =>_rating=rating),
                                 size: 17,
                                 color: Colors.amber,
                               ),
                               // Icon(Icons.star,color: Colors.amber,),
                               // Icon(Icons.star,color: Colors.amber,),
                               // Icon(Icons.star,color: Colors.amber,),
                               // Icon(Icons.star,color: Colors.amber,),
                               // Icon(Icons.star,color: Colors.amber,),
                               Text(" 271 reviews",style: TextStyle(color: Colors.black),)
                             ],
                           ))
                          ],
                        ),
                        SizedBox(height: 12,),
                        LinearProgressIndicator(
                     value: 0,
                          backgroundColor: Colors.black12,
                          color: Colors.amber,
                        ),
                        SizedBox(height: 12,),

                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("5.0",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              width: 315,

                              child: LinearProgressIndicator(
                                value: 0.9,
                                backgroundColor: Colors.black12,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),

                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("4.0",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              width: 315,

                              child: LinearProgressIndicator(
                                value: 0.5,
                                backgroundColor: Colors.black12,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),

                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("3.0",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              width: 315,

                              child: LinearProgressIndicator(
                                value: 0.7,
                                backgroundColor: Colors.black12,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),

                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("2.0",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              width: 315,

                              child: LinearProgressIndicator(
                                value: 0.5,
                                backgroundColor: Colors.black12,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12,),

                        Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("1.0",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(width: 12,),
                            Container(
                              width: 315,

                              child: LinearProgressIndicator(
                                value: 0.2,
                                backgroundColor: Colors.black12,
                                color: Colors.amber,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),


                  ),
                ),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: InkWell(
                            onTap: (){},
                              child: Center(child: Text("All",style: TextStyle(color:Colors.black,fontSize: 23,fontWeight: FontWeight.bold),))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Center(child: Text("Newest Rating",style: TextStyle(color:Colors.black,fontSize: 23,fontWeight: FontWeight.bold),))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Center(child: Text("Highest Rating",style: TextStyle(color:Colors.black,fontSize: 23,fontWeight: FontWeight.bold),))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                              onTap: (){},
                              child: Center(child: Text("Oldest Rating",style: TextStyle(color:Colors.black,fontSize: 26,fontWeight: FontWeight.bold),))),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 8,),
             Padding(

               padding: const EdgeInsets.all(8.0),
               child: Card(
                 elevation: 3,
                 child: Container(
                   // margin: EdgeInsets.only(right: 50),
                   width: 400,
                   height: 312,
                   // color: Colors.white,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     color: Colors.white,

                   ),
                   child: Column(
                     children: [
                       ListTile(
                         leading: CircleAvatar(
                           backgroundColor: Colors.amber,
                           child: Text("F"),
                         ),
                         title: Text("Fatin",style: TextStyle(fontWeight: FontWeight.bold
                         ),),
                         subtitle: Text("22 days ago"),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(left: 16),
                         child: Row(
                           children: [
                             StarRating(
                               rating: _rating,
                               allowHalfRating: false,
                               onRatingChanged: (rating)=>setState(()=>_rating=rating),
                               color: Colors.amber,
                             ),
                             // Icon(Icons.star,color: Colors.amber,),
                             // Icon(Icons.star,color: Colors.amber,),
                             // Icon(Icons.star,color: Colors.amber,),
                             // Icon(Icons.star,color: Colors.amber,),
                             // Icon(Icons.star,color: Colors.amber,),
                             Text(". 5 stars",style: TextStyle(color: Colors.black),)
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Text("Overall taste is excellent,meal is fresh ,sides are provided accouratly,the meat is cooked well done\n following my instruction!"),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           children: [
                             Container(
                               width: 117,
                               height: 120,
                               color: Colors.white,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),topLeft: Radius.circular(22)),
                                 child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),
                               ),
                             ),
                             SizedBox(width: 1,),
                             Container(
                               width: 117,
                               height: 120,
                               color: Colors.white,
                               child: ClipRRect(
                                 // borderRadius: BorderRadius.circular(25),
                                 child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),
                               ),
                             ),
                             SizedBox(width: 1,),
                             Container(
                               width: 117,
                               height: 120,
                               color: Colors.white,
                               child: ClipRRect(
                                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(22),topRight: Radius.circular(22)),
                                 child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),
                               ),
                             ),
                           ],
                         ),
                       )
                     ],
                   ),

                 ),
               ),
             ),
              // SizedBox(height: 7,),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: Container(
                    width: 400,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                    ),
                    child: Column(
                      children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: ListTile(
                      leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                        child: Text("F"),
                      ),
                      title: Text("Fatin",style: TextStyle(fontWeight: FontWeight.bold
                      ),),
                      subtitle: Text("22 days ago"),
                                        ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: Row(
                      children: [
                        StarRating(
                          rating: _rating1,
                          onRatingChanged: (rating)=>setState(()=>_rating1=rating),
                          color: Colors.amber,
                        ),
                        // Icon(Icons.star,color: Colors.amber,),
                        // Icon(Icons.star,color: Colors.amber,),
                        // Icon(Icons.star,color: Colors.amber,),
                        // Icon(Icons.star,color: Colors.amber,),
                        // Icon(Icons.star_border_purple500_outlined),
                        Text(". 4 stars",style: TextStyle(color: Colors.black),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Overall taste is excellent,meal is fresh ,sides are provided accouratly,the meat is cooked well done\n following my instruction!"),
                  ),
                ]
                ),
              )

        )),

              SizedBox(height: 8,),
              Padding(

                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: Container(
                    // margin: EdgeInsets.only(right: 50),
                    width: 400,
                    height: 312,
                    // color: Colors.white,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,

                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.amber,
                            child: Text("F"),
                          ),
                          title: Text("Fatin",style: TextStyle(fontWeight: FontWeight.bold
                          ),),
                          subtitle: Text("22 days ago"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Row(
                            children: [
                              StarRating(
                                rating:_rating,
                                allowHalfRating: false,
                                onRatingChanged: (rating)=>setState(()=>_rating=rating),
                                color: Colors.amber,
                              ),
                              // Icon(Icons.star,color: Colors.amber,),
                              // Icon(Icons.star,color: Colors.amber,),
                              // Icon(Icons.star,color: Colors.amber,),
                              // Icon(Icons.star,color: Colors.amber,),
                              // Icon(Icons.star,color: Colors.amber,),
                              Text(". 5 stars",style: TextStyle(color: Colors.black),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Overall taste is excellent,meal is fresh ,sides are provided accouratly,the meat is cooked well done\n following my instruction!"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 117,
                                height: 120,
                                color: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22),topLeft: Radius.circular(22)),
                                  child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(width: 1,),
                              Container(
                                width: 117,
                                height: 120,
                                color: Colors.white,
                                child: ClipRRect(
                                  // borderRadius: BorderRadius.circular(25),
                                  child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(width: 1,),
                              Container(
                                width: 117,
                                height: 120,
                                color: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(22),topRight: Radius.circular(22)),
                                  child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                  ),
                ),
              ),
                      ],
                    ),

                  ),
                ),


    );

  }
}