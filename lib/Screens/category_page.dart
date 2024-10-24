import 'package:flutter/material.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/widgets/my_app_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

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
            SliverPadding(
              padding: EdgeInsets.only(left: 25, right: 25, top: 20),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(16)),
                    );
                  },
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 21,
                  crossAxisSpacing: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
