import 'package:flutter/material.dart';

class FoodItem {
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  FoodItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class FoodMenuScreen extends StatelessWidget {
  FoodMenuScreen({super.key});

  final List<FoodItem> foods = [
    FoodItem(
      title: "Laksa Johor",
      description: "A specialty of the Malaysian Island of Penang.",
      imageUrl:
      "assets/image/picture.jpg",
      price: 17.00,
    ),
    FoodItem(
      title: "Laksa Johor",
      description: "A specialty of the Malaysian Island of Penang.",
      imageUrl:
      "assets/image/picture.jpg",
      price: 17.00,
    ),
    FoodItem(
      title: "Laksa Johor",
      description: "A specialty of the Malaysian Island of Penang.",
      imageUrl:
      "assets/image/picture.jpg",
      price: 17.00,
    ),
    FoodItem(
      title: "Laksa Johor",
      description: "A specialty of the Malaysian Island of Penang.",
      imageUrl:
      "assets/image/picture.jpg",
      price: 17.00,
    ),
    FoodItem(
      title: "Laksa Johor",
      description: "A specialty of the Malaysian Island of Penang.",
      imageUrl:
      "assets/image/picture.jpg",
      price: 17.00,
    ),
    FoodItem(
      title: "Laksa Johor",
      description: "A specialty of the Malaysian Island of Penang.",
      imageUrl:
      "assets/image/picture.jpg",
      price: 17.00,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food Menu")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(

          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 270,
            maxCrossAxisExtent: 260,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),

          itemCount: foods.length,
          itemBuilder: (context, index) {
            return FoodCard(food: foods[index]);
          },
        ),
      ),
    );
  }
}
class FoodCard extends StatelessWidget {
  final FoodItem food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                food.imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(
                    food.description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(
                        "RM ${food.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                      Spacer(),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add_box_sharp,color: Colors.amber,))
                    ],
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}