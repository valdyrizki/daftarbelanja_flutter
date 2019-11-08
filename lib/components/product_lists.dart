import 'package:flutter/material.dart';
import '../models/cart.dart'; //IMPORT MODEL CART.DART

class ProductList extends StatelessWidget {
  final List<Cart> carts;

  ProductList(this.carts);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 400.0,
      //Jika kosong
      child: carts.isEmpty ? Column(children: <Widget>[
        Text("No Transaction Data",style: Theme.of(context).textTheme.title,)
      ],
      //Jika Ada
      ) : ListView.builder(
        itemBuilder: (context, index){ //Looping berdasarkan jumlah data
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2)
                  ),
                  child: Text(
                    carts[index].qty.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(carts[index].title, style: Theme.of(context).textTheme.title,),
                    Text('Harga: Rp' + carts[index].harga.toStringAsFixed(0), style: TextStyle(fontSize: 12, color: Colors.grey),),
                  ],
                )
              ],
            ),
          );
        },
         itemCount: carts.length, //JUMLAH ITEMNYA BERDASARKAN JUMLAH DATA YANG ADA DI DALAM CARTS

      )

    );
  }
}