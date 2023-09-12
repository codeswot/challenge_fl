import 'package:challenge_fl/products/bloc/product_bloc.dart';
import 'package:challenge_fl/products/repository/repository.dart';
import 'package:challenge_fl/products/view/view.dart';
import 'package:challenge_fl/products/widgets/widgets.dart';
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
        child: const SafeArea(
          child: Column(
            children: [
              ProductPageHeaderCart(),
              ProductBrandList(),
              ProductListPage(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.filter_list),
        label: const Text('Filter'),
      ),
    );
  }
}
