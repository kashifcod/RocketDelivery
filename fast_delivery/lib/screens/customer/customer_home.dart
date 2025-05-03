// import 'package:flutter/material.dart';
// import 'category_list_screen.dart';
// import 'category_items_screen.dart';

// class CustomerHome extends StatelessWidget {
//   const CustomerHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: BottomNavigationBar(
//         selectedItemColor: Colors.orange,
//         unselectedItemColor: Colors.grey,
//         currentIndex: 0,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
//           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Location
//               GestureDetector(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       title: const Text("Change Location"),
//                       content: const TextField(decoration: InputDecoration(hintText: "Enter new location")),
//                       actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
//                     ),
//                   );
//                 },
//                 child: Row(
//                   children: const [
//                     Icon(Icons.location_on, color: Colors.orange),
//                     SizedBox(width: 6),
//                     Text("Bahria Town Karachi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Search bar
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//                   filled: true,
//                   fillColor: Colors.grey.shade200,
//                 ),
//               ),

//               const SizedBox(height: 24),
//               _buildSectionHeader(context, "Categories", () {
//                 Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryListScreen()));
//               }),
//               const SizedBox(height: 12),
//               _buildCategories(context),

//               const SizedBox(height: 24),
//               _buildSectionHeader(context, "Popular Deals", () {}),
//               const SizedBox(height: 12),
//               _buildPopularDeals(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionHeader(BuildContext context, String title, VoidCallback onTap) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         GestureDetector(
//           onTap: onTap,
//           child: const Text("See All", style: TextStyle(color: Colors.orange)),
//         ),
//       ],
//     );
//   }

//   Widget _buildCategories(BuildContext context) {
//     final List<Map<String, dynamic>> categories = [
//       {"label": "Fruits", "icon": Icons.apple, "items": ["Apple", "Banana", "Orange"]},
//       {"label": "Vegetables", "icon": Icons.eco, "items": ["Carrot", "Spinach", "Tomato"]},
//       {"label": "Meat", "icon": Icons.set_meal, "items": ["Chicken", "Beef", "Fish"]},
//       {"label": "Juice", "icon": Icons.local_drink, "items": ["Orange Juice", "Mango Juice"]},
//     ];

//     return SizedBox(
//       height: 90,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) {
//           final item = categories[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (_) => CategoryItemsScreen(categoryName: item['label']),
//                 ),
//               );
//             },
//             child: Container(
//               width: 80,
//               margin: const EdgeInsets.only(right: 12),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 28,
//                     backgroundColor: Colors.orange.shade100,
//                     child: Icon(item['icon'], color: Colors.orange),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(item['label'], style: const TextStyle(fontSize: 12)),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildPopularDeals() {
//     final List<Map<String, dynamic>> deals = [
//       {"name": "Red Apple", "price": "4.99", "image": "https://via.placeholder.com/100"},
//       {"name": "Organic Banana", "price": "3.99", "image": "https://via.placeholder.com/100"},
//       {"name": "Fresh Orange Juice", "price": "2.49", "image": "https://via.placeholder.com/100"},
//     ];

//     return SizedBox(
//       height: 180,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: deals.length,
//         itemBuilder: (context, index) {
//           final item = deals[index];
//           return Container(
//             width: 140,
//             margin: const EdgeInsets.only(right: 12),
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300, offset: const Offset(0, 3))],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.network(item['image'], height: 60),
//                 const SizedBox(height: 8),
//                 Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 4),
//                 const Text("1kg, price", style: TextStyle(fontSize: 12, color: Colors.grey)),
//                 const SizedBox(height: 4),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("\$${item['price']}", style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
//                     const Icon(Icons.add_circle, color: Colors.green),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '/widgets/custom_bottom_nav_bar.dart';
import 'category_list_screen.dart';
import 'category_items_screen.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({super.key});

  void _onTabTapped(BuildContext context, int index) {
    if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryListScreen()));
    } else {
      // Show snackbar for tabs without screen
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Tab $index clicked")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (index) => _onTabTapped(context, index),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Change Location"),
                      content: const TextField(decoration: InputDecoration(hintText: "Enter new location")),
                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.location_on, color: Colors.orange),
                    SizedBox(width: 6),
                    Text("Bahria Town Karachi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),

              const SizedBox(height: 24),
              _buildSectionHeader(context, "Categories", () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryListScreen()));
              }),
              const SizedBox(height: 12),
              _buildCategories(context),

              const SizedBox(height: 24),
              _buildSectionHeader(context, "Popular Deals", () {}),
              const SizedBox(height: 12),
              _buildPopularDeals(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onTap,
          child: const Text("See All", style: TextStyle(color: Colors.orange)),
        ),
      ],
    );
  }

  Widget _buildCategories(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {"label": "Fruits", "icon": Icons.apple},
      {"label": "Vegetables", "icon": Icons.eco},
      {"label": "Meat", "icon": Icons.set_meal},
      {"label": "Juice", "icon": Icons.local_drink},
    ];

    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryItemsScreen(categoryName: item['label']),
                ),
              );
            },
            child: Container(
              width: 80,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.orange.shade100,
                    child: Icon(item['icon'], color: Colors.orange),
                  ),
                  const SizedBox(height: 6),
                  Text(item['label'], style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularDeals() {
    final List<Map<String, dynamic>> deals = [
      {"name": "Red Apple", "price": "4.99", "image": "https://via.placeholder.com/100"},
      {"name": "Organic Banana", "price": "3.99", "image": "https://via.placeholder.com/100"},
      {"name": "Fresh Orange Juice", "price": "2.49", "image": "https://via.placeholder.com/100"},
    ];

    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: deals.length,
        itemBuilder: (context, index) {
          final item = deals[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300, offset: const Offset(0, 3))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(item['image'], height: 60),
                const SizedBox(height: 8),
                Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text("1kg, price", style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${item['price']}", style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    const Icon(Icons.add_circle, color: Colors.green),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
