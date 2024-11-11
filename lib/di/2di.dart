import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sib_app/data/datasource/1authentication_datasource.dart';
import 'package:sib_app/data/datasource/banner_datasource.dart';
import 'package:sib_app/data/datasource/category_datasource.dart';
import 'package:sib_app/data/datasource/category_product_datasource.dart';
import 'package:sib_app/data/datasource/product_datasource.dart';
import 'package:sib_app/data/datasource/product_detail_datasource.dart';
import 'package:sib_app/data/repository/4authentication_repository.dart';
import 'package:sib_app/data/repository/banner_repository.dart';
import 'package:sib_app/data/repository/category_product_repository.dart';
import 'package:sib_app/data/repository/category_repository.dart';
import 'package:sib_app/data/repository/product_detail_repository.dart';
import 'package:sib_app/data/repository/products_repository.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/'),
    ),
  );
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  locator.registerFactory<IAuthenticationDatasource>(
    () => AuthenticationRemote(),
  );
  locator.registerFactory<ICategoryDatasource>(
    () => CategoryRemoteDatasource(),
  );
  locator.registerFactory<IBannerDataSource>(
    () => BannerRemoteDataSource(),
  );
  locator.registerFactory<IProductDataSource>(
    () => ProductRemoteDataSource(),
  );
  locator.registerFactory<IDetailProductDatasource>(
    () => DetailProductRemoteDatasource(),
  );
  locator.registerFactory<ICategoryProductDatasource>(
    () => CategoryProductRemoteDatasource(),
  );

  //!---------------------------------------------------------------------

  locator.registerFactory<IAuthRepository>(
    () => AuthencticationRepository(),
  );
  locator.registerFactory<IBannerRepository>(
    () => BannerRepository(),
  );
  locator.registerFactory<ICategoryRepository>(
    () => CategoryRepository(),
  );

  locator.registerFactory<IProductRepository>(
    () => ProductRepository(),
  );
  
  locator.registerFactory<IDetailProductRepository>(
    () => DetailProductRepository(),
  );
  
  locator.registerFactory<ICategoryProductRepository>(
    () => CategoryProductRepository(),
  );

  // await _initComponents();

  // _initDatasoruces();

  // _initRepositories();

  // locator
  //     .registerSingleton<BasketBloc>(BasketBloc(locator.get(), locator.get()));
}

// Future<void> _initComponents() async {
//   locator.registerSingleton<SharedPreferences>(
//       await SharedPreferences.getInstance());
//   locator.registerSingleton<UrlHandler>(UrlLauncher());
//   locator
//       .registerSingleton<PaymentHandler>(ZarinpalPaymentHandler(locator.get()));
//   locator.registerSingleton<Dio>(DioProvider.createDio());
// }

// void _initDatasoruces() {
//   locator
//       .registerFactory<IAuthenticationDatasource>(() => AuthenticationRemote());
//   locator
//       .registerFactory<ICategoryDatasource>(() => CategoryRemoteDatasource());
//   locator.registerFactory<IBannerDatasource>(() => BannerRemoteDatasource());
//   locator.registerFactory<IProductDataSource>(() => ProductRemoteDataSource());
//   locator.registerFactory<IDetailProductDatasource>(
//       () => DetailProductRemoteDatasource());
//   locator.registerFactory<ICategoryProductDatasource>(
//       () => CategoryProductRemoteDatasource());
//   locator.registerFactory<IBasketDatasource>(() => BasketLocalDatasouce());

//   locator.registerFactory<ICommentDatasource>(() => CommentRemoteDatasource());
// }

// void _initRepositories() {
//   locator.registerFactory<IAuthRepository>(() => AuthencticationRepository());
//   locator.registerFactory<ICategoryRepository>(() => CategoryRepository());
//   locator.registerFactory<IBannerRepository>(() => BannerRepository());
//   locator.registerFactory<IProductRepository>(() => ProductRepository());
//   locator.registerFactory<IDetailProductRepository>(
//       () => DetailProductRepository());
//   locator.registerFactory<ICategoryProductRepository>(
//       () => CategoryProductRepository());
//   locator.registerFactory<IBasketRepository>(() => BasketRepository());

//   locator.registerFactory<ICommentRepository>(() => CommentRepository());
// }