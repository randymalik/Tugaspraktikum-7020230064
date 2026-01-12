import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart", style: TextStyle(color: const Color.fromARGB(255, 245, 245, 245))),
        backgroundColor: const Color.fromARGB(255, 1, 1, 1),
          
        elevation: 0.5,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Expanded digunakan agar daftar barang bisa digulirkan secara mandiri
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Contoh jumlah item
              padding: EdgeInsets.all(15),
              itemBuilder: (context, index) {
                return _buildCartItem();
              },
            ),
          ),
          _buildCheckoutSection(),
        ],
      ),
    );
  }

  Widget _buildCartItem() {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2, 
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.image, color: Colors.grey),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text("Rp999.999.999", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: () {}),
            Text("1"),
            IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Payment", style: TextStyle(fontSize: 16)),
              Text(
                "Rp2.999.999.999",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Checkout Sekarang", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}