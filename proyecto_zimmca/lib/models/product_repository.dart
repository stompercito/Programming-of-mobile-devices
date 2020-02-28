import 'package:proyecto_zimmca/models/product_drinks.dart';
import 'package:proyecto_zimmca/models/product_grains.dart';
import 'package:proyecto_zimmca/models/product_cups.dart';

enum ProductType { BEBIDAS, GRANO, TAZAS }

class ProductRepository {
  static List<dynamic> loadProducts(ProductType prodType) {
    // ----------------------       Tazas      ----------------------------//
    if (prodType == ProductType.TAZAS)
      return <ProductCups>[
        ProductCups(
          productTitle: "Fantasmin",
          productDescription: "Taza de la marca nintendo, basado en el mundo de Mario Bros. Es un fantasma con la lengua de fuera.",
          productImage:
              "https://gameplanet-53f8.kxcdn.com/media/catalog/product/cache/4/image/9df78eab33525d08d6e5fb8d27136e95/t/a/taza-boo.jpg",
          productColor: ProductColor.WHITE,
          productAmount: 0,
        ),
        ProductCups(
          productTitle: "Ser Chingona",
          productDescription: "La taza muerta el mensaje, Ser CHINGONA no es casualidad.",
          productImage:
              "https://images-na.ssl-images-amazon.com/images/I/71dQzn5Xj%2BL._SX466_.jpg",
          productColor: ProductColor.BLUE,
          productAmount: 0,
        ),
        ProductCups(
          productTitle: "Mejor Juntos",
          productDescription:
              "Par de tazas con imagenes y juntas muestran la frase, MEJOR JUNTOS. ",
          productImage:
              "https://www.dantacommerce.com/pub/media/catalog/product/cache/image/700x700/e9c3970ab036de70892d86c6d221abfe/i/m/img_20190104_013316.jpg",
          productColor: ProductColor.WHITE,
          productAmount: 0,
        ),
        ProductCups(
          productTitle: "El Principito",
          productDescription:
              "Taza con estrellas, el principito esta encima de lal luna",
          productImage:
              "https://cdn.gandhi.com.mx/media/catalog/product/cache/1/image/370x/9df78eab33525d08d6e5fb8d27136e95/4/0/4028145051011.jpg",
          productColor: ProductColor.WHITE,
          productAmount: 0,
        ),
        ProductCups(
          productTitle: "Taza Naranja",
          productDescription:
              "Una taza simple en su diseño. ",
          productImage:
              "https://web.promoopcion.com/media/catalog/product/cache/afad95d7734d2fa6d0a8ba78597182b7/T/A/TAZ-032-O.jpg",
          productColor: ProductColor.ORANGE,
          productAmount: 0,
        ),
      ];

    // ----------------------       Grano      ----------------------------//
    if (prodType == ProductType.GRANO)
      return <ProductGrains>[
        ProductGrains(
          productTitle: "Lavazza",
          productDescription: "Endulzado con aromas florales.",
          productImage:
              "https://www.lavazza.it/content/dam/lavazza/products/caffe/macinato/moka/qualitaoro/new_render/tin_250_en/Tin-oro-en-250-thumb.png",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Guilis",
          productDescription: "La mezcla de cinco orígenes diferentes.",
          productImage:
              "https://www.cafesguilis.com/wp-content/uploads/2018/08/mezcla_especial_1Kg.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Illy",
          productDescription:
              "Con toque de chocolate, miel, caramelo y un cierto amargor. ",
          productImage:
              "https://http2.mlstatic.com/illy-cafe-en-grano-etiopia-arabica-seleccion-de-un-solo-or-D_NQ_NP_987783-MLM31233980209_062019-F.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "Sanani",
          productDescription:
              "Tiene un muy buen sabor intenso y con fuerte acidez.",
          productImage:
              "https://http2.mlstatic.com/cafe-tostado-en-granos-1kg-origen-colombia-maquinas-express-D_NQ_NP_947249-MLA31115265526_062019-Q.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
        ProductGrains(
          productTitle: "La Mexicana",
          productDescription:
              "Es un café único por la manera en la que están tostados sus granos.",
          productImage:
              "https://www.lamexicana.es/404-large_default/cafe-1890-mezcla-suave.jpg",
          productWeight: ProductWeight.KILO,
          productAmount: 0,
        ),
      ];
    // ----------------------       Bebidas      ----------------------------//
    if (prodType == ProductType.BEBIDAS)
      return <ProductDrinks>[
        ProductDrinks(
          productTitle: "Ristretto",
          productDescription: "Expresso con una proporción menor de agua.",
          productImage:
              "https://ineedcoffee.com/wp-content/uploads/2007/09/IMG_9259.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Americano",
          productDescription:
              "Derivado del espresso, con mayor cantidad de agua.",
          productImage:
              "https://cafe.omcns.com/wp-content/uploads/2018/08/Americano-2.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Expresso",
          productDescription:
              "Uno de los tipos de café más básicos y sencillos.",
          productImage:
              "https://cdn.cnn.com/cnnnext/dam/assets/200120171537-espresso-machine-stock-large-169.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Lungo",
          productDescription:
              "Aquí es directamente la infusión la que se produce en mayor cantidad.",
          productImage:
              "https://coffeegearx.com/wp-content/uploads/2019/08/What-Does-a-Lungo-Taste-Like.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Café bombón",
          productDescription:
              "Se sustituye la leche normal por la leche condensada.",
          productImage: "https://ua.all.biz/img/ua/catalog/4944889.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Frappé",
          productDescription:
              "Café instantáneo molido, hielo y crema de leche o nata.",
          productImage:
              "https://i.pinimg.com/originals/54/e5/01/54e501068f3608debbd828a81a198c8d.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Mocca",
          productDescription:
              "Además de leche y café se emplea Mocolate o cacao.",
          productImage:
              "https://www.juanvaldezcafe.com/sites/default/files/mocca_grande.png",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Café con leche",
          productDescription: "Incorporación de leche al café.",
          productImage:
              "https://www.goodfood.com.au/content/dam/images/3/f/6/p/i/image.related.articleLeadwide.620x349.3f2ru.png/1411331099390.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Café vienés",
          productDescription: "Se acompaña en vez de leche con crema o nata.",
          productImage:
              "https://www.hogarmania.com/archivos/201105/vienes-xl-668x400x80xX.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Macchiato",
          productDescription: "Expresso con una ligera cantidad de leche.",
          productImage:
              "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Macchiato.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Carajillo",
          productDescription: "Se heMa licor previamente calentado.",
          productImage:
              "https://cdn2.cocinadelirante.com/sites/default/files/styles/gallerie/public/images/2016/07/carajillocafe.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Cappuccino",
          productDescription: "Un tercio de café y el resto leche.",
          productImage:
              "https://www.perfectdailygrind.com/wp-content/uploads/2019/02/cappuccino-1.png",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
        ProductDrinks(
          productTitle: "Azteca",
          productDescription:
              "Además de café, hielo y leche una o más bolas de helado.",
          productImage:
              "https://www.gastronomiavasca.net/uploads/image/file/6838/w700_caf__azteca.jpg",
          productSize: ProductSize.M,
          productAmount: 0,
        ),
      ];
    return List(); // otherwise empty list
  }
}
