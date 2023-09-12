import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_fl/products/bloc/product_bloc.dart';
import 'package:challenge_fl/products/models/models.dart';
import 'package:challenge_fl/products/repository/product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class FakeProduct extends Fake implements Product {}

void main() {
  final mockProduct = [
    Product(
      id: '1',
      name: 'name 1',
      description: 'description 1',
      averageRatings: 3,
      brandId: '1',
      brandName: 'Nike',
      color: 'blue',
      gender: 'Man',
      price: 200,
      reviewCount: 30,
      images: const [],
      sizes: const [],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  group(
    'ProductBloc',
    () {
      late ProductRepository productRepository;

      setUpAll(() {
        registerFallbackValue(FakeProduct());
      });

      setUp(() {
        productRepository = MockProductRepository();
        when(
          () => productRepository.products(),
        ).thenAnswer((_) => Stream.value(mockProduct));
      });

      ProductBloc buildBloc() {
        return ProductBloc(productRepository);
      }

      group('constructor', () {
        test('works properly', () => expect(buildBloc, returnsNormally));

        test('has correct initial state', () {
          expect(
            buildBloc().state,
            equals(const ProductState()),
          );
        });
      });

      group('ProductFethedRequest', () {
        blocTest<ProductBloc, ProductState>(
          'starts listening to repository products stream',
          build: buildBloc,
          act: (bloc) => bloc.add(ProductFethed()),
          verify: (_) {
            verify(() => productRepository.products()).called(1);
          },
        );

        blocTest<ProductBloc, ProductState>(
          'emits state with failure status '
          'when repository products stream emits error',
          setUp: () {
            when(
              () => productRepository.products(),
            ).thenAnswer((_) => Stream.error(Exception('oops')));
          },
          build: buildBloc,
          act: (bloc) => bloc.add(ProductFethed()),
          expect: () => [
            const ProductState(status: ProductStatus.initial),
            const ProductState(status: ProductStatus.failure),
          ],
        );
      });

      // group('filterchangeg', () {
      // });
    },
  );
}
