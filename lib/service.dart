import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class Services extends ChangeNotifier {
  bool isLoading = true;
  List<Product> listOfProduct = [];


  Future<void> getProduct() async {
    try {
      isLoading = true;
      notifyListeners();

      final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        listOfProduct = List<Product>.from(
            data.map((product) => Product.fromJson(product)));

        isLoading = false; // Data fetched
        notifyListeners();
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      isLoading = false;
      print("Error: $e");
      notifyListeners();
    }
  }
}
