import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/basket_shop_page.dart';
import 'package:sib_app/bloc/basket/bloc/basket_bloc.dart';
import 'package:sib_app/bloc/basket/bloc/basket_event.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/card_item.dart';
import 'package:sib_app/utils/extension/double_parsing.dart';
import 'package:sib_app/utils/extension/string_extension.dart';
import 'package:sib_app/widgets/cached_image.dart';

class ProductInShoppingBasket extends StatelessWidget {
  BasketItem basketItem;
   ProductInShoppingBasket(
    this.basketItem,
    {
      required this.index,
    super.key,
  });
final int index;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 20),
      width: 87.17.w,
      height: 20.02.h,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              offset: Offset(0, 4),
              color: const Color.fromARGB(78, 255, 255, 255),
            )
          ],
          color: LightColors.mostSellItemUpperContainer,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 17, right: 24),
                child: Text(
                 basketItem.name,
                  style: TextStyle(
                      fontFamily: 'shbold',
                      fontSize: 17.sp,
                      color: LightColors.categoryText),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 24),
                child: Text(
                  'گارانتی 18 ماه مدیا پردازش',
                  style: TextStyle(
                      fontFamily: 'shmid',
                      fontSize: 14.sp,
                      color: LightColors.categoryText),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, right: 24),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      alignment: Alignment.center,
                      height: 2.h,
                      width: 6.w,
                      decoration: BoxDecoration(
                          color: LightColors.discountContainer,
                          borderRadius: BorderRadius.circular(7.5)),
                      child: Text(
                        '%۳',
                        style: TextStyle(
                            fontFamily: 'shbold',
                            fontSize: 13.sp,
                            color: LightColors.categoryText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: Text(
                        'تومان',
                        style: TextStyle(
                            fontFamily: 'shmid',
                            fontSize: 17.sp,
                            color: LightColors.categoryText),
                      ),
                    ),
                    Text(
                      basketItem.realPrice!.formatPrice() ,
                      style: TextStyle(
                          fontFamily: 'shmid',
                          fontSize: 17.sp,
                          color: LightColors.categoryText),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, top: 7),
                child: Row(
                  children: [
                    ColorItemCheap(title: 'بنفش', color: '4287f5',),
                    Container(
                      alignment: Alignment.center,
                      width: 24.1.w,
                      height: 2.84.h,
                      decoration: BoxDecoration(
                        color: LightColors.tomanColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          "۲۵۶ گیگابایت",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: LightColors.categoryText,
                              fontFamily: 'shmid'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6, right: 24),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<BasketBloc>().add(BasketRemoveProductEvent(index));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 11.79.w,
                        height: 2.84.h,
                        decoration: BoxDecoration(
                          color: LightColors.tomanColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/trash.png',
                          height: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, left: 2),
                      child: Container(
                        alignment: Alignment.center,
                        width: 11.79.w,
                        height: 2.84.h,
                        decoration: BoxDecoration(
                          color: LightColors.tomanColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          'assets/images/blue_heart.png',
                          height: 17,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 24.1.w,
                      height: 2.84.h,
                      decoration: BoxDecoration(
                        color: LightColors.tomanColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/minus.png',
                            height: 22,
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: LightColors.categoryText,
                                fontFamily: 'shmid'),
                          ),
                          Image.asset(
                            'assets/images/plus.png',
                            height: 22,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: 
            SizedBox(
              height: 100,
              child: CachedImage(
                
                imageUrl: basketItem.thumbnail,
              ),
            )
            // Image.asset(
            //   'assets/images/piphone.png',
            //   height: 111,
            // ),
          ),
        ],
      ),
    );
  }
}

class ColorItemCheap extends StatelessWidget {
  
  String title;
  String? color;
   ColorItemCheap({
    required this.title,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 24.1.w,
      height: 2.84.h,
      decoration: BoxDecoration(
        color: LightColors.tomanColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 13.sp,
                color: LightColors.categoryText,
                fontFamily: 'shmid'),
          ),
          if(color != null)...{
              Container(
            margin: EdgeInsets.only(left: 19, right: 8),
            alignment: Alignment.center,
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color.parseToColor()),
          ),
          }
        ],
      ),
    );
  }
}


