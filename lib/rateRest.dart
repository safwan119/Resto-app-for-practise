
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RateRestorant extends StatefulWidget{
  @override
  State<RateRestorant> createState() => _RateRestorantState();
}

class _RateRestorantState extends State<RateRestorant> {
  var guestno1 =TextEditingController();
  String guestcount1="1";
  var  itemIndex=0;
  var note1=TextEditingController();
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
              SizedBox(height: 10,),
              Card(
                elevation: 3,
                child:
                    Container(
                      height: 70,
                      width: 400,
                      color: Colors.white,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Text("M",style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 20,fontStyle: FontStyle.italic),),
          
                        ),
                        title: Text("MC Donalds Austin DT",style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("Dine in Reservation,2PM,aug 2",style: TextStyle(fontSize: 13),),
                        trailing: Text("Rate Restaurant",style: TextStyle(color: Colors.blue),),
                      ),
                    ),
          
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 160),
                child: Text(
                  "Reservation Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Card(
                // elevation: 4,
                child: Container(
                  width: double.infinity,
                  height: 66,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 7,),
                      Column(

                        children: [
                          SizedBox(height: 19,),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("GUESTS",style: TextStyle(fontSize:15,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          Text("${guestcount1} GUESTS")
                        ],
                      ),
                      IconButton(onPressed: (){
                        showDialog(context: context, builder:(context){
                          return AlertDialog(
                            title:Text("Enter the Number of Guests",style: TextStyle(color: Colors.black),) ,
                            content: TextField(
                              controller: guestno1,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  hintText: "Enter value"
                              ),
                            ),
                            actions: [

                              ElevatedButton(
                                  style:ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("Exit",style: TextStyle(color: Colors.black),)),
                              ElevatedButton(
                                  style:ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                                  onPressed: (){
                                    setState(() {
                                      guestcount1=guestno1.text.toString();
                                    });
                                    Navigator.pop(context);
                                  }, child: Text("Ok",style: TextStyle(color: Colors.black),))
                            ],
                          );
                        });
                      },

                          icon: Icon(Icons.arrow_drop_down)),
                      SizedBox(width: 5,),
                      Text("|",style: TextStyle(fontSize: 27),),
                      SizedBox(width: 9,),
                      Column(

                        children: [
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.only(right: 27),
                            child: Text("Date",style: TextStyle(fontSize:18,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          Text("SAT,2 AUG")
                        ],
                      ),
                      // SizedBox(width: 2,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down)),
                      SizedBox(width: 2,),
                      Text("|",style: TextStyle(fontSize: 27),),
                      SizedBox(width: 9,),
                      Column(

                        children: [
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text("Time",style: TextStyle(fontSize:18,color: Colors.black,fontWeight: FontWeight.bold),),
                          ),
                          Text("12:00 PM")
                        ],
                      ),
                      // SizedBox(width: 4,),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_drop_down)),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 380,
                child: LinearProgressIndicator(
                  color: Colors.black12,
                  value: 0,
          
                ),
              ),
              SizedBox(height: 18,),
              Padding(
                padding: const EdgeInsets.only(right: 210),
                child: Text(
                  "Order Summary",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 22),)



                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                          ],
                        ),
                      ),
                    ),
                  ),
                  // Icon(Icons.delete_rounded, color: Colors.red, size: 30),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                          ],
                        ),
                      ),
                    ),
                  ),
                  // Icon(Icons.delete_rounded, color: Colors.red, size: 30),
                ],
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        width: 371,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 2,),
                            Container(
                              width: 110,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset("assets/image/picture.jpg",fit: BoxFit.cover,),

                              ),
                            ),
                            SizedBox(width: 3,),
                            Column(
                              children: [
                                SizedBox(height: 6,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 82),
                                  child: Text("Laksa lpsum",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Text("Original flavour,spicy spices"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 110),
                                  child: Text("RM 17.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                                ),

                              ],
                            ),
                            SizedBox(width: 27,),
                            Text("1x",style: TextStyle(color: Colors.amber,fontSize: 21),)



                          ],
                        ),
                      ),
                    ),
                  ),
                  // Icon(Icons.delete_rounded, color: Colors.red, size: 30),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: 380,
                child: LinearProgressIndicator(
                  color: Colors.black12,
                  value: 0,
                ),
              ),
              SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.only(right: 215),
                 child: Text("Your added note",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
               ),
              SizedBox(height: 1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: note1,
                  maxLines: 5,
                  decoration: InputDecoration(

                    hintText: "Please make the laksa I ordered extra spicy!",
                    hintStyle:TextStyle(color: Colors.black)  ,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24,),
              Container(
                width: 380,
                child: LinearProgressIndicator(
                  value: 0,
                  color: Colors.black12,
                ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("SUBTOTAL",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(width: 220,),
                  Text("RM 78.00",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                ],
              ),
              // SizedBox(height: 6,),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("SERVICE CHARGE",style: TextStyle(),),
                  ),
                  SizedBox(width: 185,),
                  Text("RM 7.02",style: TextStyle(color: Colors.black,fontSize: 15),),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text("PROMO CODE",style: TextStyle(),),
                  ),
                  SizedBox(width: 202,),
                  Text("- RM 5.00",style: TextStyle(color: Colors.black,fontSize: 15),),
                ],
              ),

              SizedBox(height: 10,),
              Container(
                width: 380,
                child: LinearProgressIndicator(
                  color: Colors.black12,
                  value: 0,

                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Card(
                  elevation: 5,
                  child: Container(
                    width: 390,
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
                onTap: (){},
              ),
              SizedBox(height: 20,),
          
            ],
          ),
        ),
      ),
    );

  }
}