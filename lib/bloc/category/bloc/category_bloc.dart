import 'package:bloc/bloc.dart';
import 'package:sib_app/bloc/category/bloc/category_event.dart';
import 'package:sib_app/bloc/category/bloc/category_state.dart';
import 'package:sib_app/data/repository/category_repository.dart';
import 'package:sib_app/di/2di.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ICategoryRepository _repository = locator.get();

  CategoryBloc() : super(CategoryInitState()) {
    on<CategoryRequestList>((event, emit) async {
      emit(CategoryLoadingState());
      var response = await _repository.getCategories();
      emit(CategoryResponseState(response));
    });
  }
}