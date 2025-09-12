import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_first_proj/rounded_button/rounded_button.dart';
import 'package:my_first_proj/util/utills.dart';
class PromoCodeDatabase extends StatefulWidget {
  const PromoCodeDatabase({super.key});

  @override
  State<PromoCodeDatabase> createState() => _PromoCodeDatabaseState();
}

class _PromoCodeDatabaseState extends State<PromoCodeDatabase> {
  final promoCodeController=TextEditingController();
  final promoPercentageController=TextEditingController();
  bool loading=false;
  final databaseReference=FirebaseDatabase.instance.ref("Promo Codes");
  String? id;
  User? user=FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    if(user!=null){
      id=user!.uid;
    }
    else{
      print("No User Login at that time");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Promo Code"),
        backgroundColor: Colors.black12,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft,
                child: Text("Promotion Code",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),))
         ,TextFormField(
           controller: promoCodeController,
              decoration: InputDecoration(
                hintText: "Enter Promo Code here"
              ),
         ),
            Align(alignment: Alignment.centerLeft,
                child: Text("Promotion Amount (%RM)",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),))
            ,TextFormField(
              controller: promoPercentageController,
              decoration: InputDecoration(
                  hintText: "Enter Promo Percentage or Amount"
              ),
            ),
            SizedBox(height: 20,),
            RoundedButton(title: "Save",loading: loading, ontap: (){
              setState(() {
                loading=true;
              });
             final ids=DateTime.now().millisecondsSinceEpoch.toString();
              databaseReference.child(ids).set({
               "promo":promoCodeController.text,
               "percentage":promoPercentageController.text,
               "id":ids
             }).then((value){
               setState(() {
                 loading=false;
               });
               Utils().toastMessage("Added Successfully");
               promoCodeController.clear();
               promoPercentageController.clear();
             }).onError((error,stackTrace){
               Utils().toastMessage(error.toString());
               setState(() {
                 loading=false;
               });
             });
            }),
            StreamBuilder(stream: databaseReference.onValue, builder: (context,AsyncSnapshot<DatabaseEvent>snapshot){
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(!snapshot.hasData || snapshot.data!.snapshot.children.isEmpty){
                return Center(child: Text("No data available"));
              }
              final data=snapshot.data!.snapshot.value as Map?;
              final list=data!.values.toList();
              print("Data in this is :$data");
              return ListView.separated(itemCount: list.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                print("The promo code in thia ia :${list[index]["promo"]}");
                 return Row(
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Promotion Code",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),)
                         ,
                         Text(list[index]["promo"]??" "),
                         Text("Promotion Amount (%RM)",style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.bold),)
                         ,
                         Text(list[index]["percentage"]??' '),
                       ],
                     ),
                     Spacer(),
                     IconButton(onPressed: (){
                       databaseReference.child(list[index]["id"]).remove().then((value){
                         Utils().toastMessage("Delete Successfully");
                       });
                     }, icon: Icon(Icons.delete,color: Colors.red,))
                   ],
                 );
              }, separatorBuilder: (BuildContext context, int index) {
                return Divider();
                },);
            }),
          ],
        ),
      ),
    );
  }
}
