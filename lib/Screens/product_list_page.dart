import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/bloc/categoryProduct/bloc/category_product_bloc.dart';
import 'package:sib_app/bloc/categoryProduct/bloc/category_product_event.dart';
import 'package:sib_app/bloc/categoryProduct/bloc/category_product_state.dart';
import 'package:sib_app/constans/custom_clip.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/widgets/my_app_bar.dart';
import 'package:sib_app/widgets/product_item.dart';

class ProductListPage extends StatefulWidget {
  Category category;
  ProductListPage(this.category, {super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    BlocProvider.of<CategoryProductBloc>(context).add(
      CategoryProductInitialize(widget.category.id!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<CategoryProductBloc, CategoryProductState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: LightColors.homePageBackground,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: MyAppBar(
                    appBarTitle: widget.category.title ?? 'محصولات',
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    leftIcon: 'assets/images/filter.png',
                    rightIcon: 'assets/images/back.png',
                    showRightIcon: true,
                    showLeftIcon: true,
                    fontFamily: 'shbold',
                    textPadding: EdgeInsets.only(right: 0),
                  ),
                ),
                if (state is CategoryProductLoadingState) ...{
                  SliverToBoxAdapter(
                    child: Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                },
                if (state is CategoryProductResponseSuccessState) ...{
                  state.productListByCategory.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (productList) {
                      return SliverPadding(
                        padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            childCount: productList.length,
                            (context, index) {
                              return ProductItem(product: productList[index]);
                            },
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 21,
                                  crossAxisSpacing: 18,
                                  childAspectRatio: 2 / 2.59),
                        ),
                      );
                    },
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
