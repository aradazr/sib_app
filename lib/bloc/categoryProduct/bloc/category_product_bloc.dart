
import 'package:bloc/bloc.dart';
import 'package:sib_app/bloc/categoryProduct/bloc/category_product_event.dart';
import 'package:sib_app/bloc/categoryProduct/bloc/category_product_state.dart';
import 'package:sib_app/data/repository/category_product_repository.dart';
import 'package:sib_app/di/2di.dart';


class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
  final ICategoryProductRepository _repository = locator.get();

  CategoryProductBloc() : super(CategoryProductLoadingState()) {
    on<CategoryProductInitialize>((event, emit) async {
      var response = await _repository.getProductByCategoryId(event.categoryId);
      emit(CategoryProductResponseSuccessState(response));
    });
  }
}