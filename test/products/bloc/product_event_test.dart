// ignore_for_file: prefer_const_constructors

import 'package:challenge_fl/products/bloc/product_bloc.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'ProductEvent',
    () {
      group('ProductsFetch', () {
        test('supports value equality', () {
          expect(
            ProductFetched(),
            equals(ProductFetched()),
          );
        });

        test('props are correct', () {
          expect(
            ProductFetched().props,
            equals(<Object?>[]),
          );
        });
      });
    },
  );
}
