
import 'package:dio/dio.dart';
import 'package:sib_app/data/model/product_image.dart';
import 'package:sib_app/data/model/product_varient.dart';
import 'package:sib_app/data/model/varient.dart';
import 'package:sib_app/data/model/varient_type.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/utils/3api_exeption.dart';
import '../model/category.dart';

abstract class IDetailProductDatasource {
  Future<List<ProductImage>> getGallery(String productId);
  Future<List<VariantType>> getVariantTypes();
  Future<List<Variant>> getVariant();
  Future<List<ProductVariant>> getProductVariants();
  // Future<Category> getProductCategory(String categoryId);
  // Future<List<Property>> getProductProperties(String productId);
}

class DetailProductRemoteDatasource extends IDetailProductDatasource {
  final Dio _dio = locator.get();

  @override
  Future<List<ProductImage>> getGallery(String productId) async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="$productId"'};
      var respones = await _dio.get('collections/gallery/records',
          queryParameters: qParams);

      return respones.data['items']
          .map<ProductImage>((jsonObject) => ProductImage.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

    @override
  Future<List<VariantType>> getVariantTypes() async {
    try {
      var respones = await _dio.get('collections/variants_type/records');

      return respones.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromjson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<Variant>> getVariant() async {
    try {
      Map<String, String> qParams = {'filter': 'product_id="at0y1gm0t65j62j"'};

      var respones = await _dio.get('collections/variants/records',
          queryParameters: qParams);

      return respones.data['items']
          .map<Variant>((jsonObject) => Variant.fromJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }

  @override
  Future<List<ProductVariant>> getProductVariants() async {
    var variantTypeList = await getVariantTypes();
    var variantList = await getVariant();

    List<ProductVariant> productVariantList = [];

    try {
      for (var variantType in variantTypeList) {
        var variant = variantList
            .where((element) => element.typeId == variantType.id)
            .toList();
        productVariantList.add(ProductVariant(variantType, variant));
      }

      return productVariantList;
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }


//   @override
//   Future<Category> getProductCategory(String categoryId) async {
//     try {
//       Map<String, String> qParams = {'filter': 'id="$categoryId"'};
//       var reponse = await _dio.get('collections/category/records',
//           queryParameters: qParams);
//       return Category.fromMapJson(reponse.data['items'][0]);
//     } on DioError catch (ex) {
//       throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
//     } catch (ex) {
//       throw ApiException(0, 'unknown erorr');
//     }
//   }
  
//   @override
//   Future<List<Property>> getProductProperties(String productId) async {
//          try {
//       Map<String, String> qParams = {'filter': 'product_id="$productId"'};

//       var respones = await _dio.get('collections/properties/records',
//           queryParameters: qParams);

//       return respones.data['items']
//           .map<Property>((jsonObject) => Property.fromJson(jsonObject))
//           .toList();
//     } on DioError catch (ex) {
//       throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
//     } catch (ex) {
//       throw ApiException(0, 'unknown erorr');
//     }
//   }
}