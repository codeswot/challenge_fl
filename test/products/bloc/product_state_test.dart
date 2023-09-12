// ignore_for_file: prefer_const_constructors, avoid_redundant_argument_values

import 'package:challenge_fl/products/bloc/product_bloc.dart';
import 'package:challenge_fl/products/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mockProduct = Product(
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
  );
  final mockProducts = [mockProduct];
  group(
    'ProductState',
    () {
      ProductState createSubject({
        String errorMessage = '',
        ProductStatus status = ProductStatus.initial,
        List<Product>? products,
        bool hasReachedMax = false,
      }) {
        return ProductState(
          errorMessage: errorMessage,
          status: status,
          products: products ?? mockProducts,
          hasReachedMax: hasReachedMax,
        );
      }

      test('supports value equality', () {
        expect(
          createSubject(
            errorMessage: '',
            status: ProductStatus.initial,
            products: mockProducts,
            hasReachedMax: false,
          ).props,
          equals(<Object?>[
            '',
            ProductStatus.initial,
            mockProducts,
            false,
          ]),
        );
      });

      test('props are correct', () {
        expect(
          createSubject(
            errorMessage: '',
            status: ProductStatus.initial,
            products: mockProducts,
            hasReachedMax: false,
          ).props,
          equals(<Object?>[
            '',
            ProductStatus.initial,
            mockProducts,
            false,
          ]),
        );
      });

      group('copyWith', () {
        test('returns the same object if not arguments are provided', () {
          expect(
            createSubject().copyWith(),
            equals(createSubject()),
          );
        });

        test('retains the old value for every parameter if null is provided',
            () {
          expect(
            createSubject().copyWith(
              status: null,
              products: null,
            ),
            equals(createSubject()),
          );
        });
      });
    },
  );
}
