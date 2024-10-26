import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sib_app/bloc/banner/home/home_event.dart';
import 'package:sib_app/bloc/banner/home/home_state.dart';
import 'package:sib_app/data/repository/banner_repository.dart';
import 'package:sib_app/data/repository/category_repository.dart';
import 'package:sib_app/di/2di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICategoryRepository _categoryRepository = locator.get();
  // final IProductRepository _productRepository = locator.get();

  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitilzeData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerList = await _bannerRepository.getBanners();
      var categoryList = await _categoryRepository.getCategories();
      // var productList = await _productRepository.getproducts();
      // var hotestProductList = await _productRepository.getHotest();
      // var bestSellerProductList = await _productRepository.getBsetSeller();

      emit(
        HomeRequestSuccessState(
          bannerList,
          categoryList,
          // productList,
          // hotestProductList,
          // bestSellerProductList,
        ),
      );
    });
  }
}
