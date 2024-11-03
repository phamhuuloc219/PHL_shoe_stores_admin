import 'package:flutter/material.dart';
import 'package:phl_shoe_stores/widgets/drop_down_btn.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    items: ["Cate1", "Cate2", "Cate3"],
                    selectedItemText: "Category 1",
                    onSelected: (selectedValue) {},
                  )),
                  Flexible(
                      child: DropDownBtn(
                    items: ["Brand1", "Brand2", "Brand3"],
                    selectedItemText: "Brand 1",
                    onSelected: (selectedValue) {},
                  )),
                ],
              ),
              Text("Offer Product ?"),
              DropDownBtn(
                items: ["True", "False"],
                selectedItemText: "Offer ?",
                onSelected: (selectedValue) {},
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
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
  }
}
