import 'package:alubian/models/product.dart';
import 'package:equatable/equatable.dart';

class BagModel extends Equatable {
  const BagModel({this.products = const <Product>[]});

  final List<Product> products;

  @override
  List<Object> get props => [products];
}
