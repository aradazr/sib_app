// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sib_app/Screens/home_page.dart';
import 'package:sib_app/Screens/product_details_page.dart';
import 'package:sib_app/constans/custom_clip.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/product.dart';
import 'package:sib_app/widgets/cached_image.dart';

class ProductItem extends StatelessWidget {

  Product product;
  ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailsPage(),
            ),
          );
        },
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
                        SizedBox(
                          height: 11.h,
                          
                          child: CachedImage(
                            fit: BoxFit.cover,
                           imageUrl: product.thumbnail,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 37),
                          child: Text(
                            product.name,
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
                        height: 4.2.h,
                        width: 4.87.w,
                        decoration: BoxDecoration(
                            color: LightColors.discountContainer),
                        child: RotatedBox(
                            quarterTurns: -1, // 1 یعنی چرخش 90 درجه,
            
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                '% ${product.persent!.round().toString()}',
                                style: TextStyle(
                                    color: LightColors
                                        .mostSellItemBottomContainer,
                                    fontSize: 13.sp,
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
                              product.price.toString(),
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
                              product.realPrice.toString(),
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
      ),
    );
  }
}
