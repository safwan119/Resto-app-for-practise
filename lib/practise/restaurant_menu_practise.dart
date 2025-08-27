import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../firestore/adding_firestore_database.dart';
class RestaurantMenuPractise extends StatefulWidget {
  const RestaurantMenuPractise({super.key});

  @override
  State<RestaurantMenuPractise> createState() => _RestaurantMenuPractiseState();
}

class _RestaurantMenuPractiseState extends State<RestaurantMenuPractise> {
  final dbRef = FirebaseDatabase.instance.ref("Restaurant");
  // final fireStore=FirebaseFirestore.instance.collection("Restaurant").snapshots();
  // CollectionReference FireStoreRef=FirebaseFirestore.instance.collection("Restaurant");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant Menu"),
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder<DatabaseEvent>(stream: dbRef.onValue, builder: (context,AsyncSnapshot<DatabaseEvent>snapshot){

        if(snapshot.connectionState==ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        if(snapshot.hasError){
          return Text("Some error");
        }
        if(!snapshot.hasData){
          return Text("Some error");
        }
        Map<dynamic,dynamic> map=snapshot.data!.snapshot.value as Map;
        List<dynamic> list=[];
        list.clear();
        list=map.values.toList();
        return Expanded(
          child: ListView.builder(itemCount: snapshot.data!.snapshot.children.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 6,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 135,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(list[index]["image"], fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                list[index]["title"],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),overflow: TextOverflow.visible,
                                softWrap: true,
                                maxLines: 2,
                              ),
                              Text(list[index]["subtitle"],overflow: TextOverflow.visible,softWrap: true,
                                maxLines: 2,),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  SizedBox(width: 12),
                                  Text(
                                    "4.9",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(". ${list[index]["halalOrNonHalal"]}"),
                                ],
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                );
          }),
        );

      }),
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.amber,
        onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddingFirestoreDatabase()));
      },child: Icon(Icons.add,color: Colors.black,),
      ),
    );
  }
}
