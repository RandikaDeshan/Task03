import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_app/src/views/loginpage.dart';
import 'package:third_app/src/views/registerpage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: const AssetImage("assets/images/welcome image.png"),height: 422.h,),
          SizedBox(height: 86.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.w),
            child: Column(
              children: [
                Text("Discover Your Dream Job here",textAlign: TextAlign.center,style: TextStyle(fontSize: 35.sp,fontWeight: FontWeight.w600,color: Color.fromRGBO(31, 65, 187, 1)),),
                SizedBox(height: 23.h,),
                Text("Explore all the existing job roles based on your interest and study major",textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400),),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 88.h,left: 40.w,right: 40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration:const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(203, 214, 255, 1),
                        blurRadius: 10,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(0, 10)
                      )
                    ]
                  ),
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    },));
                  },style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(160.w, 60.h),
                    backgroundColor:const Color.fromRGBO(31, 65, 187, 1),
                    shadowColor:const Color.fromRGBO(203, 214, 255, 1)
                  ), child: Text("Login",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Colors.white),)),
                ),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const RegisterPage();
                  },));
                },style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(160.w, 60.h),
                ), child: Text("Register",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: const Color.fromRGBO(10, 10, 10, 1)),)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
