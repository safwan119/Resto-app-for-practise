import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:my_first_proj/bottom_navigator/bottom_navigator_bar.dart';
import 'package:my_first_proj/drawer/drawer.dart';

class ReviewProducts extends StatefulWidget {
  @override
  State<ReviewProducts> createState() => _ReviewProductsState();
}

class _ReviewProductsState extends State<ReviewProducts> {
  double _rating = 5.0;
  double _rating1 = 4.0;
  var itemIndex = 0;
  List<Map<String, dynamic>> FoodList = [
    {"title": "All"},
    {"title": "Newest Rating"},
    {"title": "Highest Rating"},
    {"title": "Oldest Rating"},
  ];

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
                                  " 271 reviews",overflow: TextOverflow.ellipsis,
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
              child: Container(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: FoodList.length,
                  itemBuilder: (context, index) {
                    String title = FoodList[index]["title"];
                    Color color = index == 0 ? Colors.amber : Colors.black12;
                    return RatingDetail(title, color);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 8),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PersonRatingCard(),
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
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Text("F"),
                        ),
                        title: Text(
                          "Fatin",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("22 days ago"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            StarRating(
                              rating: _rating1,
                              onRatingChanged: (rating) =>
                                  setState(() => _rating1 = rating),
                              color: Colors.amber,
                            ),
                            Text(
                              ". 4 stars",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Overall taste is excellent,meal is fresh ,sides are provided accurately,the meat is cooked well done following my instruction!",
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PersonRatingCard(),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonRatingCard extends StatefulWidget {
  const PersonRatingCard({super.key});

  @override
  State<PersonRatingCard> createState() => _PersonRatingCardState();
}

class _PersonRatingCardState extends State<PersonRatingCard> {
  @override
  double _rating = 5.0;

  Widget build(BuildContext context) {
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
                child: Text("F"),
              ),
              title: Text(
                "Fatin",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("22 days ago"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  StarRating(
                    rating: _rating,
                    allowHalfRating: false,
                    onRatingChanged: (rating) =>
                        setState(() => _rating = rating),
                    color: Colors.amber,
                  ),
                  Text(". 5 stars", style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Overall taste is excellent,meal is fresh ,sides are provided accurately,the meat is cooked well done following my instruction!",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topLeft: Radius.circular(12),
                        ),
                        child: Image.asset(
                          "assets/image/picture.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 1),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ClipRRect(
                        child: Image.asset(
                          "assets/image/picture.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 1),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          "assets/image/picture.jpg",
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
  }
}

class RatingDetail extends StatelessWidget {
  String? title;
  Color? colors;

  RatingDetail(this.title, this.colors);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
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
      ),
    );
  }
}
