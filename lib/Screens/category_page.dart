// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sib_app/bloc/category/bloc/category_bloc.dart';
import 'package:sib_app/bloc/category/bloc/category_event.dart';
import 'package:sib_app/bloc/category/bloc/category_state.dart';

import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/data/model/category.dart';
import 'package:sib_app/data/repository/category_repository.dart';
import 'package:sib_app/widgets/cached_image.dart';
import 'package:sib_app/widgets/my_app_bar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    BlocProvider.of<CategoryBloc>(context).add(CategoryRequestList());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: LightColors.homePageBackground,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: MyAppBar(
                appBarTitle: 'دسته بندی',
                mainAxisAlignment: MainAxisAlignment.center,
                leftIcon: '',
                showLeftIcon: false,
                fontFamily: 'shbold',
                textPadding: EdgeInsets.only(right: 0),
                rightIcon: '',
                showRightIcon: false,
              ),
            ),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator(),),
                  );
                }
                if (state is CategoryResponseState) {
                  return state.response.fold(
                    (l) {
                      return SliverToBoxAdapter(
                        child: Text(l),
                      );
                    },
                    (r) {
                      return ListCategory(list: r);
                    },
                  );
                }
                return SliverToBoxAdapter(
                  child: Text('errrroe'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ListCategory extends StatelessWidget {
  List<Category>? list;
  ListCategory({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 20),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: list?.length ?? 0,
          (context, index) {
            return CachedImage(
              imageUrl: list?[index].thumbnail,
            );
          },
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 21,
          crossAxisSpacing: 18,
        ),
      ),
    );
  }
}
