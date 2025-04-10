import 'package:flutter/material.dart';
import 'product_detail_page.dart';
import 'product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(
              product: product,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'product-${product.id}',
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: 160,
                      width: 140,
                      color: Colors.grey[200],
                      child: product.images.isNotEmpty
                          ? Image.network(
                        product.images.first,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.error),
                      )
                          : const Icon(Icons.image),
                    ),
                  ),
                  const Positioned(
                    right: 8,
                    top: 8,
                    child: Icon(Icons.favorite_border, color: Colors.red),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text(
                  "(${product.rating})",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            Text(
              product.price,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}