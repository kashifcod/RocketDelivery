
import 'package:flutter/material.dart';
import '/widgets/custom_bottom_nav_bar.dart';

class CategoryItemsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryItemsScreen({super.key, required this.categoryName});

  void _onTabTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.popUntil(context, (route) => route.isFirst); // Go back to home
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Tab $index clicked")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, String>>> categoryItems = {
      "Fruits": [
        {"name": "Red Apple", "price": "4.99"},
        {"name": "Original Banana", "price": "5.99"},
        {"name": "Avocado Bowl", "price": "3.99"},
        {"name": "Mango", "price": "6.50"},
      ],
      "Vegetables": [
        {"name": "Carrot", "price": "1.00"},
        {"name": "Tomato", "price": "1.20"},
      ],
      "Meat": [
        {"name": "Chicken", "price": "5.00"},
        {"name": "Beef", "price": "6.50"},
      ],
      "Juice": [
        {"name": "Mango Juice", "price": "2.50"},
        {"name": "Apple Juice", "price": "2.30"},
      ],
    };

    final items = categoryItems[categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1, // This screen is also under Explore
        onTap: (index) => _onTabTapped(context, index),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search $categoryName...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? Center(child: Text("No items available for $categoryName"))
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/images/fruit.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(item['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const Text("1kg"),
                            Text("\$${item['price']}", style: const TextStyle(color: Colors.orange, fontSize: 16)),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Icon(Icons.add, color: Colors.white),
                              ),
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
