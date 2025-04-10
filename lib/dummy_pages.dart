import 'package:e_commerce/Pay.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildCartItem('Jacket', 'Hooded Jacket', 1, 100, 'images/image1.jpg'),
                _buildCartItem('Child Jacket', 'Hooded Jacket', 1, 600, 'images/image2.jpg'),
                _buildCartItem('Hooded', 'Hooded Jacket', 1, 700, 'images/image3.jpg'),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
                    const Text('Select All'),
                  ],
                ),
                const Divider(height: 30, thickness: 1),
              ],
            ),
          ),
          // Total and Checkout Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Payment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$300.00',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[700],
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>PaymentPage()),
                );
              },
              child: const Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,


                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build cart item with an image
  Widget _buildCartItem(String title, String subtitle, int quantity, double price, String imagePath) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Displaying the actual image from assets
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath), // Load image from assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Qty: $quantity'),
                    Text('\$$price', style: const TextStyle(color: Colors.red)),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              // Implement delete functionality here
            },
          ),
        ],
      ),
    );
  }
}

class QrCodePage extends StatelessWidget {
  const QrCodePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Code")),
      body: const Center(child: Text("QR Code Page")),
    );
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: const Center(child: Text("Favorite Page")),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: const Center(child: Text("Profile Page")),
    );
  }
}
