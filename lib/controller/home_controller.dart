import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_stores/model/product.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImageCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'un brand';
  bool offer = false;

  List<Product> products = [];

  @override
  void onInit() async {
    productCollection = firestore.collection('products');
    await fetchProduct();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
        id: doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImageCtrl.text,
        offer: offer,
      );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar("Success", 'Product added successfully!',
          colorText: Colors.green);

      setValuesDefault();
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar("Success", "Products fetched successfully",
          colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar("Error", e.toString(), colorText: Colors.red);
      print(e);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProduct();
      Get.snackbar("Success", "Products deleted successfully",
          colorText: Colors.green);
    } on Exception catch (e) {
      Get.snackbar("Success", e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  setValuesDefault() {
    productNameCtrl.clear();
    productDescriptionCtrl.clear();
    productImageCtrl.clear();
    productPriceCtrl.clear();

    category = 'general';
    brand = 'un brand';
    offer = false;
    update();
  }
}
