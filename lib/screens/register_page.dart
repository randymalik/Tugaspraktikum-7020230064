import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Akun")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nama Lengkap"),
                validator: (value) => value!.isEmpty ? "Nama tidak boleh kosong" : null,
              ),
              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) => !value!.contains('@') ? "Email salah" : null,
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                validator: (value) => value!.length < 6 ? "Pass minimal 6 karakter" : null,
              ),
              SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Konfirmasi Password"),
                validator: (value) {
                  if (value != _passController.text) {
                    return "Password tidak cocok";
                  }
                  return null;
                },
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Pendaftaran Berhasil")),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text("Daftar sekarang"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}