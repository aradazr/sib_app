import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/banner.dart';
import 'package:sib_app/widgets/cached_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatelessWidget {
   BannerSlider({
    super.key,
    required this.controller,
    required this.bannersList,
  });

  final PageController controller;
  final List<BannerCampain> bannersList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 25.h,
          child: PageView.builder(
            controller: controller,
            itemCount: bannersList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
                child: CachedImage(
                  radius: 20,
                  imageUrl: bannersList[index].thumbnail,),
              );
            },
          ),
        ),
        Positioned(
          bottom: 24,
          child: SmoothPageIndicator(
    
            controller: controller,
            textDirection: TextDirection.rtl,
            count: 3,
            axisDirection: Axis.horizontal,
            
            effect: ExpandingDotsEffect(
              dotHeight: 0.8.h,
              dotWidth:1.6.w,
              expansionFactor: 4.2,
              spacing: 4,
    
              activeDotColor: LightColors.indicatorActive,
              dotColor: LightColors.indicatorNotActive
            ),
          ),
        )
      ],
    );
  }
}