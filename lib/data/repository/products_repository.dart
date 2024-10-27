
import 'package:dartz/dartz.dart';
import 'package:sib_app/data/datasource/product_datasource.dart';
import 'package:sib_app/data/model/product.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/utils/3api_exeption.dart';


abstract class IProductRepository {
  Future<Either<String, List<Product>>> getproducts();
  Future<Either<String, List<Product>>> getHotest();
  Future<Either<String, List<Product>>> getBsetSeller();
}

class ProductRepository extends IProductRepository {
  final IProductDataSource _datasource = locator.get();
  @override
  Future<Either<String, List<Product>>> getproducts() async {
    try {
      var response = await _datasource.getProducts();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Product>>> getBsetSeller() async {
    try {
      var response = await _datasource.getBestSeller();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<Product>>> getHotest() async {
    try {
      var response = await _datasource.getHotest();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}