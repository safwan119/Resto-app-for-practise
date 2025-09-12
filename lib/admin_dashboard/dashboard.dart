import 'package:flutter/material.dart';
import 'package:my_first_proj/admin_auth/login_panel.dart';
import 'package:my_first_proj/book_table_database/address_google_link.dart';
import 'package:my_first_proj/book_table_database/banner_database.dart';
import 'package:my_first_proj/book_table_database/name_desc_database.dart';
import 'package:my_first_proj/book_table_database/operation_promotion_hours.dart';
import 'package:my_first_proj/firebase_database/food_menu_database.dart';
import 'package:my_first_proj/firebase_database/restaurant_firebase_database.dart';
import 'package:my_first_proj/firebase_database/table_database_added.dart';
import 'package:my_first_proj/prome_code/promo_code_database.dart';
import 'package:my_first_proj/reservation/up_coming_reservation.dart';
import 'package:my_first_proj/vacation_mood/vacation_mode_database.dart';

import '../filter_menu/filter_menu_category.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "MAKE FLASH ORDER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Card(color: Colors.amber,
              child: TextButton(style: TextButton.styleFrom(shape: RoundedRectangleBorder(

          ),backgroundColor: Colors.amber
          ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPanel()));
              }, child: Text("SignOut")))
        ],
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ExpansionTile(title: Text("Pages"),
            subtitle: Text("Admin"),
            
            children: [
              ListTile(
                title: Text("Main Listing"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>RestaurantFirebaseDatabase()));
                },
              ),
              ListTile(
                title: Text("Restaurant banners"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodMenuDatabase()));
                },
              ),
              ListTile(
                title: Text("Table Setting"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TableDatabaseAdded()));
                },
              ),
              ListTile(
                title: Text("Filter Categories"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FilterChips()));
                },
              ),
              ListTile(
                title: Text("Name Description"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NameDescDatabase()));
                },
              ),
              ListTile(
                title: Text("Book Table Banner"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BannerDatabase()));
                },
              ),
              ListTile(
                title: Text("Operation Promotional Hours"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OperationalPromotionalHours()));
                },
              ),
              ListTile(
                title: Text("Address Google Link"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddressGoogleLink()));
                },
              ),
              ListTile(
                title: Text("Vacation Mode"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VacationModeDatabase()));
                },
              ),
              ListTile(
                title: Text("Reservation"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpcomingReservation()));
                },
              ),
              ListTile(
                title: Text("Add Promotion"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PromoCodeDatabase()));
                },
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
