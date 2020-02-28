import 'package:flutter/material.dart';
import 'package:proyecto_zimmca/cart/cart.dart';
import 'package:proyecto_zimmca/models/product_cups.dart';
import 'package:proyecto_zimmca/models/product_cart.dart';
import 'package:proyecto_zimmca/user/profile.dart';
import 'package:proyecto_zimmca/utils/colors.dart';
import 'package:proyecto_zimmca/models/listOfProducts.dart';
import 'package:proyecto_zimmca/payment.dart';
import 'package:proyecto_zimmca/models/product_repository.dart';


class CupsDetailPage extends StatefulWidget {
  ProductCups cup;
  ProductList productoNuevo;

  CupsDetailPage({
    Key key,
    @required this.cup,
    @required this.productoNuevo,
  }) : super(key: key);

  @override
  _DetailCupsState createState() => _DetailCupsState();
}

class _DetailCupsState extends State<CupsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.cup.productTitle}", style: TextStyle(color: coffeBlanco),),
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
                      "${widget.cup.productImage}",
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
                      color: widget.cup.liked ? Colors.red : coffeAzulGrisaceoOscuro,
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
                "${widget.cup.productTitle}",
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
                  "${widget.cup.productDescription}",
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: coffeAzulOscuro)
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: coffeBlanco,
                    ),
                  onPressed: _whiteButton,
                  ),
                ),  
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: coffeAzulOscuro)
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: coffeNaranjaLigero62,
                    ),
                  onPressed: _orangeButton,
                  ),
                ),  
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: coffeAzulOscuro)
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: coffeAzulOscuro,
                    ),
                  onPressed: _blueButton,
                  ),
                ),   
                Container(
                  width: 140,
                  child: Text("${widget.cup.productPrice}",
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
      MaterialPageRoute(builder: (context) => Cart(producto: ProductList.setCartList(widget.productoNuevo, widget.productoNuevo.cartLista ,ProductCart.addToCart(widget.cup.productTitle, widget.cup.productAmount, widget.cup.productPrice, ProductType.TAZAS, widget.cup.productImage, widget.cup.liked))),
      ),
    ).then((updateProducts) {
      widget.productoNuevo = updateProducts;
    });

  }
  
  void _whiteButton(){
    //widget.productoNuevo.cups.liked = widget.cup.liked;
    setState(() {
      widget.cup.productColor = ProductColor.WHITE;  
      widget.productoNuevo = ProductList.setCup(widget.productoNuevo, widget.cup);
      widget.cup = widget.productoNuevo.cups;
    });
  }

  void _orangeButton(){
    //widget.productoNuevo.cups.liked = widget.cup.liked;
    setState(() {
      widget.cup.productColor = ProductColor.ORANGE;    
      widget.productoNuevo = ProductList.setCup(widget.productoNuevo, widget.cup); 
      widget.cup = widget.productoNuevo.cups; 
    });
  }

  void _blueButton(){
    //widget.productoNuevo.cups.liked = widget.cup.liked;
    setState(() {
      widget.cup.productColor = ProductColor.BLUE;  
      widget.productoNuevo = ProductList.setCup(widget.productoNuevo, widget.cup); 
      widget.cup = widget.productoNuevo.cups;
    });
  }

  void _productLiked(){
    //widget.productoNuevo.cups.liked = widget.cup.liked;
    setState(() {
      widget.cup.liked = !widget.cup.liked; 
    });
  }

  void _backUpAndCart(){
    //widget.productoNuevo.cups.liked = widget.cup.liked;
      widget.productoNuevo = ProductList.setCup(widget.productoNuevo, widget.cup);
      Navigator.of(context).pop(widget.productoNuevo);

  }

}
