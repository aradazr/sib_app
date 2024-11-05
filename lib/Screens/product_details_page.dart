// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:sib_app/bloc/product/bloc/product_bloc.dart';
import 'package:sib_app/bloc/product/bloc/product_event.dart';
import 'package:sib_app/bloc/product/bloc/product_state.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/product.dart';
import 'package:sib_app/data/model/product_image.dart';
import 'package:sib_app/data/model/product_varient.dart';
import 'package:sib_app/data/model/varient.dart';
import 'package:sib_app/data/model/varient_type.dart';
import 'package:sib_app/data/repository/product_detail_repository.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/main.dart';
import 'package:sib_app/widgets/cached_image.dart';

class ProductDetailsPage extends StatefulWidget {
  Product? product;
  ProductDetailsPage({
    Key? key,
     this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(ProductInitializeEvent(widget.product!.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
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
                      child: Image.asset(
                        'assets/images/aaaa.png',
                        height: 620,
                        fit: BoxFit.fill,
                      )),
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
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment:  MainAxisAlignment.center,
                      children: [
                        if (state is ProductDetailLoadingState) ...{
                          Center(
                            child: CircularProgressIndicator(),
                          ),
                        },
                        SizedBox(
                          height: 11.h,
                        ),
                        if (state is ProductDetailResponseState) ...{
                          state.productImages.fold(
                            (l) {
                              return Text(l);
                            },
                            (productImageList) {
                              return GallaryWidget(
                                defaultProductThumbnail: widget.product!.thumbnail,
                                productImageList: productImageList,

                              );
                            },
                          )
                        },
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
                        if (state is ProductDetailResponseState) ...{
                          state.productVariant.fold(
                            (l) {
                              return Text(l);
                            },
                            (productVariantList) {
                              return VariantContainerGeneraitor(
                                  productVariantList: productVariantList);
                            },
                          )
                        },
                    
                        //!11111111111111111111111111111111
                    
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 25, right: 17, top: 20),
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
                          padding:
                              const EdgeInsets.only(left: 25, right: 17, top: 20),
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
                          padding:
                              const EdgeInsets.only(left: 25, right: 17, top: 20),
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
                          height: 19.h,
                        ),
                        
                      ],
                    ),
                  ),
                ),
                
                Positioned(
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 8.41.h,
                    width: 100.w,
                    decoration:
                        BoxDecoration(color: LightColors.showPriceContainer),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                '۱۶٬۳۵۰٬۰۰۰ تومان',
                                style: TextStyle(
                                    fontFamily: 'shmid',
                                    fontSize: 16.sp,
                                    color: LightColors.categoryText),
                              ),
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
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decorationThickness: 3),
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
                                      borderRadius: BorderRadius.circular(7.5)),
                                  child: Text(
                                    '%۳',
                                    style: TextStyle(
                                        fontFamily: 'shbold',
                                        fontSize: 13.sp,
                                        color: LightColors.categoryText),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 4.85.h,
                            width: 28.w,
                            decoration: BoxDecoration(
                                color: LightColors.showPriceInsideContainer,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'اضافه به سبد',
                              style: TextStyle(
                                  fontFamily: 'shmid',
                                  fontSize: 15.sp,
                                  color: LightColors.categoryText),
                            ),
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
      },
    );
  }
}

class VariantContainerGeneraitor extends StatelessWidget {
  List<ProductVariant> productVariantList;
  VariantContainerGeneraitor({super.key, required this.productVariantList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(var productVariant in productVariantList)...{
         if(productVariant.variantList.isNotEmpty)...{
              VariantGeneratorChild(productVariant: productVariant),
         }
        }
      ],
    );
  }
}
class VariantGeneratorChild extends StatelessWidget {
  ProductVariant productVariant;
  VariantGeneratorChild({
    Key? key,
    required this.productVariant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 17, bottom: 12),
          child: Text(
            productVariant.variantType.title!,
            style: TextStyle(
                fontFamily: 'shbold',
                fontSize: 17.sp,
                color: LightColors.categoryText),
          ),
        ),
        if(productVariant.variantType.type == VariantTypeEnum.COLOR)...{
         ColorVariantList(variantList: productVariant.variantList),
        },
        if(productVariant.variantType.type == VariantTypeEnum.STORAGE)...{
         StorageVariantList(storageVariants: productVariant.variantList),
        }
         
        
      ],
    );
  }
}

class GallaryWidget extends StatefulWidget {
  List<ProductImage> productImageList;
  String defaultProductThumbnail;
  
  GallaryWidget({
    Key? key,
    required this.productImageList,
    required this.defaultProductThumbnail,
  }) : super(key: key);

  @override
  State<GallaryWidget> createState() => _GallaryWidgetState();
}

class _GallaryWidgetState extends State<GallaryWidget> {
  int seleectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 3.h,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 95, right: 95, bottom: 24),
            child: SizedBox(
              height: 150,
              child: CachedImage(
                imageUrl: (widget.productImageList.isEmpty) ? widget.defaultProductThumbnail : widget.productImageList[seleectedItem].imageUrl,
              ),
            )),
        if(widget.productImageList.isNotEmpty)...{
          SizedBox(
          height: 11.2.h,
          width: 100.w,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 90, right: 90),
            scrollDirection: Axis.horizontal,
            itemCount: widget.productImageList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    seleectedItem = index;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  width: 24.3.w,
                  height: 11.2.h,
                  decoration: BoxDecoration(
                    color: LightColors.productMorePhotosBackGround,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(
                      color: LightColors.tomanColor,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CachedImage(
                        imageUrl: widget.productImageList[index].imageUrl,
                        fit: BoxFit.contain,
                      )),
                ),
              );
            },
          ),
        ),

        }
      ],
    );
  }
}

class ColorVariantList extends StatefulWidget {
  List<Variant> variantList;

  ColorVariantList({
    Key? key,
    required this.variantList,
  }) : super(key: key);

  @override
  State<ColorVariantList> createState() => _ColorVariantListState();
}

class _ColorVariantListState extends State<ColorVariantList> {
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 4.h,
        width: 100.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.variantList.length,
          itemBuilder: (context, index) {
            String categoryColor = 'ff${widget.variantList[index].value}';

      int hexColor = int.parse(categoryColor, radix: 16);
            return Padding(
        padding: const EdgeInsets.only(right: 0),
        child: GestureDetector(
          onTap: () {
            
            setState(() {
              selectedColor = index;  
            });
          },
          child: Container(
            margin: EdgeInsets.only(right: 10),
            height: 4.h,
            width: 8.w,
            decoration: BoxDecoration(
              border: (selectedColor == index) ? Border.all(color:  Colors.white, width: 2,strokeAlign: BorderSide.strokeAlignOutside):
              Border.all(color:  Colors.white, width: 0,strokeAlign: BorderSide.strokeAlignOutside),
              color: Color(hexColor),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      );
          },
        ),
      ),
    );
  }
}

class StorageVariantList extends StatefulWidget {

  List<Variant> storageVariants;
  
  StorageVariantList({
    Key? key,
    required this.storageVariants,
  }) : super(key: key);

  @override
  State<StorageVariantList> createState() => _StorageVariantListState();
}

class _StorageVariantListState extends State<StorageVariantList> {

 
  

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 4.h,
        width: 100.w,
        child: ListView.builder(
          
          scrollDirection: Axis.horizontal,
          itemCount: widget.storageVariants.length,
          itemBuilder: (context, index) {
            return Container(
        
        
        height: 4.h,
        width: 8.w,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(widget.storageVariants[index].value!,style: TextStyle(color: Colors.white),),
      );
          },
        ),
      ),
    );
  }
}
