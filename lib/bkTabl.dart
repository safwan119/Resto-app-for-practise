import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookTable extends StatefulWidget {
  @override
  State<BookTable> createState() => _BookTableState();
}

class _BookTableState extends State<BookTable> {
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
        child: Column(
          children: [
            Center(
              child: Container(
                width: 1000,
                height: 300,
                color: Colors.black,
                child: Image.asset(
                  "assets/image/image1.jpg",
                  // width: 1000,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Card(
              color: Colors.white,
              child: Container(
                height: 110,
                width: 1000,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Mcdonald's-Seri Austin DT",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "McDonald's Corporation is an American multinational fast food chain,\nfounded in 1940 as a restaurant operated by Richard and Maurice McDonald,\nin san Bernardino,California,United States.",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              color: Colors.white,
              child: Container(
                height: 490,
                width: 1000,
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
                    Container(
                      height: 40,
                      width: 900,
                      color: Colors.black12,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              "SUNDAY-TUESDAY",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 660),
                          Text(
                            "10:00 - 18:00",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 40,
                      width: 900,
                      color: Colors.black12,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              "WEDNESDAY-THURSDAY",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 620),
                          Text(
                            "11:00 - 18:00",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 40,
                      width: 900,
                      color: Colors.black12,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              "WEEKENDS",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 710),
                          Text(
                            "12:00 - 18:00",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
                    Container(
                      height: 40,
                      width: 900,
                      color: Colors.black12,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              "RECEiVE 30% OFF",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 665),
                          Text(
                            "10:00 - 12:00",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 40,
                      width: 900,
                      color: Colors.black12,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              "RECEiVE 45% OFF",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 665),
                          Text(
                            "11:00 - 18:00",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      height: 40,
                      width: 900,
                      color: Colors.black12,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Text(
                              "RECEiVE 50% OFF",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 665),
                          Text(
                            "12:00 - 18:00",
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 27),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.location_on,
                              size: 30,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          "Lot 132943,Persiaran Jaya Putra,Taman Seri Austin,81100 johor \nBahru,johor",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 54,
              width: 1000,
              // color: Colors.black,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: (){}, child: Text("BOOK A TABLE NOW",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),)),
            ),
            SizedBox(height: 15),

            // Message Container
            Container(
              width: 1000,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Icon(Icons.do_not_disturb_alt_sharp),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "At the moment there is no availability for today. The next availability\n for 3 guests is tomorrow",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),

                ],
              ),
            ),
            SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }
}
