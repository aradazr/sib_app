// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/home_page.dart';
import 'package:sib_app/bloc/basket/bloc/basket_bloc.dart';
import 'package:sib_app/bloc/basket/bloc/basket_event.dart';
import 'package:sib_app/bloc/comment/bloc/comment_bloc.dart';

import 'package:sib_app/bloc/product/bloc/product_bloc.dart';
import 'package:sib_app/bloc/product/bloc/product_event.dart';
import 'package:sib_app/bloc/product/bloc/product_state.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/card_item.dart';
import 'package:sib_app/data/model/product.dart';
import 'package:sib_app/data/model/product_image.dart';
import 'package:sib_app/data/model/product_property.dart';
import 'package:sib_app/data/model/product_varient.dart';
import 'package:sib_app/data/model/varient.dart';
import 'package:sib_app/data/model/varient_type.dart';
import 'package:sib_app/data/repository/product_detail_repository.dart';
import 'package:sib_app/di/2di.dart';
import 'package:sib_app/main.dart';
import 'package:sib_app/utils/extension/double_parsing.dart';
import 'package:sib_app/widgets/cached_image.dart';
import 'package:sib_app/widgets/loading_circule_widget.dart';

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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        var bloc = ProductBloc();
        bloc.add(
          ProductInitializeEvent(
              widget.product!.id, widget.product!.categoryId),
        );
        return bloc;
      },
      child: DetailContentWidget(parentWidget: widget),
    );
  }
}

class DetailContentWidget extends StatelessWidget {
  const DetailContentWidget({
    super.key,
    required this.parentWidget,
  });

  final ProductDetailsPage parentWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.productPageBackground,
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                if (state is ProductDetailResponseState) ...{
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/empty_heart.png',
                          height: 27,
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          ),
                          child: Image.asset(
                            'assets/images/back.png',
                            height: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                },
                if (state is ProductDetailLoadingState) ...{
                  LoadingCirculeWidget(),
                },
                SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                defaultProductThumbnail:
                                    parentWidget.product!.thumbnail,
                                productImageList: productImageList,
                              );
                            },
                          )
                        },
                        if (state is ProductDetailResponseState) ...{
                          SizedBox(
                            height: 2.4.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              parentWidget.product!.name,
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
                        },

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

                        if (state is ProductDetailResponseState) ...{
                          state.productProperties.fold(
                            (l) {
                              return Text(l);
                            },
                            (propertyList) {
                              return ProductPropertys(propertyList);
                            },
                          )
                        },
                        if (state is ProductDetailResponseState) ...{
                          ProductDescription(parentWidget.product!.description),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 17, top: 20),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  isDismissible: true,
                                  useSafeArea: true,
                                  showDragHandle: true,
                                  
                                  context: context,
                                  builder: (context) {
                                    return BlocProvider(
                                      create: (context) {
                                        final bloc = CommentBloc(locator.get());
                                        bloc.add(CommentInitilzeEvent(
                                            parentWidget.product!.id));
                                        return bloc;
                                      },
                                      child: DraggableScrollableSheet(
                                        expand: true,
                                        initialChildSize: 1,
                                        minChildSize: 0.5,
                                        maxChildSize: 1,
                                        builder: (context, scrollController) {
                                          return CommentBottomSheet(
                                              parentWidget.product!.id,
                                              scrollController);
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          ),
                        },

                        SizedBox(
                          height: 19.h,
                        ),
                      ],
                    ),
                  ),
                ),
                if (state is ProductDetailResponseState) ...{
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
                                  parentWidget.product!.realPrice!
                                      .formatPrice(),
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
                                    parentWidget.product!.price.formatPrice(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: LightColors.categoryText,
                                        fontSize: 14.sp,
                                        fontFamily: 'shmid',
                                        decorationColor:
                                            LightColors.categoryText,
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
                                        borderRadius:
                                            BorderRadius.circular(7.5)),
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
                              context.read<ProductBloc>().add(
                                  ProductAddToBasket(parentWidget.product!));

                              context
                                  .read<BasketBloc>()
                                  .add(BasketFetchFromHiveEvent());
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
                }
              ],
            ),
          );
        },
      ),
    );
  }
}

