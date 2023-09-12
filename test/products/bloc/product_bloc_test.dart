import 'dart:async';

import 'package:challenge_fl/products/repository/repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_fl/products/bloc/product_bloc.dart';
import 'package:challenge_fl/products/models/product_model.dart';

final fakeProducts = [
  Product(
    id: '1',
    name: 'Product 1',
    description: 'Description 1',
    averageRatings: 2,
    images: const [],
    color: '',
    sizes: const [],
    brandId: '',
    brandName: '',
    gender: '',
    price: 200,
    reviewCount: 2,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ),
];

class MockProductRepository extends Mock implements ProductRepository {
  @override
  Stream<List<Product>> products() {
    final controller = StreamController<List<Product>>();
    controller.add(fakeProducts);
    return controller.stream;
  }
}


void main() {
  late ProductBloc productBloc;
  late MockProductRepository productRepository;

  setUp(() {
    productRepository = MockProductRepository();
    productBloc = ProductBloc(productRepository);
  });

  blocTest<ProductBloc, ProductState>(
    'emits [ProductState.success] when ProductFetched is added and productRepository succeeds',
    build: () {
      return productBloc;
    },
    act: (bloc) => bloc.add(ProductFetched()),
    expect: () => [
      ProductState(
        status: ProductStatus.success,
        products: fakeProducts,
        hasReachedMax: false,
      ),
    ],
  );
  blocTest<ProductBloc, ProductState>(
    'emits [ProductState.failure] when ProductFetched is added and productRepository throws',
    build: () => ProductBloc(MockProductRepository()),
    act: (bloc) => bloc.add(ProductFetched()),
    expect: () => const <ProductState>[
      ProductState(
        status: ProductStatus.failure,
        errorMessage: 'An error occurred',
        products: [],
      ),
    ],
  );
  tearDown(() {
    productBloc.close();
  });
}
