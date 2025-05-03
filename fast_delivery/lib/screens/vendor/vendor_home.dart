// lib/screens/roles/vendor_home.dart
import 'package:flutter/material.dart';

class VendorHome extends StatelessWidget {
  const VendorHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vendor Home")),
      body: const Center(child: Text("Welcome, Vendor!")),
    );
  }
}
