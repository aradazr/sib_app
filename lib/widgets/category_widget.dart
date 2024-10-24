import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/my_colors.dart';

class CategoryWidgwt extends StatelessWidget {
  const CategoryWidgwt({
    super.key,
  });

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
                'دسته بندی',
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
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
               return Column(
                 children: [
                   Container(
                        padding: EdgeInsets.all(15),
                      width: 14.3.w,
                      decoration: ShapeDecoration(
                        shadows: [
                          BoxShadow(
                              color: LightColors.categoryShadow,
                              blurRadius: 6,
                              offset: Offset(0, 0))
                        ],
                        color: LightColors.categoryBackground,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 7
                        
                      ),
                      child: Image.asset('assets/images/mobile.png'),
                      ),
                      SizedBox(height: 1.2.h,),
                      Text('آیفون',style: TextStyle(color: LightColors.categoryText,fontFamily: 'shmid'),)
                 ],
               );
              // return Stack(
                
              //   alignment: Alignment.center,
              //    children: [
              //     Container(
                    
              //     width: 14.3.w,
              //     decoration: ShapeDecoration(
              //       shadows: [
              //         BoxShadow(
              //             color: LightColors.categoryShadow,
              //             blurRadius: 6,
              //             offset: Offset(0, 0))
              //       ],
              //       color: LightColors.categoryBackground,
              //       shape: ContinuousRectangleBorder(
              //         borderRadius: BorderRadius.circular(50),
              //       ),
              //     ),
              //     margin: EdgeInsets.symmetric(
              //       horizontal: 7
                    
              //     ),
                  
              //     ),
              //     Image.asset('assets/images/mobile.png',height: 26,)
              //    ],
              // );
            },
          ),
        )
      ],
    );
  }
}