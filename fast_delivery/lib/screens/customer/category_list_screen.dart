import 'package:flutter/material.dart';
import '../../widgets/custom_bottom_nav_bar.dart';
import 'category_items_screen.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  void _onTabTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pop(context); // Go back to home
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Tab $index clicked")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"name": "Fruits", "icon": Icons.local_grocery_store},
      {"name": "Vegetables", "icon": Icons.emoji_nature},
      {"name": "Meat", "icon": Icons.set_meal},
      {"name": "Juice", "icon": Icons.local_drink},
      {"name": "Snacks", "icon": Icons.fastfood},
      {"name": "Drinks", "icon": Icons.local_cafe},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Categories")),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, // "Explore" tab
        onTap: (index) => _onTabTapped(context, index),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CategoryItemsScreen(categoryName: category['name']),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange.shade100,
                        child: Icon(category['icon'],
                            size: 30, color: Colors.deepOrange),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        category['name'],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
