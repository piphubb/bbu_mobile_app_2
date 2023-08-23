import 'package:bbu_mobile_app/models/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductFormScreen extends StatefulWidget {
  Product product;
  ProductFormScreen({super.key, required this.product});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _costController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.product.name != null){
      _nameController.text = widget.product.name ?? "";
      _priceController.text = widget.product.price.toString();
      _costController.text = widget.product.cost.toString();

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.indigo,
        title: Text(
          "create_product".tr(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(label: Text("Product Name")),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _priceController,
                decoration: InputDecoration(label: Text("Price")),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _costController,
                decoration: InputDecoration(label: Text("Cost")),
              ),
            ),
            InkWell(
              onTap: () {
                if(_nameController.text != ""){
                  Product product = Product();
                  product.id= 0;
                  product.name = _nameController.text;
                  product.price = double.parse(_priceController.text);
                  product.cost = double.parse(_costController.text);
                  Navigator.pop(context, product);
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text(
                    "Create",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
