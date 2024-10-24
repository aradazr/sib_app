import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/home_page.dart';
import 'package:sib_app/constans/custom_clip.dart';
import 'package:sib_app/constans/my_colors.dart';

class MostSeeItem extends StatelessWidget {
  const MostSeeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1.5.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                'پر بازدید ترین ها',
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
          height: 25.57.h,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: 10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 5,right: 5 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 19.3.h,
                      width: 40.w,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 19.3.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              color: LightColors.mostSellItemUpperContainer,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 1.1.h,
                                ),
                                Image.asset(
                                  'assets/images/iphone13.png',
                                  height: 12.3.h,
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 37),
                                  child: Text(
                                    'آیفون ۱۳ پرومکس',
                                    style: TextStyle(
                                        fontFamily: 'shmid',
                                        fontSize: 15.sp,
                                        color: LightColors.productNameText),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 16,
                            child: ClipPath(
                              clipper: RPSCustomPainter(),
                              child: Container(
                                alignment: Alignment.center,
                                height: 4.5.h,
                                width: 4.87.w,
                                decoration: BoxDecoration(
                                    color: LightColors.discountContainer),
                                child: RotatedBox(
                                    quarterTurns: -1, // 1 یعنی چرخش 90 درجه,

                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        '%۳',
                                        style: TextStyle(
                                            color: LightColors
                                                .mostSellItemBottomContainer,
                                            fontSize: 14.sp,
                                            fontFamily: 'shmid'),
                                      ),
                                    )),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 6.27.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        color: LightColors.mostSellItemBottomContainer,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: SizedBox(
                        height: 6.27.h,
                        width: 40.w,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'تومان',
                                style: TextStyle(
                                  color: LightColors.tomanColor,
                                  fontFamily: 'shmid',
                                  fontSize: 14.sp,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '۴۶٬۰۰۰٬۰۰۰',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontFamily: 'shmid',
                                          fontSize: 13.sp,
                                          color:
                                              LightColors.productPreviousPrice),
                                    ),
                                    SizedBox(
                                      height: .2.h,
                                    ),
                                    Text(
                                      '۴۵٬۳۵۰٬۰۰۰',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'shmid',
                                          color: LightColors.tomanColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 23,
                                height: 24,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(44),
                                    bottomLeft: Radius.circular(44),
                                  ),
                                  color: Color(0xff2f2f2f),
                                ),
                                child: SizedBox(
                                    height: 2.h,
                                    child: Image.asset(
                                      'assets/images/arrow.png',
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}