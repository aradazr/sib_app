import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/widgets/category_itemchip_widget.dart';

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