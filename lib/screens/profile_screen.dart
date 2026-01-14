import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40),
            width: double.infinity,
            color: const Color.fromARGB(255, 0, 0, 0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person_pin, size: 50, color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 15),
                Text(
                  "Username",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  "user@email.com",
                  style: TextStyle(color: const Color.fromARGB(179, 255, 255, 255)),
                ),
              ],
            ),
          ),
          // Bagian Menu 
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(context, Icons.shopping_bag, "Pesanan Saya"),
                _buildMenuItem(context, Icons.favorite, "Favorites"),
                _buildMenuItem(context, Icons.settings, "Pengaturan"),
                const Divider(),
                _buildMenuItem(context, Icons.help_outline, "Bantuan & Dukungan"),
                _buildMenuItem(context, Icons.logout, "Keluar", color: Colors.red, isLogout: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, {Color color = Colors.black87, bool isLogout = false}) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: isLogout
          ? () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => register_page()),
              );
            }
          : () {
            },
    );
  }
}

class register_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("register_page.dart")),
      body: Center(child: Text("Register Screen")),
    );
  }

}
