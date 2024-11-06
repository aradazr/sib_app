
import 'package:dartz/dartz.dart';
import 'package:sib_app/data/datasource/product_detail_datasource.dart';
import 'package:sib_app/data/model/product_image.dart';
import 'package:sib_app/data/model/product_varient.dart';
import 'package:sib_app/data/model/varient_type.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/utils/3api_exeption.dart';
import '../model/category.dart';

abstract class IDetailProductRepository {
  Future<Either<String, List<ProductImage>>> getProuctImage(String productId);

  Future<Either<String, List<VariantType>>> getVariantTypes();

  Future<Either<String, List<ProductVariant>>> getProductVarinats(String productId);
  // Future<Either<String, Category>> getProductCategory(String categoryId);
  // Future<Either<String, List<Property>>> getProductProperties(String productId);
}

class DetailProductRepository extends IDetailProductRepository {
  final IDetailProductDatasource _datasource = locator.get();

  @override
  Future<Either<String, List<ProductImage>>> getProuctImage(String productId) async {
    try {
      var response = await _datasource.getGallery(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> getVariantTypes() async {
    try {
      var response = await _datasource.getVariantTypes();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, List<ProductVariant>>> getProductVarinats(String productId) async {
    try {
      var response = await _datasource.getProductVariants(productId);
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  // @override
  // Future<Either<String, Category>> getProductCategory(String categoryId) async {
  //   try {
  //     var response = await _datasource.getProductCategory(categoryId);
  //     return right(response);
  //   } on ApiException catch (ex) {
  //     return left(ex.message ?? 'خطا محتوای متنی ندارد');
  //   }
  // }

  // @override
  // Future<Either<String, List<Property>>> getProductProperties(
  //     String productId) async {
  //   try {
  //     var response = await _datasource.getProductProperties(productId);
  //     return right(response);
  //   } on ApiException catch (ex) {
  //     return left(ex.message ?? 'خطا محتوای متنی ندارد');
  //   }
  // }
}