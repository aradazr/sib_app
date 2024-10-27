import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/home_page.dart';
import 'package:sib_app/constans/custom_clip.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/product.dart';
import 'package:sib_app/widgets/product_item.dart';

class MostSeeItem extends StatelessWidget {
  final List<Product> productList;
  const MostSeeItem({
    super.key, required this.productList,
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
            itemCount: productList.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductItem(product: productList[index]);
            },
          ),
        )
      ],
    );
  }
}