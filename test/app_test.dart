import 'package:challenge_fl/app.dart';
import 'package:challenge_fl/products/repository/product_repository.dart';
import 'package:challenge_fl/products/view/view.dart';
import 'package:challenge_fl/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'products/bloc/product_bloc_test.dart';

void main() {
  late ProductRepository productRepository;

  setUp(() {
    productRepository = MockProductRepository();
    when(
      () => productRepository.products(),
    ).thenAnswer((_) => const Stream.empty());
  });

  group('App', () {
    testWidgets('renders AppView', (tester) async {
      await tester.pumpWidget(
        const App(),
      );

      expect(find.byType(AppView), findsWidgets);
    });
  });

  group('AppView', () {
    testWidgets('renders MaterialApp with correct themes', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: productRepository,
          child: AppView(),
        ),
      );

      expect(find.byType(MaterialApp), findsOneWidget);

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(appTheme));
    });

    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: productRepository,
          child: AppView(),
        ),
      );

      expect(find.byType(ProductsPage), findsOneWidget);
    });
  });
}
