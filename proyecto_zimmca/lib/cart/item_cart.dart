import 'package:flutter/material.dart';
import 'package:proyecto_zimmca/utils/colors.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        color: coffeNaranjaLigero62,
        margin: EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                    "${widget.product.productTitle}",
                    style: TextStyle(fontSize: 22.0, color: coffeBlanco),
                    textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                    "${widget.product.productPrice}",
                    style: TextStyle(fontSize: 22.0, color: coffeAzulGrisaceoOscuro),
                    textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                ),
                child: Image.network(
                  "${widget.product.productImage}",
                  fit: BoxFit.fitHeight,
                  height: 180,
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: widget.product.liked ? Colors.red : coffeAzulGrisaceoOscuro,
                  ),
                  onPressed: _productLiked,
                ),
                
                SizedBox(
                  height: 12,
                ),
                IconButton(icon: Icon(Icons.add_circle_outline), onPressed: _addProd),
                SizedBox(
                  height: 12,
                ),
                IconButton(icon: Icon(Icons.remove_circle), onPressed: _remProd),
                SizedBox(
                  height: 12,
                ),
                Text("${widget.product.productAmount}"),
                SizedBox(
                  height: 12,
                ),
                Text("${widget.product.productPrice} MX\$"),
                SizedBox(
                  height: 12,
                ),
                ],
              ),
            ),
                ],
        ),
      );
  }
      
  void _productLiked(){
    setState(() {
      widget.product.liked = !widget.product.liked;
    });
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }
}
