import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:challenge_fl/products/models/models.dart';
import 'package:challenge_fl/products/repository/repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

part 'product_event.dart';
part 'product_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(const ProductState()) {
    on<ProductFethed>(
      _onProductFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _onProductFetched(
      ProductFethed event, Emitter<ProductState> emitter) async {
    if (state.hasReachedMax) return;

    try {
      if (state.status == ProductStatus.initial) {
        final productsStream = productRepository.products();
        emitter.onEach(productsStream, onData: (products) {
          return emitter(state.copyWith(
            status: ProductStatus.success,
            products: products,
            hasReachedMax: false,
          ));
        });
      }
    } catch (e) {
      emitter(state.copyWith(status: ProductStatus.failure));
    }
  }
}
