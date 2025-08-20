import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowPicture extends StatefulWidget {
  @override
  State<ShowPicture> createState() => _ShowPictureState();
}

class _ShowPictureState extends State<ShowPicture> {
  String guestcount="1";
  var gustno=TextEditingController();
  var index1=1;
  var itemIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Mcdonald's-Seri Austin DT",
          style: TextStyle(
            color: Colors.black,
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
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
            SizedBox(height: 60),
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
          padding: const EdgeInsets.only(left: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 17),
              Card(
                color: Colors.white,
                elevation: 3,
                child: Container(
                  width: 610,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Guests
                      Container(
                        height: 80,
                        width: 190,
                        color: Colors.white,
                        child: ListTile(
                          title: Text("Guests"),
                          subtitle: Text(
                            "${guestcount} Guests",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: (){
                              showDialog(context: context, builder: (context){
                                return AlertDialog(
                                  title: Text("Enter the number of Guests",style: TextStyle(color: Colors.black),),
                                  content: TextField(
                                    controller: gustno,
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
                                      // print("${gustno} GUESTS");
                                      setState(() {
                                     guestcount=gustno.text.toString();

                                      });

                                      Navigator.pop(context);
                                    }, child: Text("Ok",style: TextStyle(color: Colors.black)))
                                  ],
                                  // content: SingleChildScrollView(
                                  //   child: Column(
                                  //     children: [
                                  //       ElevatedButton(child: Text("Guest++"),onPressed: (){
                                  //         setState(() {
                                  //           index1++;
                                  //
                                  //         });
                                  //       },),
                                  //       SizedBox(height: 12,),
                                  //       ElevatedButton(child: Text("Guest--"),onPressed: (){
                                  //         setState(() {
                                  //           index1--;
                                  //           if(index1<=0){
                                  //             Navigator.pop(context);
                                  //           }
                                  //         });
                                  //       },),
                                  //       // ElevatedButton(child: Text("GUEST+1"),onPressed: (){},),
                                  //       // ElevatedButton(child: Text("${index1+2}  Guest"),onPressed: (){},),
                                  //       // ElevatedButton(child: Text("${index1+3}  Guest"),onPressed: (){},),
                                  //       // ElevatedButton(child: Text("${index1+4}  Guest"),onPressed: (){},),
                                  //       // ElevatedButton(child: Text("${index1+5}  Guest"),onPressed: (){},),
                                  //       // ElevatedButton(child: Text("${index1+6}  Guest"),onPressed: (){},),
                                  //     ],
                                  //   ),
                                  // ),

                                );
                              });
                            },

                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                      Text("|",
                          style: TextStyle(fontSize: 40,color: Colors.black12)
                         ),

                      // Date
                      Container(
                        height: 80,
                        width: 190,
                        color: Colors.white,
                        child: ListTile(
                          title: Text("Date"),
                          subtitle: Text(
                            "SAT 2,AUG",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                      Text("|", style: TextStyle(fontSize: 40,color: Colors.black12)),

                      // Time
                      Container(
                        height: 80,
                        width: 190,
                        color: Colors.white,
                        child: ListTile(
                          title: Text("Time"),
                          subtitle: Text(
                            "10:00 PM",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Message Container
              Container(
                width: 600,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.do_not_disturb_alt_sharp),
                    SizedBox(width: 15),
                    Text(
                      "At the moment there is no availability for today. The next availability\n for 3 guests is tomorrow",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Card(
                child: Container(
                  height: 50,
                  width: 600,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        height: 30,
                        width: 130,
                        // color: Colors.black12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.amber,
                            overlayColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(child: Text("Asian")),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: 130,
                        // color: Colors.black12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black12,
                            overlayColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(child: Text("Western")),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: 130,
                        // color: Colors.black12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black12,
                            overlayColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(child: Text("Local")),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: 130,
                        // color: Colors.black12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black12,
                            overlayColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(child: Text("Non-Halal")),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: 130,
                        // color: Colors.black12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black12,
                            overlayColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(child: Text("Vegeterian")),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: 130,
                        // color: Colors.black12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black12,
                            overlayColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(child: Text("Thailand")),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: 130,
                        // color: Colors.black12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black12,
                            overlayColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(child: Text("Chinese")),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        height: 30,
                        width: 130,
                        // color: Colors.black12,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black12,
                            overlayColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black12),
                            ),
                          ),
                          onPressed: () {},
                          child: Center(child: Text("Beverian")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Stack(
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(fixedSize: Size(200, 300)),
                            onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ShowPicture(),));
                            }, child:
                          Container(
                            height: 300,
                            width: 200,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/image/picture.jpg",
                                    width: 200,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text("Laksa Johor",style:
                                TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                Text("A speciality of Malaysian island of penag...",style: TextStyle(color: Colors.black),),
                                ListTile(
                                  title: Text("RM 17.00",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                                  trailing: Icon(Icons.add_box,size: 20,color: Colors.amber,),
                                )
                              ],
                            ),
                          ),),
                          SizedBox(width: 60),
                          // Text("Muhammad Safwan")
                          Column(
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(fixedSize: Size(200, 300)),
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPicture()));
                                }, child:
                              Container(
                                height: 300,
                                width: 200,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        "assets/image/picture.jpg",
                                        width: 200,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text("Laksa Johor",style:
                                    TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                    Text("A speciality of Malaysian island of penag...",style: TextStyle(color: Colors.black),),
                                    ListTile(
                                      title: Text("RM 17.00",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                                      trailing: Icon(Icons.add_box,size: 20,color: Colors.amber,),
                                    ),
                                  ],
                                ),
                              ),),
                            ],
                          ),
                        ],
                      ),
                      // SizedBox(height: 1000,),
                      Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/image/picture.jpg",
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 60,),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/image/picture.jpg",
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                              ],
                            ),
                     // SizedBox(width: 50,),
                     //
                     // Container(
                     //   width: 200,
                     //   height: 300,
                     //   child: Column(
                     //     children: [
                     //       ClipRRect(
                     //         borderRadius: BorderRadius.circular(15),
                     //         child: Image.asset(
                     //           "assets/image/picture.jpg",
                     //           width: 200,
                     //           height: 150,
                     //           fit: BoxFit.cover,
                     //         ),
                     //       ),
                     //     ],
                     //   ),
                     // ),
                     // Text("Laksa Johor",style:
                     // TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                     // Text("A speciality of Malaysian island of penag...",style: TextStyle(color: Colors.black),),
                     // ListTile(
                     //   title: Text("RM 17.00",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                     //   trailing: Icon(Icons.add_box,size: 20,color: Colors.amber,),
                     // ),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Card(
                          color: Colors.white,
                          elevation: 15,

                          child: Positioned(
                           top: 200,
                            left: 20,
                            right: 20,
                            child: Container(
                              height: 600,
                              width: 650,

                              child: Column(
                                children: [
                                  SizedBox(height: 10),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 630,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.asset(
                                            "assets/image/picture.jpg",
                                            width: 200,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
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
                                    ],
                                  ),
                                  Text(
                                    "Laksa johor                                               RM 19.80",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 29,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Center(
                                      child: Text(
                                        "A specialiaty of the Malaysian Island of Penang.The soup is made with mackeral and \n autantic taste",
                                      ),
                                    ),
                                  ),
                                 SizedBox(height: 20,),
                                  Column(
                                    children: [
                                      Align(
                                          alignment:Alignment.centerLeft,
                                          child: Text("Flavour",style: TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.bold,fontSize: 26),))
                                    ,Row(
                                      children: [
                                        Icon(Icons.check_circle,color: Colors.blue,),
                                        Text("Original"),

                                      ],
                                    ),
                                      Row(
                                        children: [
                                          Icon(Icons.circle_outlined,),
                                          Text("Medium"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.circle_outlined,),
                                          Text("Mix(Original and Spicy only)"),
                                        ],
                                      ),
                                      Align(
                                          alignment:Alignment.centerLeft,
                                          child: Text("Spices",style: TextStyle(color: Colors.black,
                                              fontWeight: FontWeight.bold,fontSize: 26),))
                                      ,Row(
                                        children: [
                                          Icon(Icons.check_circle,color: Colors.blue,),
                                          Text("Spicy"),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.circle_outlined,),
                                          Text("Spicier"),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.circle_outlined,),
                                          Text("Extra Spicy"),
                                        ],
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 20,),

                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber,fixedSize: Size(1000, 40)),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("Add to Card"),

                                  )


                                ],
                              ),
                            ),
                          ),
                                          ),
                        ),
                      ),]
                  ),
                ],
              ),
              // SizedBox(height: 20,),
            
            ],
          ),
    ],),),),
    );
  }
}
