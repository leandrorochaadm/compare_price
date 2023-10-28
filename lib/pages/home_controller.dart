import '../model/product_model.dart';

class HomeController {
  ProductModel product1 = ProductModel.empty();
  ProductModel product2 = ProductModel.empty();

  static const product1Name = 'produto 1';
  static const product2Name = 'produto 2';

  bool get isValid => product1.isValid && product2.isValid;

  String get productAdvantageous {
    if (!isValid) return '';

    if (product1.valueUnitary < product2.valueUnitary) {
      final proportion = product1.valueUnitary / product2.valueUnitary;
      final percentil = (1 - proportion) * 100;
      return 'O $product1Name é ${percentil.toStringAsFixed(1)}% mais barato que o $product2Name';
    } else {
      final proportion = product2.valueUnitary / product1.valueUnitary;
      final percentil = (1 - proportion) * 100;
      return 'O $product2Name é ${percentil.toStringAsFixed(1)}% mais barato que o $product1Name';
    }
  }
}
