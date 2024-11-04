import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_stores/controller/home_controller.dart';
import 'package:phl_shoe_stores/pages/add_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Footware Admin'),
            ),
            body: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item '),
                  subtitle: Text('Price : \$100'),
                  trailing:
                      IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Get.to(AddProductPage());
              },
            ));
      },
    );
  }
}
