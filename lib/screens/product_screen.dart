import 'package:bbu_mobile_app/models/product.dart';
import 'package:bbu_mobile_app/screens/product_form_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> productList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProductFormScreen(product: Product(),)))
              .then((value) {
            if (value != null) {
              print("${value.name}");
              setState(() {
                value.id = productList.length + 1;
                productList.add(value);
              });
            }
          });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "product".tr(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (BuildContext context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.black.withOpacity(.03)),
                child: ListTile(
                  onTap: (){

                  },
                    title: Text("Product : ${productList[index].name}"),
                    subtitle: Text("price : ${productList[index].price} / cost : ${productList[index].cost}"),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ProductFormScreen(product: productList[index],)))
                            .then((value) {
                          if (value != null) {
                            print("${value.name}");
                            setState(() {
                              // value.id = productList.length + 1;
                              // productList.add(value);
                            });
                          }
                        });
                      },
                      icon: Icon(Icons.more_horiz),
                    )),
              );
            }),
      ),
    );
  }
}
