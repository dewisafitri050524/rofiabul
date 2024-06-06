import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';
import 'package:myapp/loginPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisPage extends StatelessWidget {
  RegisPage({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final password1Controller = TextEditingController();
  final password2Controller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  Future<void> _registerUser(String name, String email, String password) async {
    final url = Uri.parse(
        'https://example.com/api/register'); // Ganti dengan URL API Anda
    final headers = {"Content-Type": "application/json"};
    final body =
        jsonEncode({'name': name, 'email': email, 'password': password});

    final response = await http.post(url, headers: headers, body: body);

    // if (response.statusCode == 201) {

    //   final responseData = jsonDecode(response.body);
    //   print('Registration successful: $responseData');

    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => Loginpage()));
    // } else {

    //   print('Registration failed. Status code: ${response.statusCode}');

    //   final errorData = jsonDecode(response.body);
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Error: ${errorData['message']}')),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.centerRight, child: Text('Registrasi')),
          leading: Icon(Icons.home),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset("assets/images/gambar-logo.png"),
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          labelText: 'username', border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'email', border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  TextFormField(
                      controller: password1Controller,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'password', border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  TextFormField(
                      obscureText: true,
                      controller: password2Controller,
                      decoration: InputDecoration(
                          labelText: 'ulangi password',
                          border: OutlineInputBorder())),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()));
                          },
                          child: Text('Kembali')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginpage()));
                          },
                          child: Text('Simpan')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
