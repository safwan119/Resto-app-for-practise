import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/firebase_database/table_database.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
class TableDatabaseAdded extends StatefulWidget {
  const TableDatabaseAdded({super.key});

  @override
  State<TableDatabaseAdded> createState() => _TableDatabaseAddedState();
}

class _TableDatabaseAddedState extends State<TableDatabaseAdded> {
  final dbRefer=FirebaseDatabase.instance.ref("Tables");
  final TablesServices tablesServices = TablesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tables added"),
        backgroundColor: Colors.black12,
      ),
      body:Column(
        children: [
          Expanded(child: StreamBuilder(stream: dbRefer.onValue, builder: (context,AsyncSnapshot<DatabaseEvent>snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Container(child: Center(child: CircularProgressIndicator()));
            }
            if (!snapshot.hasData || snapshot.data!.snapshot.value == null) {
              return Text("No data available");
            }

            Map<dynamic,dynamic>map=snapshot.data!.snapshot.value as Map<dynamic,dynamic>;
            List list=map.values.toList();
            return ListView.builder(itemCount: list.length,
                itemBuilder: (context,index){
              return ListTile(
                title: Text(list[index]["Name"]??""),
                subtitle: Text("Capacity:${list[index]["capacity"]??""}"),
                trailing: IconButton(onPressed: (){
                 tablesServices.deleteTable(list[index]["id"]??"");
                }, icon: Icon(Icons.delete,color: Colors.red,)),
              );
            });
          })
          ),
         RoundedButton(title: "Add Table", ontap: (){
           int tableNo=DateTime.now().millisecondsSinceEpoch % 1000;
           tablesServices.addTables("Table $tableNo", 2);
         }),
         SizedBox(height: 40,),

        ],
      ),
    );
  }
}
