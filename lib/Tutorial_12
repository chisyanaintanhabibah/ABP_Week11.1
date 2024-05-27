import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  Future<Map<String, dynamic>> fetchData() async {
    var response = await http.get(Uri.parse("http://192.168.1.3:80/api/products"));
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData;
    } else {
      var responseData = jsonDecode(response.body);
      Get.snackbar("Error", responseData.toString());
      throw Exception("Failed to get data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            var data = snapshot.data as Map<String, dynamic>;
            var products = data["data"] as List<dynamic>;

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                var image = product["gambar"];
                Uint8List imageBytes = base64Decode(image);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.memory(imageBytes, height: 200, width: 200),
                    SizedBox(height: 8),
                    Text(
                      product["nama_barang"] ?? "No Name",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product["deskripsi"] ?? "No Description",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 16),
                  ],
                );
              },
            );
          } else {
            return Center(child: Text("Failed to load data"));
          }
        },
      ),
    );
  }
}
