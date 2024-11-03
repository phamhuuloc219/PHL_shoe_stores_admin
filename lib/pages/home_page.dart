import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_stores/pages/add_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Footware Admin'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
              subtitle: Text('Price : \$100'),
              trailing: IconButton(
                  onPressed: () {
                    print('Delete');
                  },
                  icon: Icon(Icons.delete)),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(AddProductPage());
          },
        ));
  }
}
