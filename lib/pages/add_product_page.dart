import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phl_shoe_stores/controller/home_controller.dart';
import 'package:phl_shoe_stores/widgets/drop_down_btn.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Add Product',
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Add New Product",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    label: Text('Product Name'),
                    hintText: "Enter Your Product Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                    label: Text('Product Description'),
                    hintText: "Enter Your Product Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ctrl.productImageCtrl,
                  decoration: InputDecoration(
                    label: Text('Image URL'),
                    hintText: "Enter Your Image URL",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    label: Text('Product Price'),
                    hintText: "Enter Your Product Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Flexible(
                        child: DropDownBtn(
                      items: const [
                        "Boots",
                        "Shoe",
                        "Beach Shoe",
                        "High heels",
                        "Slippers",
                        "Sandal"
                      ],
                      selectedItemText: ctrl.category,
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? "general";
                        ctrl.update();
                      },
                    )),
                    Flexible(
                        child: DropDownBtn(
                      items: const [
                        "Nike",
                        "Adidas",
                        "Biti's",
                        "Balenciaga",
                        "Jordan"
                      ],
                      selectedItemText: ctrl.brand,
                      onSelected: (selectedValue) {
                        ctrl.brand = selectedValue ?? "un brand";
                        ctrl.update();
                      },
                    )),
                  ],
                ),
                Text("Offer Product ?"),
                DropDownBtn(
                  items: ["true", "false"],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer =
                        bool.tryParse(selectedValue ?? "false") ?? false;
                    ctrl.update();
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    ctrl.addProduct();
                  },
                  child: Text("Add Product"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
