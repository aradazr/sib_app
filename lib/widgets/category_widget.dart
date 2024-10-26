// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/widgets/cached_image.dart';

class CategoryItemChip extends StatelessWidget {
  Category categorys;
   CategoryItemChip({
    Key? key,
    required this.categorys,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String categoryColor = 'ff${categorys.color}';
    int hexColor = int.parse(categoryColor, radix: 16);
    return Column(
      children: [
        Container(
             padding: EdgeInsets.all(15),
           width: 14.3.w,
           decoration: ShapeDecoration(
             shadows: [
               BoxShadow(
                   color: Color(hexColor),
                   blurRadius: 6,
                   offset: Offset(0, 0))
             ],
             color: Color(hexColor),
             shape: ContinuousRectangleBorder(
               borderRadius: BorderRadius.circular(50),
             ),
           ),
           margin: EdgeInsets.symmetric(
             horizontal: 7,
             vertical: 3
             
           ),
           child: SizedBox(
            height:28,
             child: CachedImage(
              fit: BoxFit.contain,
               imageUrl: categorys.icon,
             
               ),
           )
             ,
           ),
           SizedBox(height: 1.2.h,),
           Text(categorys.title!,style: TextStyle(color: LightColors.categoryText,fontFamily: 'shmid'),)
      ],
    );
  }
}