class CommentBottomSheet extends StatelessWidget {
  CommentBottomSheet(
    this.productId,
    this.controller, {
    super.key,
  });
  ScrollController controller;
  final String productId;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                controller: controller,
                slivers: [
                  if (state is CommentLoading) ...{
                    SliverToBoxAdapter(
                      child: SpinKitCircle(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ),
                  },
                  if (state is CommentResponse) ...{
                    state.response.fold(
                      (l) {
                        return Text('error');
                      },
                      (commentList) {
                        if (commentList.isEmpty) {
                          return SliverToBoxAdapter(
                            child: Text('نظری ثبت نشده است'),
                          );
                        }
                        return SliverList(
                          delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.all(8),
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          commentList[index].username.isEmpty
                                              ? Directionality(
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  child: Text(
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    'کاربر:',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                  ),
                                                )
                                              : Text(
                                                  '${commentList[index].username}:',
                                                  textAlign: TextAlign.right,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                          Text(
                                            commentList[index].text,
                                            textAlign: TextAlign.right,
                                            textDirection: TextDirection.rtl,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }, childCount: commentList.length),
                        );
                      },
                    )
                  }
                ],
              ),
            ),
            Column(
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    child: TextField(
                      controller: textController,
                      style: TextStyle(
                        fontFamily: 'shmid',
                        fontSize: 17.sp,
                        color: LightColors.categoryText,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0xff2997FF),
                            )),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        filled: true,
                        labelText: 'نظر خود را بنویسید',
                        labelStyle: TextStyle(
                          fontFamily: 'shmid',
                          fontSize: 17.sp,
                          color: Color(0xff6E6E73),
                        ),
                        fillColor: Color.fromARGB(5, 255, 255, 255),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: LightColors.categoryText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<CommentBloc>().add(
                        CommentPostEvent(productId,textController.text));

                        textController.text = '';
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    alignment: Alignment.center,
                    height: 4.85.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                        color: LightColors.showPriceInsideContainer,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'ثبت نظر',
                      style: TextStyle(
                          fontFamily: 'shmid',
                          fontSize: 15.sp,
                          color: LightColors.categoryText),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

class ProductPropertys extends StatefulWidget {
  List<Property> productPropertyList;
  ProductPropertys(
    this.productPropertyList, {
    Key? key,
  }) : super(key: key);

  @override
  State<ProductPropertys> createState() => _ProductPropertysState();
}

class _ProductPropertysState extends State<ProductPropertys> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 17, top: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
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
          Visibility(
            visible: isExpanded,
            child: SizedBox(
              height: 4.h,
            ),
          ),
          Visibility(
            visible: isExpanded,
            child: Container(
              height: 60.h,
              width: 80.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 1)),
              child: SizedBox(
                height: 40.h,
                width: 80,
                child: ListView.builder(
                  itemCount: widget.productPropertyList.length,
                  itemBuilder: (context, index) {
                    var property = widget.productPropertyList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${property.value!} : ${property.title!}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'sh',
                            fontSize: 14,
                            height: 1.8,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductDescription extends StatefulWidget {
  final String productDescription;
  const ProductDescription(
    this.productDescription, {
    super.key,
  });

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 17, top: 20),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
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
          Visibility(
            visible: isExpanded,
            child: SizedBox(
              height: 4.h,
            ),
          ),
          Visibility(
            visible: isExpanded,
            child: Container(
              height: 60.h,
              width: 80.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.productDescription,
                  style: TextStyle(
                      fontFamily: 'sh',
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.white),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
          )
        ],
      ),
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
        for (var productVariant in productVariantList) ...{
          if (productVariant.variantList.isNotEmpty) ...{
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
          padding: EdgeInsets.only(right: 17, bottom: 11),
          child: Text(
            productVariant.variantType.title!,
            style: TextStyle(
                fontFamily: 'shbold',
                fontSize: 17.sp,
                color: LightColors.categoryText),
          ),
        ),
        if (productVariant.variantType.type == VariantTypeEnum.COLOR) ...{
          ColorVariantList(variantList: productVariant.variantList),
          SizedBox(
            height: 2.h,
          )
        },
        if (productVariant.variantType.type == VariantTypeEnum.STORAGE) ...{
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
                imageUrl: (widget.productImageList.isEmpty)
                    ? widget.defaultProductThumbnail
                    : widget.productImageList[seleectedItem].imageUrl,
              ),
            )),
        if (widget.productImageList.isNotEmpty) ...{
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
                    border: (selectedColor == index)
                        ? Border.all(
                            color: Colors.white,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignOutside)
                        : Border.all(
                            color: Colors.transparent,
                            width: 0,
                            strokeAlign: BorderSide.strokeAlignOutside),
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
  int selectedStorage = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 3.2.h,
        width: 100.w,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.storageVariants.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedStorage = index;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                alignment: Alignment.center,
                height: 2.h,
                width: 13.w,
                decoration: BoxDecoration(
                  border: (selectedStorage == index)
                      ? Border.all(
                          color: Colors.blue,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside)
                      : Border.all(
                          color: Colors.transparent,
                          width: 0,
                          strokeAlign: BorderSide.strokeAlignOutside),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.storageVariants[index].value!,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
