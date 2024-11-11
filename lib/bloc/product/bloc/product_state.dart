
import 'package:dartz/dartz.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/data/model/product_image.dart';
import 'package:sib_app/data/model/product_property.dart';
import 'package:sib_app/data/model/product_varient.dart';


abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<ProductVariant>> productVariant;
  Either<String, Category> productCategory;
  Either<String, List<Property>> productProperties;

  ProductDetailResponseState(
    this.productImages,
    this.productVariant,
    this.productCategory,
    this.productProperties,
  );
}
