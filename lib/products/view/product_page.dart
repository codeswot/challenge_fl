import 'package:challenge_fl/products/bloc/product_bloc.dart';
import 'package:challenge_fl/products/repository/repository.dart';
import 'package:challenge_fl/products/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ProductBloc(
          FirebaseProductRepository(),
        )..add(
            ProductFethed(),
          ),
        child: const ProductListPage(),
      ),
    );
  }
}
