class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'imagePath': imagePath,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imagePath: json['imagePath'],
    );
  }
}
