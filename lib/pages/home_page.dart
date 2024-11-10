import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
              title: Text(
                'Footwear Admin',
                style: TextStyle(fontSize: 40),
              ),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: ListView.builder(
              itemCount: ctrl.products.length,
              itemBuilder: (context, index) {
                return Slidable(
                  endActionPane: ActionPane(
                    extentRatio: 0.6,
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: "Cập nhật",
                      ),
                      SlidableAction(
                        onPressed: (context) {
                          ctrl.deleteProduct(ctrl.products[index].id ?? "");
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: "Xóa",
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(ctrl.products[index].name ?? ""),
                    subtitle:
                        Text((ctrl.products[index].price ?? 0).toString()),
                  ),
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
