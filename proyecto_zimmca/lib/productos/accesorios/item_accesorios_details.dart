import 'package:flutter/material.dart';
import 'package:proyecto_zimmca/cart/cart.dart';
import 'package:proyecto_zimmca/models/product_drinks.dart';
import 'package:proyecto_zimmca/models/product_cart.dart';
import 'package:proyecto_zimmca/user/profile.dart';
import 'package:proyecto_zimmca/utils/colors.dart';
import 'package:proyecto_zimmca/models/listOfProducts.dart';
import 'package:proyecto_zimmca/payment.dart';
import 'package:proyecto_zimmca/models/product_repository.dart';


class DrinkDetailPage extends StatefulWidget {
  ProductDrinks drink;
  ProductList productoNuevo;

  DrinkDetailPage({
    Key key,
    @required this.drink,
    @required this.productoNuevo,
  }) : super(key: key);

  @override
  _DetailDrinkState createState() => _DetailDrinkState();
}

class _DetailDrinkState extends State<DrinkDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.drink.productTitle}", style: TextStyle(color: coffeBlanco),),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: _backUpAndCart,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: _openCartPageOnly,
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => Profile()),
              );
            },
          ),
        ],
      ),
      body: Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  color: coffeNaranjaLigero62,
                  width: 270,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    child: Image.network(
                      "${widget.drink.productImage}",
                      fit: BoxFit.scaleDown,
                      height: 180,
                    ),
                  ),
                ),
                Container(
                  color: coffeNaranjaLigero62,
                  height: 200,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: widget.drink.liked ? Colors.red : coffeAzulGrisaceoOscuro,
                    ),
                  onPressed: _productLiked,
                  ),
                ),
              ],
            ),
          ),
          
          Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "${widget.drink.productTitle}",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 270,
                  child: Text(
                  "${widget.drink.productDescription}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15.0),
                  ),
                ),   
              ],
            ),
          ),

          Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 135,
                  child: Text(
                  "COLORES DISPONIBLES",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 10.0),
                  ),
                ),  
                Container(
                  width: 140,
                  child: Text(
                  "¨PRECIO",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 10.0),
                  ),
                ),    
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 46.0),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 74,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: coffeAzulOscuro)
                  ),
                  child: MaterialButton(
                    child: Text(
                        "Chico",
                        style: TextStyle(fontSize: 10.0, color: coffeAzulGrisaceoOscuro),
                        textAlign: TextAlign.center,
                        ),
                  onPressed: _chButton,
                  ),
                ),  
                Container(
                  width: 74,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: coffeAzulOscuro)
                  ),
                  child: MaterialButton(
                    child: Text(
                        "Mediano",
                        style: TextStyle(fontSize: 10.0, color: coffeAzulGrisaceoOscuro),
                        textAlign: TextAlign.center,
                        ),
                  onPressed: _mButton,
                  ),
                ),  
                Container(
                  width: 74,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1, color: coffeAzulOscuro)
                  ),
                  child: MaterialButton(
                    child: Text(
                        "Grande",
                        style: TextStyle(fontSize: 10.0, color: coffeAzulGrisaceoOscuro),
                        textAlign: TextAlign.center,
                        ),
                  onPressed: _gButton,
                  ),
                ), 
                Container(
                  width: 74,
                  child: Text("${widget.drink.productPrice}",
                    textAlign: TextAlign.end,
                  )
                ),   
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                MaterialButton(
                  color: coffeNaranjaGrisaceoClaro,
                  child: Text("AGREGAR AL CARRITO"),
                  onPressed: _openCartPage,
                  ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
                MaterialButton(
                  child: Text("COMPRAR AHORA"),
                  color: coffeNaranjaGrisaceoClaro,
                  onPressed: _openPaymentPage,
                  ),
              ],
            ),
          ),
          
        ],
      ),
      
    ),
    
    
    );
  }

  void _openPaymentPage(){
    Navigator.of(context).push(        
      MaterialPageRoute(builder: (context) => Payment(),
      ),
    );
  }

  void _openCartPageOnly() async{
    await Navigator.of(context).push(        
      MaterialPageRoute(builder: (context) => Cart(producto: widget.productoNuevo),
      ),
    ).then((updateProducts) {
      widget.productoNuevo = updateProducts;
    });

  }
  
  void _openCartPage() async{
    await Navigator.of(context).push(        
      MaterialPageRoute(builder: (context) => Cart(producto: ProductList.setCartList(widget.productoNuevo, widget.productoNuevo.cartLista ,ProductCart.addToCart(widget.drink.productTitle, widget.drink.productAmount, widget.drink.productPrice, ProductType.TAZAS, widget.drink.productImage, widget.drink.liked ))),
      ),
    ).then((updateProducts) {
      widget.productoNuevo = updateProducts;
    });

  }
  
  void _chButton(){
    //widget.productoNuevo.drinks.liked = widget.drink.liked;
    setState(() {
      widget.drink.productSize = ProductSize.CH;  
      widget.productoNuevo = ProductList.setDrink(widget.productoNuevo, widget.drink);
      widget.drink = widget.productoNuevo.drinks;
    });
  }

  void _mButton(){
    //widget.productoNuevo.drinks.liked = widget.drink.liked;
    setState(() {
      widget.drink.productSize = ProductSize.M;    
      widget.productoNuevo = ProductList.setDrink(widget.productoNuevo, widget.drink); 
      widget.drink = widget.productoNuevo.drinks; 
    });
  }

  void _gButton(){
    //widget.productoNuevo.drinks.liked = widget.drink.liked;
    setState(() {
      widget.drink.productSize = ProductSize.G;    
      widget.productoNuevo = ProductList.setDrink(widget.productoNuevo, widget.drink); 
      widget.drink = widget.productoNuevo.drinks; 
    });
  }

  void _productLiked(){
    //widget.productoNuevo.drinks.liked = widget.drink.liked;
    setState(() {
      widget.drink.liked = !widget.drink.liked; 
    });
  }

  void _backUpAndCart(){
    //widget.productoNuevo.drinks.liked = widget.drink.liked;
      widget.productoNuevo = ProductList.setDrink(widget.productoNuevo, widget.drink);
      Navigator.of(context).pop(widget.productoNuevo);

  }

}