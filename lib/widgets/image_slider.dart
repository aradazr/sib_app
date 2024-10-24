import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 25.h,
          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                    left: 20, right: 20, top: 24, bottom: 10),
                width: 25.w,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30)),
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