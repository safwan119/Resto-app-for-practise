import 'package:firebase_database/firebase_database.dart';
import 'package:my_first_proj/utill/utills.dart';
class TablesServices{
  final dbRef=FirebaseDatabase.instance.ref("Tables");
   Future<void> addTables(String name,int capacity)async{
     String id=DateTime.now().millisecondsSinceEpoch.toString();
    await dbRef.child(id).set({
       "id":id,
       "Name":name,
       "capacity":capacity,
     }).then((value){
       Utills().toastmessage("Added Successfully");
     }).onError((error,stackTrace){
       Utills().toastmessage(error.toString());
     });
   }
   Future<void> deleteTable(String id)async{
     await dbRef.child(id).remove().then((value){
       Utills().toastmessage("Remove Successfully");
     }).onError((error,stackTrace){
       Utills().toastmessage(error.toString());
     });
   }
}