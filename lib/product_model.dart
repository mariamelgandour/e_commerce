class Product {
  final String id;
  final String name;
  final String price;
  final int rating;  // أضف هذا الحقل
  final String description;
  final List<String> images;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,  // أضفه هنا
    required this.description,
    required this.images,
  });
}