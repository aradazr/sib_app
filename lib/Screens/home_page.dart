import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/category_page.dart';
import 'package:sib_app/bloc/banner/home/home_bloc.dart';
import 'package:sib_app/bloc/banner/home/home_event.dart';
import 'package:sib_app/bloc/banner/home/home_state.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/data/repository/banner_repository.dart';
import 'package:sib_app/main.dart';
import 'package:sib_app/widgets/category_widget.dart';
import 'package:sib_app/widgets/image_slider.dart';
import 'package:sib_app/widgets/most_see_item.dart';
import 'package:sib_app/widgets/most_sell_item.dart';
import 'package:sib_app/widgets/my_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController controller = PageController();
  
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(
      HomeGetInitilzeData(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.homePageBackground,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
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
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
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
                SliverToBoxAdapter(
                  child: MostSellItem(),
                ),
                SliverToBoxAdapter(
                  child: MostSeeItem(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
class CategoryWidget extends StatelessWidget {

  final List<Category> listCategories;
   
  
   CategoryWidget({
    Key? key,
    required this.listCategories,

  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 20, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/doubleArrow.png',
                    height: 1.2.h,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'مشاهده همه',
                    style: TextStyle(
                      fontFamily: 'shbold',
                      fontSize: 15.sp,
                      color: LightColors.seeAllText,
                    ),
                  ),
                ],
              ),
              Text(
               'دسته بندی ها',
                style: TextStyle(
                  fontFamily: 'shbold',
                  fontSize: 15.sp,
                  color: LightColors.categoryText,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 11.h,
          width: double.infinity,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
               return CategoryItemChip(categorys: listCategories[index]);
              
            },
          ),
        )
      ],
    );
  }
}
