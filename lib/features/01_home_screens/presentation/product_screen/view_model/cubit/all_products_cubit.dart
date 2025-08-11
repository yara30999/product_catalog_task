import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:products_app/features/01_home_screens/domain/get_products_usecase.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';
part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  final GetProductsUsecase _getProductsUsecase;
  String? _errMessage;
  AllProductsCubit(this._getProductsUsecase) : super(AllProductsInitial());

  Future<void> fetchProducts() async {
    emit(AllProductsLoading());
    final result = await _getProductsUsecase.execute();
    result.fold(
      (failure) {
        _errMessage =
            '${failure.message.toString()} ${failure.code.toString()}';
        emit(AllProductsError(_errMessage!));
      },
      (products) {
        emit(AllProductSuccess(products));
      },
    );
  }
}
