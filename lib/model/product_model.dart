import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int quantity;
  final int price;

  const ProductModel({required this.quantity, required this.price});

  factory ProductModel.fromString({
    required String quantity,
    required String price,
  }) =>
      ProductModel(
        quantity: int.parse(quantity),
        price: int.parse(price),
      );

  factory ProductModel.empty() => const ProductModel(quantity: 0, price: 0);

  bool get isValid => price > 0 && quantity > 0;

  double get valueUnitary => price / quantity;

  @override
  List<Object?> get props => [quantity, price];

  @override
  String toString() => ' quantity: $quantity price $price';
}
