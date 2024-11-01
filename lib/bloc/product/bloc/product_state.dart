
import 'package:dartz/dartz.dart';
import 'package:sib_app/data/model/product_image.dart';
import 'package:sib_app/data/model/product_varient.dart';
import 'package:sib_app/data/model/varient_type.dart';

abstract class ProductState {}

class ProductInitState extends ProductState {}

class ProductDetailLoadingState extends ProductState {}

class ProductDetailResponseState extends ProductState {
  Either<String, List<ProductImage>> productImages;
  Either<String, List<ProductVariant>> productVarient;
  // Either<String, Category> productCategory;
  // Either<String, List<Property>> productProperties;

  ProductDetailResponseState(
    this.productImages,
    this.productVarient,
    // this.productCategory,
    // this.productProperties,
  );
}
