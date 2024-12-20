import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/Screens/dashboard_page.dart';
import 'package:sib_app/Screens/sign_up_page.dart';
import 'package:sib_app/bloc/authentication/auth_bloc.dart';
import 'package:sib_app/bloc/authentication/auth_event.dart';
import 'package:sib_app/bloc/authentication/auth_state.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final userNameTextEditingController =
      TextEditingController(text: 'aradazar1381');
  final passwordTextEditingController = TextEditingController(text: '12345678');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: 4.6.h,
              ),
              Image.asset(
                'assets/images/login_page_apple.png',
                height: 200,
              ),
              SizedBox(
                height: .7.h,
              ),
              Text(
                'با اکانت سیب اپ\n !وارد شوید',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'shbold',
                  fontSize: 25.sp,
                  color: LightColors.categoryText,
                ),
              ),
              SizedBox(
                height: 3.h,
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
              SizedBox(
                height: 2.1.h,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthInitiateState) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(13),
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          AuthLoginRequest(userNameTextEditingController.text,
                              passwordTextEditingController.text),
                        );
                      },
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
                        child: Text(
                          'ادامه',
                          style: TextStyle(
                            fontFamily: 'shmid',
                            fontSize: 17.sp,
                            color: LightColors.categoryText,
                          ),
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
                        widget = Text(
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
              SizedBox(
                height: 3.4.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BlocProvider(
                          create: (context) {
                          var authBloc = AuthBloc();
                          authBloc.stream.forEach(
                            (state) {
                              if (state is AuthResponseState) {
                                state.reponse.fold(
                                  (l) {},
                                  (r) {
                                    globalNavigatorKey.currentState
                                        ?.pushReplacement(MaterialPageRoute(
                                      builder: (context) => DashBoardPage(),
                                    ));
                                  },
                                );
                              }
                            },
                          );
                          return authBloc;
                        },
                          child: SignUpPage(),
                        );
                      },
                    ),
                  );
                },
                child: Text(
                  textAlign: TextAlign.center,
                  'اکانت ندارید؟\nساخت اکانت سیب اپ',
                  style: TextStyle(
                      fontFamily: 'sh',
                      fontSize: 15.sp,
                      color: Color(0xff2997FF)),
                ),
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
