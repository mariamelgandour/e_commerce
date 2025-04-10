import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Overview'),
        centerTitle: true,
      ),
      body: SingleChildScrollView( // ✅ لفينا كل حاجة علشان نتفادى الـ Overflow
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Payment Methods
            _buildPaymentMethod('Amazon Pay', 'images/i.png'),
            _buildPaymentMethod('Google Pay', 'images/iiii.png'),
            _buildPaymentMethod('PayPal', 'images/icon4.png'),
            _buildPaymentMethod('Credit Card', 'images/ii.jpg'),

            const Divider(height: 40),

            // Payment Summary
            _buildPaymentRow('Sub-Total', '\$1300.00'),
            _buildPaymentRow('Shipping Fee', '\$15.00'),
            _buildPaymentRow('Total Payment', '\$1315.00', isTotal: true),

            const SizedBox(height: 30),

            // Confirm Payment Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // handle confirm here
                },
                child: const Text(
                  'Confirm Payment',
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
  }

  // Payment Method Widget
  Widget _buildPaymentMethod(String method, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: ✅ icon and method name
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                method,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Right side: payment image
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Summary row widget
  Widget _buildPaymentRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
