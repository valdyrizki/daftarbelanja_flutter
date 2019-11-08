import 'package:flutter/material.dart';
import '../models/cart.dart';

class Dashboard extends StatelessWidget{
  final List<Cart> _listCart;

  Dashboard(this._listCart);

  //Get total item
  int get totalItem{
    return _listCart.fold(0,(sum,item){
      return sum += item.qty;
    });
  }

  //Get total harga 
  double get totalPrice {
    return _listCart.fold(0, (sum,item){
      return sum += item.harga;
    });
  }

    @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, //TINGKAT KETEBALAN SHADOW DARI CARD
      margin: EdgeInsets.all(10),    
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, //AGAR KEDUA ELEMEN DIDALAMNYA DI SET SEHINGGA MEMILIKI JARAK ANTAR KEDUANYA DAN MEMENUHI CARD
          children: <Widget>[
            Column(children: <Widget>[
              //MENAMPILKAN TOTAL ITEM
              Text("Total Item", style: Theme.of(context).textTheme.title,),
              SizedBox(height: 4,),
              Text(totalItem.toString() + " pcs", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ],),
            
            Column(children: <Widget>[
             	//MENAMPILKAN TOTAL BELANJA
              Text("Total Belanja", style: Theme.of(context).textTheme.title,),
              SizedBox(height: 4,),
              Text(totalPrice.toStringAsFixed(0), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
            ],)
          ],
        ),
      ),
    );
  }

}