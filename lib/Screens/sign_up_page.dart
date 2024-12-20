import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/dashboard_page.dart';
import 'package:sib_app/Screens/login_page.dart';
import 'package:sib_app/bloc/authentication/auth_bloc.dart';
import 'package:sib_app/bloc/authentication/auth_event.dart';
import 'package:sib_app/bloc/authentication/auth_state.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/main.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final userNameTextEditingController =
      TextEditingController(text: 'aradazar1381');
  final passwordTextEditingController = TextEditingController(text: '12345678');
  final passwordConfirmTextEditingController =
      TextEditingController(text: '12345678');
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: ViewContainerSignUp(
          userNameTextEditingController: userNameTextEditingController,
          passwordTextEditingController: passwordTextEditingController,
          passwordConfirmTextEditingController:
              passwordConfirmTextEditingController),
    );
  }
}

class ViewContainerSignUp extends StatelessWidget {
  const ViewContainerSignUp({
    super.key,
    required this.userNameTextEditingController,
    required this.passwordTextEditingController,
    required this.passwordConfirmTextEditingController,
  });

  final TextEditingController userNameTextEditingController;
  final TextEditingController passwordTextEditingController;
  final TextEditingController passwordConfirmTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: LightColors.homePageBackground,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100.w,
              ),
              SizedBox(
                height: 9.h,
              ),
              Image.asset(
                'assets/images/appleLogo.png',
                height: 26,
              ),
              SizedBox(
                height: .7.h,
              ),
              Text(
                'اکانت سیب اپ\n!خودت رو بساز',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'shbold',
                  fontSize: 25.sp,
                  color: LightColors.categoryText,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'یک اکانت سیب اپ کافیه تا به تمام\nمحصولات جذاب ما\n.دسترسی پیدا کنی و لذت ببری\n!همین الان اکانت داری؟',
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'shbold',
                  fontSize: 16.sp,
                  color: LightColors.categoryText,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => AuthBloc(),
                        child: LoginPage(),
                      ),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/linkArrow.png',
                      height: 13,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      'وارد شوید',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'shbold',
                        fontSize: 16.sp,
                        color: LightColors.seeAllText,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: TextStyle(
                      fontFamily: 'shmid',
                      fontSize: 17.sp,
                      color: LightColors.categoryText,
                    ),
                    controller: userNameTextEditingController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xff2997FF),
                          )),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      filled: true,
                      labelText: 'نام کاربری را وارد کنید',
                      labelStyle: TextStyle(
                        fontFamily: 'shmid',
                        fontSize: 15.sp,
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
              SizedBox(
                height: 1.7.h,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: TextStyle(
                      fontFamily: 'shmid',
                      fontSize: 17.sp,
                      color: LightColors.categoryText,
                    ),
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xff2997FF),
                          )),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      filled: true,
                      labelText: 'رمز خود را وارد کنید',
                      labelStyle: TextStyle(
                        fontFamily: 'shmid',
                        fontSize: 15.sp,
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
              SizedBox(
                height: 1.7.h,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    style: TextStyle(
                      fontFamily: 'shmid',
                      fontSize: 17.sp,
                      color: LightColors.categoryText,
                    ),
                    controller: passwordConfirmTextEditingController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Color(0xff2997FF),
                          )),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      filled: true,
                      labelText: 'تکرار رمز عبور',
                      labelStyle: TextStyle(
                        fontFamily: 'shmid',
                        fontSize: 15.sp,
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
              SizedBox(
                height: 2.1.h,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(13),
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 6.28.h,
                  width: 33.85.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 2,
                        offset: Offset(0, 0),
                        color: const Color.fromARGB(70, 255, 255, 255),
                      )
                    ],
                    color: LightColors.seeAllText,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthResponseState) {
                        state.reponse.fold(
                          (l) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          (r) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => AuthBloc(),
                                  child: DashBoardPage(),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthInitiateState) {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<AuthBloc>(context).add(
                              AuthRegisterRequest(
                                  userNameTextEditingController.text,
                                  passwordTextEditingController.text,
                                  passwordConfirmTextEditingController.text),
                            );
                          },
                          child: Text(
                            'ثبت نام',
                            style: TextStyle(
                              fontFamily: 'shmid',
                              fontSize: 17.sp,
                              color: LightColors.categoryText,
                            ),
                          ),
                        );
                      }
                      if (state is AuthLoadingState) {
                        return CircularProgressIndicator();
                      }
                      if (state is AuthResponseState) {
                        Text widget = Text('');
                        state.reponse.fold(
                          (l) {
                            Text(
                              l,
                              style: TextStyle(color: Colors.red),
                            );
                          },
                          (r) {
                            widget = Text(
                              r,
                              style: TextStyle(color: Colors.green),
                            );
                          },
                        );
                        return widget;
                      }
                      return Text('خطااااا');
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 3.4.h,
              ),
              Spacer(),
              Image.asset(
                'assets/images/cloud.png',
                height: 115,
              )
            ],
          ),
        ),
      ),
    );
  }
}
