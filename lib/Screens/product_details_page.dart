import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/repository/product_detail_repository.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/main.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.productPageBackground,
      body: SafeArea(
        child: Stack(
          
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              
              bottom: 0,
              child: SizedBox(
                width: 100.w,
                child: Image.asset('assets/images/aaaa.png', height: 700,fit: BoxFit.fill,)),
            ),
            Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 27, vertical: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/empty_heart.png',
                          height: 27,
                        ),
                        Image.asset(
                          'assets/images/back.png',
                          height: 27,
                        ),
                      ],
                    ),
                  ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 154,right: 154,bottom: 24),
                    child: Image.asset(
                      'assets/images/blue_iphone.png',
                      height: 209,
                    ),
                  ),
                  SizedBox(
                    height: 11.2.h,
                    width: 100.w,
                    child: ListView.builder(
                      
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 7),
                          width: 24.3.w,
                          height: 11.2.h,
                          decoration: BoxDecoration(
                            color: LightColors.productMorePhotosBackGround,
                            borderRadius: BorderRadius.circular(13),
                            border: Border.all(
                                color: LightColors.tomanColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Image.asset(
                              'assets/images/blue_iphone.png',
                            ),
                          ),
                        );
                      
                    },),
                  ),
                  SizedBox(
                    height: 2.4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: Text(
                      'LLA Not Active آیفون ۱۳ پرومکس دوسیم کارت مدل ',
                      style: TextStyle(
                          fontFamily: 'shbold',
                          fontSize: 16.sp,
                          color: LightColors.categoryText),
                    ),
                  ),
                  SizedBox(
                    height: 1.4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '4.3',
                          style: TextStyle(
                              fontFamily: 'shbold',
                              fontSize: 15.sp,
                              color: LightColors.categoryText),
                        ),
                        SizedBox(
                          width: 1.1.w,
                        ),
                        Image.asset(
                          'assets/images/star.png',
                          height: 15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.4.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17, bottom: 12),
                    child: Text(
                      'رنگ',
                      style: TextStyle(
                          fontFamily: 'shbold',
                          fontSize: 17.sp,
                          color: LightColors.categoryText),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 1.9.h,
                          width: 4.1.w,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(
                          width: 1.1.w,
                        ),
                        Container(
                          height: 1.9.h,
                          width: 4.1.w,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        SizedBox(
                          width: 1.1.w,
                        ),
                        Container(
                          height: 1.9.h,
                          width: 4.1.w,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17, top: 19),
                    child: Text(
                      'حافظه داخلی',
                      style: TextStyle(
                          fontFamily: 'shbold',
                          fontSize: 17.sp,
                          color: LightColors.categoryText),
                    ),
                  ),
                  PopupMenuButton(
                    padding: EdgeInsets.only(right: 17),
                    offset: const Offset(-80, 10),
                    color: Colors.white,
                    icon: Container(
                        height: 3.31.h,
                        width: 27.43.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: LightColors.categoryText,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          color: LightColors.tomanColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/arrow_down.png',
                              height: 14,
                            ),
                            Text(
                              '۱۲۸ گیگ',
                              style: TextStyle(
                                  fontFamily: 'shmid',
                                  fontSize: 14.sp,
                                  color: LightColors.categoryText),
                            )
                          ],
                        )),
                    itemBuilder: (context) {
                      return <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          labelTextStyle: WidgetStatePropertyAll(TextStyle()),
                          height: 40,
                          value: 'delete_all',
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'گیگ 128',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: LightColors.tomanColor,
                                fontFamily: 'shmid',
                              ),
                            ),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          height: 40,
                          value: 'delete_all',
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.center,
                              'گیگ 256',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'shmid',
                              ),
                            ),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          height: 40,
                          value: 'delete_all',
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.center,
                              'گیگ 512',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'shmid',
                              ),
                            ),
                          ),
                        ),
                        PopupMenuItem<String>(
                          height: 40,
                          value: 'delete_all',
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              textAlign: TextAlign.center,
                              'ترابایت 1',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'shmid',
                              ),
                            ),
                          ),
                        ),
                      ];
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 17, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/double_arrow_left.png',
                          height: 12,
                        ),
                        Text(
                          'مشخصات فنی',
                          style: TextStyle(
                            fontFamily: 'sh',
                            color: LightColors.categoryText,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 17, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/double_arrow_left.png',
                          height: 12,
                        ),
                        Text(
                          'توضیحات محصول',
                          style: TextStyle(
                            fontFamily: 'sh',
                            color: LightColors.categoryText,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 17, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/double_arrow_left.png',
                          height: 12,
                        ),
                        Text(
                          'نظرات کاربران',
                          style: TextStyle(
                            fontFamily: 'sh',
                            color: LightColors.categoryText,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 9.h,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.center,
                height: 8.41.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: LightColors.showPriceContainer
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text('۱۶٬۳۵۰٬۰۰۰ تومان', style: TextStyle(
                            fontFamily: 'shmid',
                            fontSize: 16.sp,
                            color: LightColors.categoryText
                          )
                          ,),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                       Row(
                        children: [
                          Text(
                            
                            '۱۷٬۸۰۰٬۰۰۰',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: LightColors.categoryText,
                              fontSize: 14.sp,
                              fontFamily: 'shmid',
                              decorationColor: LightColors.categoryText,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: 3

                            ),
                          ),
                          SizedBox(
                          width: 1.4.w,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 2.h,
                            width: 6.w,
                            decoration: BoxDecoration(
                              color: LightColors.discountContainer,
                              borderRadius: BorderRadius.circular(7.5)
                              ),
                              child: Text('%۳',style: TextStyle(
                                fontFamily: 'shbold',
                                fontSize: 13.sp,
                                color: LightColors.categoryText
                              ),),
                          )
                        ],
                       )
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        IDetailProductRepository repository = locator.get();
                        var response = await repository.getProuctImage();
                        response.fold((l) {
                          
                        }, (r) {
                          r.forEach((element) {
                            print(element.imageUrl);
                          },);
                        },);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 4.85.h,
                        width: 28.w,
                        decoration: BoxDecoration(
                          color: LightColors.showPriceInsideContainer,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text('اضافه به سبد',style: TextStyle(
                          fontFamily: 'shmid',
                          fontSize: 15.sp,
                          color: LightColors.categoryText
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
