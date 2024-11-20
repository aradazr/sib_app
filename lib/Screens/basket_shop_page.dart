import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/bloc/basket/bloc/basket_bloc.dart';
import 'package:sib_app/bloc/basket/bloc/basket_state.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/card_item.dart';
import 'package:sib_app/main.dart';
import 'package:sib_app/widgets/my_app_bar.dart';
import 'package:sib_app/widgets/product_in_shopping_basket.dart';

class BasketShopPage extends StatelessWidget {
  BasketShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<BasketItem>('CardBox');
    return Scaffold(
      backgroundColor: LightColors.homePageBackground,
      body: SafeArea(
        child: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: MyAppBar(
                          appBarTitle: 'سبد خرید',
                          mainAxisAlignment: MainAxisAlignment.center,
                          leftIcon: '',
                          showLeftIcon: false,
                          fontFamily: 'shbold',
                          textPadding: EdgeInsets.all(0),
                          rightIcon: '',
                          showRightIcon: false),
                    ),
                    if (state is BasketDataFetchedState) ...{
                      state.basketItemList.fold((l) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text(l),
                          ),
                        );
                      }, (basketItemList) {
                        return SliverPadding(
                          padding: EdgeInsets.only(bottom: 90),
                          sliver: SliverGrid(
                            delegate: SliverChildBuilderDelegate(
                              childCount: basketItemList.length,
                              (context, index) {
                                return ProductInShoppingBasket(
                                  basketItemList[index],
                                );
                              },
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 3 / 1.5),
                          ),
                        );
                      }),
                    }
                  ],
                ),
                if(state is BasketDataFetchedState)...{
                  Positioned(
                  bottom: 17,
                  child: Container(
                    alignment: Alignment.center,
                    height: 6.04.h,
                    width: 75.38.w,
                    decoration: BoxDecoration(
                        color: LightColors.showPriceInsideContainer,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: const Color.fromARGB(106, 255, 255, 255),
                              blurRadius: 19,
                              offset: Offset(0, 0))
                        ]),
                    child: Text( 
                      state.basketFinalPrice == 0 ? 'سبد خرید خالی است' :
                      '${state.basketFinalPrice}  :مجموع',
                      style: TextStyle(
                        fontFamily: 'shbold',
                        fontSize: 17.sp,
                        color: LightColors.categoryText,
                      ),
                    ),
                  ),
                )
                }
              ],
            );
          },
        ),
      ),
    );
  }
}
