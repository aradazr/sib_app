import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/basket_shop_page.dart';
import 'package:sib_app/Screens/category_page.dart';
import 'package:sib_app/Screens/home_page.dart';
import 'package:sib_app/Screens/login_page.dart';
import 'package:sib_app/Screens/most_sell_page.dart';
import 'package:sib_app/Screens/my_profile_page.dart';
import 'package:sib_app/Screens/product_details_page.dart';
import 'package:sib_app/bloc/authentication/auth_bloc.dart';
import 'package:sib_app/bloc/banner/home/home_bloc.dart';
import 'package:sib_app/bloc/banner/home/home_event.dart';
import 'package:sib_app/bloc/basket/bloc/basket_bloc.dart';
import 'package:sib_app/bloc/basket/bloc/basket_event.dart';
import 'package:sib_app/bloc/category/bloc/category_bloc.dart';
import 'package:sib_app/di/2di.dart';



class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
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
            bottomNavigationBar: PersistentTabView(
              bottomScreenMargin: 70,

              navBarStyle: NavBarStyle.style9,
              decoration: NavBarDecoration(
                colorBehindNavBar: Colors.transparent,
                useBackdropFilter: false,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              context,
              controller: _controller,
              screens: _buildScreens(),
              items: _navBarsItems(),
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardAppears: true,

              backgroundColor: Colors.grey.shade900,

              isVisible: true,
              animationSettings: const NavBarAnimationSettings(
                navBarItemAnimation: ItemAnimationSettings(
                  // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimationSettings(
                  // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  duration: Duration(milliseconds: 200),
                  screenTransitionAnimationType:
                      ScreenTransitionAnimationType.fadeIn,
                ),
              ),
              confineToSafeArea: false,
              navBarHeight: 70,
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildScreens() {
  return [
    MyProfilePage(),
    
    BlocProvider(
      create: (context) {
        var bloc = locator.get<BasketBloc>();
        bloc.add(BasketFetchFromHiveEvent());
        return bloc;
      },
      child: BasketShopPage(),
    ),
    BlocProvider(
      create: (context) => CategoryBloc(),
      child: CategoryPage(),
    ),
    BlocProvider(
      create: (context) {
        var bloc = HomeBloc();
        bloc.add(HomeGetInitilzeData());
        return bloc;
      },
      child: HomePage(),
    ),
    
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
