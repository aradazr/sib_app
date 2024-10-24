import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sib_app/constans/my_colors.dart';
import 'package:sib_app/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                height: 185,
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
                    decoration: InputDecoration(
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
                    decoration: InputDecoration(
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
              Container(
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
                    fontSize: 20.sp,
                    color: LightColors.categoryText,
                  ),
                ),
              ),
              SizedBox(
                height: 3.4.h,
              ),
              Text(
                textAlign: TextAlign.center,
                'اکانت ندارید؟\nساخت اکانت سیب اپ',
                style: TextStyle(
                    fontFamily: 'sh', fontSize: 17.sp, color: Color(0xff2997FF)),
              ),
              Spacer(
          
              ),
              Image.asset('assets/images/cloud.png',height: 115,)
            ],
          ),
        ),
      ),
    );
  }
}
