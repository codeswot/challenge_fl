import 'package:challenge_fl/products/view/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shared/shared.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 1137),
      minTextAdapt: true,
      builder: (context, _) {
        return AppView();
      },
    );
  }
}

class AppView extends MaterialApp {
  AppView({super.key})
      : super(
          title: 'Challenge FL',
          theme: appTheme,
          home: const ProductsPage(),
        );
}
