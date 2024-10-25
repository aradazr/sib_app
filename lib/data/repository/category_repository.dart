import 'package:dartz/dartz.dart';
import 'package:sib_app/data/datasource/category_datasource.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/utils/3api_exeption.dart';

abstract class ICategoryRepository {
  Future<Either<String, List<Category>>> getCategories();
}

class CategoryRepository extends ICategoryRepository {
  final ICategoryDatasource _datasource = locator.get();
  @override
  Future<Either<String, List<Category>>> getCategories() async {
    try {
      var response = await _datasource.getGategories();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}