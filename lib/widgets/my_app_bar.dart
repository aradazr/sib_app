import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/my_colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.appBarTitle,
    required this.mainAxisAlignment,
    required this.leftIcon,
    required this.showLeftIcon,
    required this.fontFamily, required this.textPadding, required this.rightIcon, required this.showRightIcon,
    
  });

  final String appBarTitle;
  final MainAxisAlignment mainAxisAlignment;
  final String leftIcon;
  final String rightIcon;
  final String fontFamily;
  final EdgeInsets textPadding;
  
  final bool showLeftIcon;
  final bool showRightIcon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26, top: 25),
      child: Container(
        height: 6.04.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(31),
            color: LightColors.appBarColor),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (showLeftIcon)
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  leftIcon,
                  height: 25,
                ),
              ),
            Padding(
              padding: textPadding,
              child: Text(
                appBarTitle,
                style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: 16.sp,
                    color: LightColors.categoryText),
              ),
            ),
           if (showRightIcon)
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(rightIcon, height: 25),
            ),
          ],
        ),
      ),
    );
  }
}
