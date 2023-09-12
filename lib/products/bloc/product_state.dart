part of 'product_bloc.dart';

enum ProductStatus { initial, success, failure }

final class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    this.errorMessage = '',
    this.products = const <Product>[],
    this.hasReachedMax = false,
  });

  final ProductStatus status;
  final String errorMessage;
  final List<Product> products;
  final bool hasReachedMax;

  ProductState copyWith({
    String? errorMessage,
    ProductStatus? status,
    List<Product>? products,
    bool? hasReachedMax,
  }) {
    return ProductState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ProductState { status: $status, hasReachedMax: $hasReachedMax, products: ${products.length} }''';
  }

  @override
  List<Object> get props => [
        errorMessage,
        status,
        products,
        hasReachedMax,
      ];
}
