import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewProducts extends StatefulWidget {
  const ReviewProducts({super.key});

  @override
  State<ReviewProducts> createState() => _ReviewProductsState();
}

class _ReviewProductsState extends State<ReviewProducts> {
  final databaseReference = FirebaseDatabase.instance.ref("Star and Review");
  final dbRef = FirebaseDatabase.instance.ref("UserDetail");
  double _rating = 5.0;
  var itemIndex = 0;
  List<Map<String, dynamic>> foodList = [
    {"title": "All"},
    {"title": "Newest Rating"},
    {"title": "Highest Rating"},
    {"title": "Oldest Rating"},
  ];

  String getInitials(String? fullName) {
    if (fullName == null || fullName.trim().isEmpty) {
      return "U";
    }
    List<String> nameParts = fullName.trim().split(' ');
    if (nameParts.length == 1) {
      return nameParts[0].substring(0, 1).toUpperCase();
    }
    String firstNameInitial = nameParts[0][0].toUpperCase();
    String lastNameInitial = nameParts.last[0].toUpperCase();

    return "$firstNameInitial$lastNameInitial";
  }

  String timeAgo(DateTime dateTime) {
    return timeago.format(dateTime);
  }

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
              width: 170,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "MAKE FLASH ORDER",
                  style: TextStyle(
                    color: Colors.amber,
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
      endDrawer: Drawer1(),
      bottomNavigationBar: BottomNavigatorBar1(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_outlined),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Rating and Reviews",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                elevation: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "4.9",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(220, 35),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                StarRating(
                                  rating: _rating,
                                  allowHalfRating: false,
                                  onRatingChanged: (rating) =>
                                      setState(() => _rating = rating),
                                  size: 17,
                                  color: Colors.amber,
                                ),
                                Text(
                                  " 271 reviews",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      LinearProgressIndicator(
                        value: 0,
                        backgroundColor: Colors.black12,
                        color: Colors.amber,
                      ),
                      SizedBox(height: 12),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "5.0",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.9,
                              backgroundColor: Colors.black12,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "4.0",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor: Colors.black12,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "3.0",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: Colors.black12,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "2.0",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.5,
                              backgroundColor: Colors.black12,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "1.0",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: 0.2,
                              backgroundColor: Colors.black12,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodList.length,
                  itemBuilder: (context, index) {
                    String title = foodList[index]["title"];
                    Color color = index == 0 ? Colors.amber : Colors.black12;
                    return RatingDetail(title, color);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                ),
              ),
            ),
            SizedBox(height: 8),
            StreamBuilder(
              stream: dbRef.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData ||
                    snapshot.data!.snapshot.children.isEmpty) {
                  return Text("No data available");
                }
                final allData = snapshot.data!.snapshot.value as Map?;
                final first1 = allData!.values.first;
                return StreamBuilder(
                  stream: databaseReference.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                          color: Colors.black,
                        ),
                      );
                    }
                    if (!snapshot.hasData ||
                        snapshot.data!.snapshot.children.isEmpty) {
                      return Text("No comment available at that time");
                    }
                    if (snapshot.hasError) {
                      return Text("some error contain");
                    }
                    final allData1 = snapshot.data!.snapshot.value as Map?;
                    final List list = allData1!.values.toList();
                    return ListView.builder(
                      itemCount: list.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        double? doubleRating;
                        var ratingData = list[index]["rating"];
                        if (ratingData is int) {
                          doubleRating = ratingData.toDouble();
                        } else if (ratingData is String) {
                          doubleRating = double.tryParse(ratingData);
                        } else {
                          doubleRating = 0.0;
                        }
                        var timestampValue = list[index]['timestamp'];
                        DateTime? timestamp;
                        if (timestampValue is String) {
                          try {
                            int timestampInMs = int.parse(timestampValue);
                            timestamp = DateTime.fromMillisecondsSinceEpoch(
                              timestampInMs,
                            );
                          } catch (e) {
                            print('Error parsing timestamp string: $e');
                          }
                        } else if (timestampValue is int) {
                          timestamp = DateTime.fromMillisecondsSinceEpoch(
                            timestampValue,
                          );
                        }
                        return Card(
                          elevation: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    child: Text(
                                      getInitials(first1["Full name"] ?? ""),
                                    ),
                                  ),
                                  title: Text(
                                    first1["Full name"] ?? " ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    timestamp != null
                                        ? timeAgo(timestamp)
                                        : 'No date available',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      StarRating(
                                        rating: doubleRating!,
                                        allowHalfRating: false,
                                        onRatingChanged: (rating) => setState(
                                          () => doubleRating = rating,
                                        ),
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        ". ${list[index]["rating"] ?? " "} stars",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(list[index]["review"]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 85,
                                          color: Colors.white,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              topLeft: Radius.circular(12),
                                            ),
                                            child: Image.network(
                                              list[index]["image"] ?? "",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 1),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 85,
                                          color: Colors.white,
                                          child: ClipRRect(
                                            child: Image.network(
                                              list[index]["image"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 1),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 85,
                                          color: Colors.white,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                            child: Image.network(
                                              list[index]["image"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RatingDetail extends StatelessWidget {
  final String? title;
  final Color? colors;

  const RatingDetail(this.title, this.colors, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: colors!,
        overlayColor: Colors.amber,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () {},
      child: Center(
        child: Text(
          title!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
