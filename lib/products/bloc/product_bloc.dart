import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:challenge_fl/products/models/models.dart';
import 'package:challenge_fl/products/repository/repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(const ProductState()) {
    on<ProductFetched>((event, emit) async {
      if (state.hasReachedMax) return;

      try {
        if (state.status == ProductStatus.initial) {
          final productsStream = productRepository.products();
          await productsStream.listen(
            (products) {
              emit(
                state.copyWith(
                  status: ProductStatus.success,
                  products: products,
                  hasReachedMax: false,
                ),
              );
            },
            onError: (e, t) {
              emit(
                state.copyWith(
                  status: ProductStatus.failure,
                  errorMessage: "$e TRACE $t",
                ),
              );
            },
          ).asFuture();
        }
      } catch (e, t) {
        emit(
          state.copyWith(
            status: ProductStatus.failure,
            errorMessage: "$e TRACE $t",
          ),
        );
      }
    });
  }
}
