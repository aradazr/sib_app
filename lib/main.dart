import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/basket_shop_page.dart';
import 'package:sib_app/Screens/category_page.dart';
import 'package:sib_app/Screens/home_page.dart';
import 'package:sib_app/Screens/login_page.dart';
import 'package:sib_app/Screens/most_sell_page.dart';
import 'package:sib_app/Screens/my_profile_page.dart';
import 'package:sib_app/Screens/product_details.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/di/2di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sib App',
        home: SafeArea(
          child: Scaffold(
            extendBody: true,
            body: LoginPage(),
            // bottomNavigationBar: PersistentTabView(
            //   bottomScreenMargin: 70,

            //   navBarStyle: NavBarStyle.style9,
            //   decoration: NavBarDecoration(
            //     colorBehindNavBar: Colors.transparent,
            //     useBackdropFilter: false,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(0),
            //       topRight: Radius.circular(0),
            //     ),
            //   ),
            //   context,
            //   controller: _controller,
            //   screens: _buildScreens(),
            //   items: _navBarsItems(),
            //   handleAndroidBackButtonPress: true, // Default is true.
            //   resizeToAvoidBottomInset:
            //       true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
            //   stateManagement: true, // Default is true.
            //   hideNavigationBarWhenKeyboardAppears: true,

            //   backgroundColor: Colors.grey.shade900,

            //   isVisible: true,
            //   animationSettings: const NavBarAnimationSettings(
            //     navBarItemAnimation: ItemAnimationSettings(
            //       // Navigation Bar's items animation properties.
            //       duration: Duration(milliseconds: 400),
            //       curve: Curves.ease,
            //     ),
            //     screenTransitionAnimation: ScreenTransitionAnimationSettings(
            //       // Screen transition animation on change of selected tab.
            //       animateTabTransition: true,
            //       duration: Duration(milliseconds: 200),
            //       screenTransitionAnimationType:
            //           ScreenTransitionAnimationType.fadeIn,
            //     ),
            //   ),
            //   confineToSafeArea: false,
            //   navBarHeight: 70,
            // ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    MyProfilePage(),
    BasketShopPage(),
    CategoryPage(),
    HomePage(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Image.asset(
        "assets/images/user_active.png",
        height: 20,
      ),
      title: ("حساب من"),
      inactiveIcon: Image.asset(
        "assets/images/user.png",
        height: 20,
      ),
      textStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'shbold',
      ),
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => HomePage(),
          "/second": (final context) => CategoryPage(),
        },
      ),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(
        "assets/images/shopBasket_active.png",
        height: 20,
      ),
      title: ("سبد خرید"),
      inactiveIcon: Image.asset(
        "assets/images/shopBasket.png",
        height: 20,
      ),
      textStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'shbold',
      ),
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => HomePage(),
          "/second": (final context) => CategoryPage(),
        },
      ),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(
        "assets/images/category_active.png",
        height: 20,
      ),
      title: ("دسته بندی"),
      inactiveIcon: Image.asset(
        "assets/images/category.png",
        height: 20,
      ),
      textStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'shbold',
      ),
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => HomePage(),
          "/second": (final context) => CategoryPage(),
        },
      ),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(
        "assets/images/home_active.png",
        height: 20,
      ),
      title: ("خانه"),
      inactiveIcon: Image.asset(
        "assets/images/home.png",
        height: 20,
      ),
      textStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'shbold',
      ),
      routeAndNavigatorSettings: RouteAndNavigatorSettings(
        initialRoute: "/",
        routes: {
          "/first": (final context) => HomePage(),
          "/second": (final context) => CategoryPage(),
        },
      ),
    ),
  ];
}
