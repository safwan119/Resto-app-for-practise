// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';

import 'bottom_navigator/bottom_navigator_bar.dart';

class ReviewOrder extends StatefulWidget {
  @override
  State<ReviewOrder> createState() => _ReviewOrderState();
}

class _ReviewOrderState extends State<ReviewOrder> {
  var notes = TextEditingController();
  String guestcount1 = "1";
  var guestno1 = TextEditingController();
  var name = TextEditingController();
  var number = TextEditingController();
  var itemIndex = 0;
  var code=TextEditingController();
  List<Map<String,dynamic>> FoodDetailList=[
    {
      "title":"Laksa johor"
    },
    {
      "title":"Laksa Penang"
    },
    {
      "title":"Laksa Lorem"
    },
    {
      "title":"Laksa Ipsum"
    },
  ];
  Widget build(BuildContext contex) {
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
              height: 26,
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
      endDrawer: Drawer1(),
      bottomNavigationBar:BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                 IconButton(
                   onPressed: () {
                     Navigator.pop(context);
                   },
                   icon: Icon(Icons.arrow_back_outlined,size: 20,color: Colors.black,),
                 ),

                SizedBox(width: 8),
                Text(
                  "Review order details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Align(alignment: Alignment.centerLeft,
                child: Text(
                  " Contact details",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: number,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "+92 | 3401234456",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Reservation Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TimeDateCard(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemCount: FoodDetailList.length,
                   itemBuilder: (context,index){
                 String title=FoodDetailList[index]["title"];
                   return FoodDetail(title);
               }),
             ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Add your notes(Optional)",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: notes,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "The cake I ordered is for surprised party!",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black)
                  ),
                ),
              ),
            ),
            SizedBox(height: 19,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,

              ),
            ),
            SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: code,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.code_off),
                            hintText: " |   ENTER PROMO CODE HERE",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.blue)
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: Colors.black)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4,),
                      InkWell(
                        child: Container(
                          height: 55,
                          width: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.amber,

                          ),
                          child: Center(child: Text("Use",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),

                        ),
                        onTap: (){},
                      )
                    ],
                  ),
                ),

            SizedBox(height: 15,),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                      color:Colors.amber
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                      Icon(Icons.monetization_on_sharp),
                      SizedBox(width: 20,),
                      Text("|"),
                      SizedBox(width:30),
                      Text("REDEEM RM 5 WITH YOUR COINS",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              onTap: (){},
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,

              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 17,),
                Text("SUBTOTAL",style: TextStyle(fontWeight: FontWeight.bold),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text("RM 78.00",style: TextStyle(color: Colors.black,fontSize: 15),),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 17,),
                Text("SERVICE CHARGE",style: TextStyle(),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text("RM 7.02",style: TextStyle(color: Colors.black,fontSize: 15),),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,

              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  elevation: 4,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color:Colors.amber,

                    ),
                     child: Row(
                       children: [
                         SizedBox(width: 20,),
                         Text("Place Order Now",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                       Spacer(),
                         Padding(
                           padding: const EdgeInsets.only(right:20),
                           child: Text("RM 78.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                         ),
                       ],
                     ),
                  ),
                ),
              ),
              onTap: (){},
            )
          ],
        ),
      ),
    );
  }
}
class FoodDetail extends StatelessWidget {
  String? title;
  FoodDetail(this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: Container(
                color: Colors.white,
              child: Row(
                children: [
                  SizedBox(width: 6,),
                  Container(
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                    ),
                  ),
                  SizedBox(width: 6,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8,),
                      Text(title!,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      Text("Original flavour,spicy spices"),
                      Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 8,),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),),
                  )

                ],
              ),
            ),
          ),
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.delete_rounded,color: Colors.red,size: 30,)),

      ],
    );
  }
}

