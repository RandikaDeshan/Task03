import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:third_app/src/services/authservice.dart';
import 'package:third_app/src/views/homepage.dart';
import 'package:third_app/src/views/registerpage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    final _formkey = GlobalKey<FormState>();

    Future<void> _signInWithEmailAndPassword() async {
      try{
      await AuthService().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      if(context.mounted){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      },));}}
          catch(error){
            print("Error : ${error}");
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: Text('Error signing in with Google: $error'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
    }

    Future<void> _signInWithGoogle()async{
      try{
        await AuthService().signInWithGoogle();
        if(context.mounted){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return const HomePage();
          },));}
      }catch(error){
        print("Error : ${error}");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Error'),
            content: Text('Error signing in with Google: $error'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
    Future<void> _signInWithFb()async{
      await AuthService().signInWithFacebook();
      if(context.mounted){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const HomePage();
        },));}
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 96.w,right: 96.w,top: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Login here",style: TextStyle(fontSize: 30.sp,fontWeight: FontWeight.w700,color: Color.fromRGBO(31, 65, 187, 1)),),
                  SizedBox(height: 26.h,),
                  Text("Welcome back you’ve been missed!",textAlign: TextAlign.center,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,),),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 74.h,bottom: 65.h),
              child: Form(
                key: _formkey,
                  child: SizedBox(
                    width: 357.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else {
                              return null;
                            }
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                              filled: true,
                            fillColor:const Color.fromRGBO(241, 244, 255, 1),
                            hintText: "Email",
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(98, 98, 98, 1),
                            ),focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(31, 65, 187, 1),
                              width: 2
                            )
                          )
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else {
                              return null;
                            }
                          },
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                              fillColor:const Color.fromRGBO(241, 244, 255, 1),
                              hintText: "Password",
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(98, 98, 98, 1),
                              ),focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(31, 65, 187, 1),
                                  width: 2
                              )
                          )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Forgot your password?",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color: Color.fromRGBO(31, 65, 187, 1)),),
                            ],
                          ),
                        ),
                        Container(
                          decoration:const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(203, 214, 255, 1),
                                    blurRadius: 10,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset(0, 10)
                                ),
                              ]
                          ),
                          child: TextButton(onPressed: ()async{
                            if (_formkey.currentState?.validate() ?? false) {
                              await _signInWithEmailAndPassword();
                            }
                          },style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            fixedSize: Size(357.w, 60.h),
                            backgroundColor:const Color.fromRGBO(31, 65, 187, 1),
                              shadowColor:const Color.fromRGBO(203, 214, 255, 1)
                          ), child: Text("Login",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Colors.white),)),
                        ),
                        SizedBox(height: 20.h,),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const RegisterPage();
                          },));
                        },style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          fixedSize: Size(357.w, 41.h),
                        ), child: Text("Create new account",style: TextStyle(fontSize: 14 .sp,fontWeight: FontWeight.w600,color: Color.fromRGBO(73, 73, 73, 1)),)),
                      ],
                                ),
                  )),
            ),
            Text("Or continue with",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w600,color:const Color.fromRGBO(31, 65, 187, 1)),),
            SizedBox(height: 20.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 114.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed:
                    _signInWithGoogle
                  ,style: IconButton.styleFrom(
                    backgroundColor:const Color.fromRGBO(236, 236, 236, 1),
                    fixedSize: Size.fromWidth(60.w),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ), icon: const Icon(Icons.g_mobiledata,size: 24,)),
                  IconButton(onPressed:  _signInWithFb,style: IconButton.styleFrom(
                      backgroundColor:const Color.fromRGBO(236, 236, 236, 1),
                      fixedSize: Size.fromWidth(60.w),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ), icon: const Icon(Icons.facebook,size: 24,)),
                  IconButton(onPressed:(){},style: IconButton.styleFrom(
                      backgroundColor:const Color.fromRGBO(236, 236, 236, 1),
                      fixedSize: Size.fromWidth(60.w),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ), icon: const Icon(Icons.apple,size: 24,)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
