
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/time_date_card/time_date_card.dart';

class RateRestorant extends StatefulWidget{
  @override
  State<RateRestorant> createState() => _RateRestorantState();
}

class _RateRestorantState extends State<RateRestorant> {
  var guestno1 =TextEditingController();
  String guestcount1="1";
  var  itemIndex=0;
  var note1=TextEditingController();
  List<Map<String,dynamic>> FoodDetailList1=[
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
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Card(
                elevation: 3,
                child:
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Text("M",style: TextStyle(color: Colors.amber,fontSize: 20,fontFamily: "M font"),),

                        ),
                        title: Text("MC Donald's Austin DT",style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("Dine in Reservation,2PM,aug 2",style: TextStyle(fontSize: 13),),
                        trailing: Text("Rate Restaurant",style: TextStyle(color: Colors.blue),),
                      ),
                    ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
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
             padding: const EdgeInsets.symmetric(horizontal: 15),
             child: TimeDateCard(),
           ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,
              ),
            ),
            SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(alignment: Alignment.centerLeft,
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: FoodDetailList1.length,
                  itemBuilder: (context,index){
                    String title=FoodDetailList1[index]["title"];
                    return FoodDetail1(title);
                  }),
            ),
            SizedBox(height: 2),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,
              ),
            ),
            SizedBox(height: 20,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
               child: Align(
                   alignment: Alignment.centerLeft,
                   child: Text("Your added note",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),)),
             ),
            SizedBox(height: 1,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: note1,
                maxLines: 5,
                decoration: InputDecoration(

                  hintText: "Please make the laksa I ordered extra spicy!",
                  hintStyle:TextStyle(color: Colors.black)  ,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(8),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                SizedBox(width: 17,),
                Text("SUBTOTAL",style: TextStyle(),),
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
            Row(
              children: [
                SizedBox(width: 17,),
                Text("PROMO CODE",style: TextStyle(),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text("- RM 5.00",style: TextStyle(color: Colors.black,fontSize: 15),),
                ),
              ],
            ),

            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LinearProgressIndicator(
                color: Colors.black12,
                value: 0,

              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.amber,

                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call,size: 30,),
                          SizedBox(width: 20,),
                          Text("Need Help? Contact Resto Support",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onTap: (){},
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );

  }
}
class FoodDetail1 extends StatelessWidget {
  String? title;
  FoodDetail1(this.title);

  @override
  Widget build(BuildContext context) {
    return Card(
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
          );
  }
}