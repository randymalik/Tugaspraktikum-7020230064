import 'package:flutter/material.dart';
import 'package:praktikumuiux_7020230064/models/product_model.dart';
import 'package:praktikumuiux_7020230064/screens/CartScreen.dart';
import 'package:praktikumuiux_7020230064/screens/profile_screen.dart';
import 'package:praktikumuiux_7020230064/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final ProductManager _productManager = ProductManager();
  String _searchQuery = '';
  List<Product> _filteredProducts = []; 

  final List<Widget> _pages = [

  ];

  @override
  void initState() {
    super.initState();
    _productManager.loadDummyProducts();
    _filteredProducts = _productManager.products; 
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateFilteredProducts(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredProducts = _productManager.products;
      } else {
        _filteredProducts = _productManager.products
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()) ||
                product.description.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _addNewProduct() {
    final newProduct = Product.create(
      name: "New Product",
      price: "Rp 5.000.000",
      image: "",
      description: "Deskripsi produk baru.",
    );
    setState(() {
      _productManager.addProduct(newProduct);
      _updateFilteredProducts(_searchQuery);
    });
  }

  @override
  Widget build(BuildContext context) {
    _pages.clear();
    _pages.addAll([
      HomeBody(
        productManager: _productManager,
        filteredProducts: _filteredProducts,
        onSearch: _updateFilteredProducts,
        onAddProduct: _addNewProduct,
      ),
      CartScreen(),
      ProfileScreen(),
    ]);

    return Scaffold(
      appBar: _selectedIndex == 0 
        ? AppBar(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            title: Container(
              height: 45,
              child: TextField(
                onChanged: _updateFilteredProducts,
                decoration: InputDecoration(
                  hintText: "search your product",
                  prefixIcon: const Icon(Icons.search, color: Color.fromARGB(255, 0, 0, 0)),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _addNewProduct,
              ),
            ],
          ) 
        : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Product'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  final ProductManager productManager;
  final List<Product> filteredProducts;
  final Function(String) onSearch;
  final VoidCallback onAddProduct;

  const HomeBody({
    required this.productManager,
    required this.filteredProducts,
    required this.onSearch,
    required this.onAddProduct,
  });

  @override
  Widget build(BuildContext context) {
    return ProductGridScreen(
      filteredProducts: filteredProducts,
      onAddProduct: onAddProduct,
    );
  }
}

class ProductGridScreen extends StatelessWidget {
  final List<Product> filteredProducts;
  final VoidCallback onAddProduct;

  const ProductGridScreen({
    required this.filteredProducts,
    required this.onAddProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: onAddProduct,
                child: const Text("Add Product"),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Expanded(
            child: filteredProducts.isEmpty
              ? const Center(child: Text("No products found"))
              : GridView.builder(
                  itemCount: filteredProducts.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(product: filteredProducts[index]);
                  },
                ),
          ),
        ],
      ),
    );
  }
}