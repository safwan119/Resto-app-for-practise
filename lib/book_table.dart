import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/book_table_database/address_google_link.dart';
import 'package:my_first_proj/book_table_database/operation_promotion_hours.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:my_first_proj/restaurant_food_menu.dart';
import 'package:url_launcher/url_launcher.dart';
class BookTable extends StatefulWidget {
  const BookTable({super.key});
  @override
  State<BookTable> createState() => _BookTableState();
}

class _BookTableState extends State<BookTable> {
  var itemIndex = 0;
  final databaseReference = FirebaseDatabase.instance.ref("Name Desc");
  final databaseRef = FirebaseDatabase.instance.ref("Banner");
  final realtimeDatabaseRef=FirebaseDatabase.instance.ref("Operation Promotion Hours");
  final firebaseDatabaseRef = FirebaseDatabase.instance.ref("Address and Link");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined),
            ),
            Expanded(
              child: Text(
                "Mcdonald's-Seri Austin DT",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber,
      ),
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddressGoogleLink()),
          );
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              StreamBuilder(
                stream: databaseRef.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 4,
                      ),
                    );
                  }
                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.children.isEmpty) {
                    return Center(child: Text("No data available"));
                  }
                  if (snapshot.hasError) {
                    return Text("Any error contain");
                  }
                  final data = Map<String, dynamic>.from(
                    snapshot.data!.snapshot.value as Map,
                  );
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: double.infinity,
                      color: Colors.black,
                      child: Image.network(
                        data["image"] ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              StreamBuilder(
                stream: databaseReference.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 4,
                      ),
                    );
                  }
                  if (!snapshot.hasData ||
                      snapshot.data!.snapshot.children.isEmpty) {
                    return Center(child: Text("No data available"));
                  }
                  if (snapshot.hasError) {
                    return Text("Any error contain");
                  }
                  final data = Map<String, dynamic>.from(
                    snapshot.data!.snapshot.value as Map,
                  );
                  return Card(
                    color: Colors.white,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Text(
                            data["name"] ?? "",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(data["description"] ?? ""),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              StreamBuilder(stream: realtimeDatabaseRef.onValue
                  , builder: (context,AsyncSnapshot<DatabaseEvent>snapshot){
                 if(snapshot.connectionState==ConnectionState.waiting){
                   return Center(child: CircularProgressIndicator());
                 }
                 if(!snapshot.hasData || snapshot.data!.snapshot.children.isEmpty){
                   return Center(child: Text("No data available"));
                 }
                 if(snapshot.hasError){
                   return Text("Any error accour");
                 }
                 final allData=Map<String,dynamic>.from(
                  snapshot.data!.snapshot.value as Map
                 );
                 return  Card(
                   color: Colors.white,
                   child: SizedBox(
                     width: double.infinity,
                     child: Column(
                       children: [
                         SizedBox(height: 20),
                         Text(
                           "OPERATION HOURS",
                           style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 20,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Container(
                             height: 40,
                             width: double.infinity,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Colors.black12,
                             ),

                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.symmetric(
                                     horizontal: 18,
                                   ),
                                   child: Text(
                                     "SUNDAY-TUESDAY",
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold,
                                     ),
                                     overflow: TextOverflow.ellipsis,
                                   ),
                                 ),
                                 Spacer(),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 15),
                                   child: Text(
                                     "${allData["sunToTuesOpen"]??" "} - ${allData["sunToTuesClose"]??" "}",
                                     style: TextStyle(
                                       color: Colors.amber,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(height: 12),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Container(
                             height: 40,
                             width: double.infinity,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Colors.black12,
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Flexible(
                                   child: Padding(
                                     padding: const EdgeInsets.symmetric(
                                       horizontal: 18,
                                     ),
                                     child: Text(
                                       "WEDNESDAY-THURSDAY",
                                       style: TextStyle(
                                         color: Colors.black,
                                         fontWeight: FontWeight.bold,
                                       ),
                                       overflow: TextOverflow.ellipsis,
                                       softWrap: true,
                                       maxLines: 1,
                                     ),
                                   ),
                                 ),
                                 // Spacer(),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 15),
                                   child: Text(
                                     "${allData["WedToThurOpen"]??" "} - ${allData["WedToThurClose"]??" "}",
                                     style: TextStyle(
                                       color: Colors.amber,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(height: 12),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Container(
                             height: 40,
                             width: double.infinity,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Colors.black12,
                             ),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.symmetric(
                                     horizontal: 18,
                                   ),
                                   child: Text(
                                     "WEEKENDS",
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                                 Spacer(),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 15),
                                   child: Text(
                                     "${allData["weekEndOpen"]??" "} - ${allData["weekEndClose"]??" "}",
                                     style: TextStyle(
                                       color: Colors.amber,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(height: 20),
                         Text(
                           "PROMOTIONAL HOURS",
                           style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.bold,
                             fontSize: 20,
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Container(
                             height: 40,
                             width: double.infinity,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Colors.black12,
                             ),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.symmetric(
                                     horizontal: 18,
                                   ),
                                   child: Text(
                                     "RECEiVE ${allData["sunOff"]}",
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                                 Spacer(),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 15),
                                   child: Text(
                                     "${allData["sunOpenOff"]??" "} - ${allData["sunCloseOff"]??" "}",
                                     style: TextStyle(
                                       color: Colors.amber,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(height: 12),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Container(
                             height: 40,
                             width: double.infinity,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Colors.black12,
                             ),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.symmetric(
                                     horizontal: 18,
                                   ),
                                   child: Text(
                                     "RECEiVE ${allData["monOff"]}",
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                                 Spacer(),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 15),
                                   child: Text(
                                     "${allData["monOpenOff"]??" "} - ${allData["monCloseOff"]??" "}",
                                     style: TextStyle(
                                       color: Colors.amber,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(height: 12),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 10),
                           child: Container(
                             height: 40,
                             width: double.infinity,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: Colors.black12,
                             ),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.symmetric(
                                     horizontal: 18,
                                   ),
                                   child: Text(
                                     "RECEiVE ${allData["tueOff"]}",
                                     style: TextStyle(
                                       color: Colors.black,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                                 Spacer(),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 15),
                                   child: Text(
                                     "${allData["tueOpenOff"]??" "} - ${allData["tueCloseOff"]??" "}",
                                     style: TextStyle(
                                       color: Colors.amber,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         SizedBox(height: 15),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20),
                           child: Divider(color: Colors.black),
                         ),
                         StreamBuilder(stream: firebaseDatabaseRef.onValue
                             , builder: (context,AsyncSnapshot<DatabaseEvent>snapshot){
                               if(snapshot.connectionState==ConnectionState.waiting){
                                 return Center(child: CircularProgressIndicator());
                               }
                               if(!snapshot.hasData || snapshot.data!.snapshot.children.isEmpty){
                                 return Center(child: Text("No data available"));
                               }
                               if(snapshot.hasError){
                                 return Text("Any error accour");
                               }
                               final allMapData=Map<String,dynamic>.from(
                                   snapshot.data!.snapshot.value as Map
                               );
                               return  Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 20),
                                     child: IconButton(
                                       onPressed: () async{
                                         final String urlString = allMapData["googleMapLink"] ?? "";
                                         final Uri uri = Uri.parse(urlString);
                                       if(await canLaunchUrl(uri)){
                                         await launchUrl(uri,mode: LaunchMode.externalApplication);
                                       }
                                       else{
                                         throw 'Could not launch $uri';
                                       }
                                       },
                                       icon: Icon(
                                         Icons.location_on,
                                         size: 30,
                                         color: Colors.amber,
                                       ),
                                     ),
                                   ),
                                   Expanded(
                                     child: Text(
                                      allMapData["address"]??" ",
                                     ),
                                   ),
                                 ],
                               );
                             }),
                       ],
                     ),
                   ),
                 );

                  }),
              SizedBox(height: 12),
              InkWell(
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantFoodMenu()));
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      "BOOK A TABLE NOW",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Message Container
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 5),
                    Icon(Icons.do_not_disturb_alt_sharp),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "At the moment there is no availability for today. The next availability for 3 guests is tomorrow",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
