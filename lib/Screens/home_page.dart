// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/widgets/category_widget.dart';
import 'package:sib_app/widgets/get_best_seller_product_widget.dart';
import 'package:sib_app/widgets/loading_circule_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:sib_app/Screens/category_page.dart';
import 'package:sib_app/bloc/banner/home/home_bloc.dart';
import 'package:sib_app/bloc/banner/home/home_event.dart';
import 'package:sib_app/bloc/banner/home/home_state.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/data/model/product.dart';
import 'package:sib_app/data/repository/banner_repository.dart';
import 'package:sib_app/main.dart';
import 'package:sib_app/widgets/category_itemchip_widget.dart';
import 'package:sib_app/widgets/image_slider.dart';
import 'package:sib_app/widgets/most_see_item.dart';
import 'package:sib_app/widgets/product_item.dart';
import 'package:sib_app/widgets/my_app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.homePageBackground,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: SpinKitFadingCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<HomeBloc>(context).add(HomeGetInitilzeData());
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: MyAppBar(
                        textPadding: EdgeInsets.only(right: 26),
                        appBarTitle: 'جست و جوی محصولات',
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        leftIcon: 'assets/images/search.png',
                        showLeftIcon: true,
                        fontFamily: 'sh',
                        rightIcon: '',
                        showRightIcon: false,
                      ),
                    ),
                    if (state is HomeLoadingState) ...[
                      SliverToBoxAdapter(
                        child: LoadingCirculeWidget()
                      ),
                    ],
                    if (state is HomeRequestSuccessState) ...[
                      state.bannerList.fold(
                        (error) {
                          return SliverToBoxAdapter(
                            child: Text(error),
                          );
                        },
                        (listBanners) {
                          return SliverToBoxAdapter(
                            child: BannerSlider(
                              controller: controller,
                              bannersList: listBanners,
                            ),
                          );
                        },
                      )
                    ],
                    if (state is HomeRequestSuccessState) ...[
                      state.categoryList.fold(
                        (error) {
                          return SliverToBoxAdapter(
                            child: Text(error),
                          );
                        },
                        (listCategory) {
                          return SliverToBoxAdapter(
                            child: CategoryWidget(listCategories: listCategory),
                          );
                        },
                      )
                    ],
                    if (state is HomeRequestSuccessState) ...[
                      state.bestSellerProductList.fold(
                        (error) {
                          return SliverToBoxAdapter(
                            child: Text(error),
                          );
                        },
                        (listProduct) {
                          return SliverToBoxAdapter(
                            child: GetBestSellerProduct(
                              productList: listProduct,
                            ),
                          );
                        },
                      )
                    ],
                    if (state is HomeRequestSuccessState) ...[
                      state.hotestProductList.fold(
                        (error) {
                          return SliverToBoxAdapter(
                            child: Text(error),
                          );
                        },
                        (listProduct) {
                          return SliverToBoxAdapter(
                            child: MostSeeItem(
                              productList: listProduct,
                            ),
                          );
                        },
                      )
                    ],
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
