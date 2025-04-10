import 'package:e_commerce/dummy_pages.dart';
import 'package:e_commerce/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _rating = 0;
  String _selectedSize = 'S';
  String _selectedColor = 'Yellow';
  double _totalPrice = 0;

  // Update total price based on selection
  void _updateTotalPrice() {
    double price = double.parse(widget.product.price.replaceAll(RegExp(r'[^0-9.]'), ''));
    setState(() {
      _totalPrice = price;
    });
  }

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // To make the sheet size adjustable
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Size options
                const Text(
                  'Select Size:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: ['S', 'M', 'L', 'XL'].map((size) {
                    return Row(
                      children: [
                        Radio<String>(
                          value: size,
                          groupValue: _selectedSize,
                          activeColor: Colors.red, // Change active radio color
                          onChanged: (String? value) {
                            setState(() {
                              _selectedSize = value!;
                              _updateTotalPrice(); // Update price on size selection
                            });
                          },
                        ),
                        Text(
                          size,
                          style: TextStyle(
                            fontWeight: _selectedSize == size ? FontWeight.bold : FontWeight.normal,
                            color: _selectedSize == size ? Colors.red : Colors.black, // Change text color when selected
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Color options
                const Text(
                  'Select Color:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: ['Yellow', 'Green', 'Red'].map((color) {
                    return Row(
                      children: [
                        Radio<String>(
                          value: color,
                          groupValue: _selectedColor,
                          activeColor: Colors.red, // Change active radio color
                          onChanged: (String? value) {
                            setState(() {
                              _selectedColor = value!;
                              _updateTotalPrice(); // Update price on color selection
                            });
                          },
                        ),
                        Text(
                          color,
                          style: TextStyle(
                            fontWeight: _selectedColor == color ? FontWeight.bold : FontWeight.normal,
                            color: _selectedColor == color ? Colors.red : Colors.black, // Change text color when selected
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),

                // Display total price
                Text(
                  'Total: \$$_totalPrice',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Checkout Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Same color as Buy Now button
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>CartPage()),
        );
        },

                    child: const Text(
                      'Check Out',
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
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Overview'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      widget.product.images.first,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Center(child: Icon(Icons.image, size: 50)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Product Title and Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.product.price,
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Description
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.product.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),

              // Rating (Star Rating)
              const Text(
                'Rate this Product:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 40,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              const SizedBox(height: 30),

              // Row with "Buy Now" Button and Cart Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.deepOrange),
                    onPressed: () {
                      // Navigate to cart page or handle cart action
                    },
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _openBottomSheet, // Open bottom sheet on press
                      child: const Text(
                        'Buy Now',
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
            ],
          ),
        ),
      ),
    );
  }
}
