import 'package:flutter/material.dart';
import 'package:proyecto_zimmca/cart/cart.dart';
import 'package:proyecto_zimmca/models/product_grains.dart';
import 'package:proyecto_zimmca/models/product_cart.dart';
import 'package:proyecto_zimmca/user/profile.dart';
import 'package:proyecto_zimmca/utils/colors.dart';
import 'package:proyecto_zimmca/models/listOfProducts.dart';
import 'package:proyecto_zimmca/payment.dart';
import 'package:proyecto_zimmca/models/product_repository.dart';


class GrainsDetailPage extends StatefulWidget {
  ProductGrains grain;
  ProductList productoNuevo;
  
  GrainsDetailPage({
    Key key,
    @required this.grain,
    @required this.productoNuevo,
  }) : super(key: key);

  @override
  _DetailGrainsState createState() => _DetailGrainsState();
}

class _DetailGrainsState extends State<GrainsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.grain.productTitle}", style: TextStyle(color: coffeBlanco),),
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
                      "${widget.grain.productImage}",
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
                      color: widget.grain.liked ? Colors.red : coffeAzulGrisaceoOscuro,
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
                "${widget.grain.productTitle}",
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
                  "${widget.grain.productDescription}",
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
                    border: Border.all(width: 2, color: coffeAzulOscuro)
                  ),
                  child: MaterialButton(
                    child: Text(
                        "250 G",
                        style: TextStyle(fontSize: 10.0, color: coffeAzulGrisaceoOscuro),
                        textAlign: TextAlign.center,
                        ),
                  onPressed: _cuartoButton,
                  ),
                ),  
                Container(
                  width: 74,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 2, color: coffeAzulOscuro)
                  ),
                  child: MaterialButton(
                    child: Text(
                        "1K",
                        style: TextStyle(fontSize: 10.0, color: coffeAzulGrisaceoOscuro),
                        textAlign: TextAlign.center,
                        ),
                  onPressed: _kiloButton,
                  ),
                ),  
                Container(
                  width: 140,
                  child: Text("${widget.grain.productPrice}",
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
      MaterialPageRoute(builder: (context) => Cart(producto: ProductList.setCartList(widget.productoNuevo, widget.productoNuevo.cartLista ,ProductCart.addToCart(widget.grain.productTitle, widget.grain.productAmount, widget.grain.productPrice, ProductType.TAZAS, widget.grain.productImage, widget.grain.liked ))),
      ),
    ).then((updateProducts) {
      widget.productoNuevo = updateProducts;
    });

  }
  
  void _cuartoButton(){
    //widget.productoNuevo.grains.liked = widget.grain.liked;
    setState(() {
      widget.grain.productWeight = ProductWeight.CUARTO;  
      widget.productoNuevo = ProductList.setGrain(widget.productoNuevo, widget.grain);
      widget.grain = widget.productoNuevo.grains;
    });
  }

  void _kiloButton(){
    //widget.productoNuevo.grains.liked = widget.grain.liked;
    setState(() {
      widget.grain.productWeight = ProductWeight.KILO;    
      widget.productoNuevo = ProductList.setGrain(widget.productoNuevo, widget.grain); 
      widget.grain = widget.productoNuevo.grains; 
    });
  }

  void _productLiked(){
    //widget.productoNuevo.grains.liked = widget.grain.liked;
    setState(() {
      widget.grain.liked = !widget.grain.liked; 
    });
  }

  void _backUpAndCart(){
    //widget.productoNuevo.grains.liked = widget.grain.liked;
      widget.productoNuevo = ProductList.setGrain(widget.productoNuevo, widget.grain);
      Navigator.of(context).pop(widget.productoNuevo);

  }

}