import 'package:firebase_database/firebase_database.dart';
import 'package:my_first_proj/util/utills.dart';
class TablesServices{
  final dbRef=FirebaseDatabase.instance.ref("Tables");
   Future<void> addTables(String name,int capacity)async{
     String id=DateTime.now().millisecondsSinceEpoch.toString();
    await dbRef.child(id).set({
       "id":id,
       "Name":name,
       "capacity":capacity,
     }).then((value){
       Utils().toastMessage("Added Successfully");
     }).onError((error,stackTrace){
       Utils().toastMessage(error.toString());
     });
   }
   Future<void> deleteTable(String id)async{
     await dbRef.child(id).remove().then((value){
       Utils().toastMessage("Remove Successfully");
     }).onError((error,stackTrace){
       Utils().toastMessage(error.toString());
     });
   }
}