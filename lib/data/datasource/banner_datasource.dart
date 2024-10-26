import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sib_app/data/model/banner.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/utils/3api_exeption.dart';

abstract class IBannerDataSource{
  Future<List<BannerCampain>> getBanners();
}

class BannerRemoteDataSource extends IBannerDataSource{
  final Dio _dio = locator.get();
  @override
  Future<List<BannerCampain>> getBanners() async {
   try {
      var respones = await _dio.get('collections/banner/records');
      return respones.data['items']
          .map<BannerCampain>((jsonObject) => BannerCampain.fromJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'unknown erorr');
    }
  }
  
}