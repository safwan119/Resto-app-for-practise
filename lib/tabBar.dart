import 'package:flutter/material.dart';

class TabBar1 extends StatefulWidget {
  @override
  State<TabBar1> createState() => _TabBarState();
}

class _TabBarState extends State<TabBar1> {
  // late TabController _tabController;
  var itemIndex = 0;
  @override
  // void initState() {
  //   _tabController=TabController(length: 1, vsync: this)
  //   super.initState();
  // }
  Widget build(BuildContext context) {
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
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 80,
              color: Colors.white,
              child: TabBar(
                dividerColor: Colors.white,
                labelColor: Colors.amber,
                indicatorColor: Colors.amber,
                unselectedLabelColor: Colors.black,

                tabs: [
                  Tab(
                    child: Text(
                      "UPCOMING BOOKING",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "BOOKING HISTORY",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Column(
                  children: [
                    SizedBox(height: 17,),

                    Row(

                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 45),
                              child: Text(
                                "Reservation at 2PM, Today",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Reservation at McDonald's Seri Austin DT",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 9,),
                        Text(
                          "RM 82.3",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_right_outlined),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12,),
                    LinearProgressIndicator(
                      value: 0,

                    )





                  ],
                ),


                SingleChildScrollView(
               child: Column(
                 children: [
                   SizedBox(height: 17,),

                   Row(

                     children: [
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 45),
                             child: Text(
                               "Reservation at 3PM, Today",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text(
                               "Reservation at McDonald's Seri Austin DT",
                               style: TextStyle(fontSize: 14),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 9,),
                       Text(
                         "RM 82.3",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(),
                         child: IconButton(
                           onPressed: () {},
                           icon: Icon(Icons.keyboard_arrow_right_outlined),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 12,),
                   LinearProgressIndicator(
                     value: 0,

                   ),
                   SizedBox(height: 17,),

                   Row(

                     children: [
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 45),
                             child: Text(
                               "Reservation at 3PM, Today",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text(
                               "Reservation at McDonald's Seri Austin DT",
                               style: TextStyle(fontSize: 14),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 9,),
                       Text(
                         "RM 82.3",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(),
                         child: IconButton(
                           onPressed: () {},
                           icon: Icon(Icons.keyboard_arrow_right_outlined),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 12,),
                   LinearProgressIndicator(
                     value: 0,

                   ),
                   SizedBox(height: 17,),

                   Row(

                     children: [
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 45),
                             child: Text(
                               "Reservation at 3PM, Today",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text(
                               "Reservation at McDonald's Seri Austin DT",
                               style: TextStyle(fontSize: 14),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 9,),
                       Text(
                         "RM 82.3",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(),
                         child: IconButton(
                           onPressed: () {},
                           icon: Icon(Icons.keyboard_arrow_right_outlined),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 12,),
                   LinearProgressIndicator(
                     value: 0,

                   ),
                   SizedBox(height: 17,),

                   Row(

                     children: [
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 45),
                             child: Text(
                               "Reservation at 3PM, Today",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text(
                               "Reservation at McDonald's Seri Austin DT",
                               style: TextStyle(fontSize: 14),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 9,),
                       Text(
                         "RM 82.3",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(),
                         child: IconButton(
                           onPressed: () {},
                           icon: Icon(Icons.keyboard_arrow_right_outlined),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 12,),
                   LinearProgressIndicator(
                     value: 0,

                   ),
                   SizedBox(height: 17,),

                   Row(

                     children: [
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 45),
                             child: Text(
                               "Reservation at 3PM, Today",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text(
                               "Reservation at McDonald's Seri Austin DT",
                               style: TextStyle(fontSize: 14),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 9,),
                       Text(
                         "RM 82.3",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(),
                         child: IconButton(
                           onPressed: () {},
                           icon: Icon(Icons.keyboard_arrow_right_outlined),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 12,),
                   LinearProgressIndicator(
                     value: 0,

                   ),
                   SizedBox(height: 17,),

                   Row(

                     children: [
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 45),
                             child: Text(
                               "Reservation at 3PM, Today",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text(
                               "Reservation at McDonald's Seri Austin DT",
                               style: TextStyle(fontSize: 14),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 9,),
                       Text(
                         "RM 82.3",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(),
                         child: IconButton(
                           onPressed: () {},
                           icon: Icon(Icons.keyboard_arrow_right_outlined),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 12,),
                   LinearProgressIndicator(
                     value: 0,

                   ),
                   SizedBox(height: 17,),

                   Row(

                     children: [
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 45),
                             child: Text(
                               "Reservation at 3PM, Today",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text(
                               "Reservation at McDonald's Seri Austin DT",
                               style: TextStyle(fontSize: 14),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 9,),
                       Text(
                         "RM 82.3",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(),
                         child: IconButton(
                           onPressed: () {},
                           icon: Icon(Icons.keyboard_arrow_right_outlined),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 12,),
                   LinearProgressIndicator(
                     value: 0,

                   ),
                   SizedBox(height: 17,),

                   Row(

                     children: [
                       Column(
                         // crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 45),
                             child: Text(
                               "Reservation at 3PM, Today",
                               style: TextStyle(
                                 fontSize: 17,
                                 fontWeight: FontWeight.bold,
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 10),
                             child: Text(
                               "Reservation at McDonald's Seri Austin DT",
                               style: TextStyle(fontSize: 14),
                             ),
                           ),
                         ],
                       ),
                       SizedBox(width: 9,),
                       Text(
                         "RM 82.3",
                         style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(),
                         child: IconButton(
                           onPressed: () {},
                           icon: Icon(Icons.keyboard_arrow_right_outlined),
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 12,),
                   LinearProgressIndicator(
                     value: 0,

                   ),

                 ],



               ),
                )
                        ]),
            ),
          ],
        ),
      ),
    );
  }
}
