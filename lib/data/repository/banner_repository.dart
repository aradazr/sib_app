import 'package:dartz/dartz.dart';
import 'package:sib_app/data/datasource/banner_datasource.dart';
import 'package:sib_app/data/model/banner.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/utils/3api_exeption.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerCampain>>> getBanners();
}

class BannerRepository extends IBannerRepository{

final IBannerDataSource _datasource = locator.get();

  @override
  Future<Either<String, List<BannerCampain>>> getBanners() async {
    try {
      var response = await _datasource.getBanners();
      return right(response);
    } on ApiException catch (ex) {
      return left(ex.message ?? 'خطا محتوای متنی ندارد');
    }
  }
  
}