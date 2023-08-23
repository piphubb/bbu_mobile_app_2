import 'package:bbu_mobile_app/models/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    List<Product> productList = [];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: (){

        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("product".tr(),style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        
        child: ListView.builder(
          itemCount: 10,
            itemBuilder: (BuildContext context, index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.03)
            ),
            child: ListTile(
              title: Text("Product ${index}"),
              subtitle: Text("price : 12.00 / cost 14.00"),
              trailing: IconButton(
                onPressed: (){},
                icon: Icon(Icons.more_horiz),
              )
            ),
          );
        }),
      ),
    );
  }
}
