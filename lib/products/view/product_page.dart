import 'package:challenge_fl/products/bloc/product_bloc.dart';
import 'package:challenge_fl/products/repository/repository.dart';
import 'package:challenge_fl/products/view/view.dart';
import 'package:challenge_fl/products/widgets/widgets.dart';
import 'package:challenge_fl/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
              Expanded(child: ProductListPage()),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.neutral500,
        foregroundColor: AppColors.neutralWhite,
        elevation: 0.5,
        onPressed: () {},
        icon: SvgPicture.asset(
          AppAssets.toggleSettingIcon,
        ),
        label: const Text('FILTER'),
      ),
    );
  }
}
