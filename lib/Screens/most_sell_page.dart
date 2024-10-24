import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/custom_clip.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/widgets/my_app_bar.dart';

class MostSellPage extends StatelessWidget {
  const MostSellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.homePageBackground,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: MyAppBar(
                appBarTitle: 'پر فروش ترین ها',
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                leftIcon: 'assets/images/filter.png',
                rightIcon: 'assets/images/back.png',
                showRightIcon: true,
                showLeftIcon: true,
                fontFamily: 'shbold',
                textPadding: EdgeInsets.only(right: 0),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 25,right: 25,top: 20),
              sliver: SliverGrid(

                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) {
                    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                     mainAxisSpacing: 21,
                      crossAxisSpacing: 18,
                      childAspectRatio: 2 / 2.59
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
