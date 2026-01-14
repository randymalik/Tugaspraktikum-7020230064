import 'dart:math';

class Product {
  final String id;
  final String name;
  final String price;
  final String image;
  final String description;

  Product({
    required this.id,
    required this.name, 
    required this.price, 
    required this.image,
    required this.description,
  });

  
  factory Product.create({
    required String name,
    required String price,
    required String image,
    required String description,
  }) {
    return Product(
      id: _generateId(),
      name: name,
      price: price,
      image: image,
      description: description,
    );
  }

  Product copyWith({
    String? id,
    String? name,
    String? price,
    String? image,
    String? description,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, image: $image, description: $description)';
  }

  static String _generateId() {
    return Random().nextInt(999999).toString();
  }
}

class ProductManager {
  List<Product> _products = [];

  List<Product> get products => List.unmodifiable(_products);

  void addProduct(Product product) {
    _products.add(product);
  }

  bool removeProduct(String id) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products.removeAt(index);
      return true;
    }
    return false;
  }

  bool updateProduct(String id, Product updatedProduct) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index] = updatedProduct;
      return true;
    }
    return false;
  }

  Product? getProductById(String id) {
    final matches = _products.where((p) => p.id == id);
    return matches.isNotEmpty ? matches.first : null;
  }

  void loadDummyProducts() {
    _products = [
      Product.create(
        name: "MacBook Pro M7", 
        price: "Rp 90.000.000", 
        image: "",
        description: "Laptop bertenaga dengan chip M7 terbaru dari Apple, sangat cocok untuk profesional kreatif dan developer.",
      ),
      Product.create(
        name: "Xiaomi 15T Pro plus 5G", 
        price: "Rp 29.000.000", 
        image: "",
        description: "Smartphone flagship dengan Chipset Snapdragon 8 Gen 9.",
      ),
      Product.create(
        name: "Mouse Logitech MX Master 3", 
        price: "Rp 1.000.000", 
        image: "",
        description: "Mouse nirkabel canggih dengan desain ergonomis dan fitur canggih.",
      ),
      Product.create(
        name: "Xiaomi Buds 4 Pro", 
        price: "Rp 3.000.000", 
        image: "",
        description: "Earphone nirkabel dengan fitur noise cancellation dan kualitas suara tinggi.",
      ),
    ];
  }
}

void main() {
  final productManager = ProductManager();
  productManager.loadDummyProducts();

  final newProduct = Product.create(
    name: "iPad Air",
    price: "Rp 10.000.000",
    image: "",
    description: "Tablet ringan dan powerful untuk produktivitas sehari-hari.",
  );
  productManager.addProduct(newProduct);

  for (var product in productManager.products) {
    print(product);
  }

  final productToUpdate = productManager.getProductById(newProduct.id);
  if (productToUpdate != null) {
    productManager.updateProduct(
      newProduct.id,
      productToUpdate.copyWith(price: "Rp 11.000.000"),
    );
  }

  productManager.removeProduct(newProduct.id);

  print("Setelah update dan hapus:");
  for (var product in productManager.products) {
    print(product);
  }

}
