import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/main.dart';
import 'package:sib_app/widgets/category_widget.dart';
import 'package:sib_app/widgets/image_slider.dart';
import 'package:sib_app/widgets/most_see_item.dart';
import 'package:sib_app/widgets/most_sell_item.dart';
import 'package:sib_app/widgets/my_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.homePageBackground,
        body: CustomScrollView(
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
            )),
            SliverToBoxAdapter(
              child: ImageSlider(controller: controller),
            ),
            SliverToBoxAdapter(
              child: CategoryWidgwt(),
            ),
            SliverToBoxAdapter(
              child: MostSellItem(),
            ),
            SliverToBoxAdapter(
              child: MostSeeItem(),
            ),
          ],
        ),
      ),
    );
  }
}
