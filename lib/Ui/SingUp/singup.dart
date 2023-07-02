import 'package:cv/Ui/NavBar/navbar.dart';
import 'package:cv/Ui/Room/voice_screen.dart';
import 'package:cv/Ui/SingIn/singin.dart';
import 'package:cv/bloc/cubit_singup/cubit.dart';
import 'package:cv/bloc/cubit_singup/states.dart';
import 'package:cv/core/colors.dart';
import 'package:cv/core/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SingUP extends StatefulWidget {
  SingUP({Key? key}) : super(key: key);

  @override
  State<SingUP> createState() => _SingUPState();
}

class _SingUPState extends State<SingUP> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var fNameController = TextEditingController();
  var sNameController = TextEditingController();
  var dataController = TextEditingController();
  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var passwordController = TextEditingController();
  var conpasswordController = TextEditingController();
  var password = true;
  bool isClicked = false;


  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (BuildContext context) => CvSingUpCubit(),
        child: BlocConsumer<CvSingUpCubit, CvSingUpStates>(
          listener: (context, state) {
            if (state is SocialCreateUserSuccessState) {
              navigateAndFinish(context, NavBarLayout());
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: AppColor.white,
              appBar: AppBar(
                centerTitle: true,
                leadingWidth: 90,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColor.main,
                ),
                elevation: 0,
                backgroundColor: AppColor.main,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                toolbarHeight: 88,
                flexibleSpace: SafeArea(
                  child: SvgPicture.asset(
                    'assets/images/appbarpoint.svg',

                    fit: BoxFit.cover,
                  ),
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 80,
                          ),
                          Text(
                            'SkillFull',
                            style: TextStyle(
                              fontFamily: 'Houstone',
                              fontSize: 35,
                              color: const Color(0xff26b888),
                              letterSpacing: 0.35000000000000003,
                              height: 0.6514286041259766,
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Text(
                            "أهلا بك",
                            style: TextStyle(
                                fontSize: 20,
                                color: AppColor.p200E32,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "إنشى حسابك واحصل على فرص عمل وطور مهاراتك",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400,
                              color: AppColor.grayishblue99a0aa,
                            ),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          defaultFormField(
                              controller: emailController,
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'ادخل البريد الإلكتروني';
                                }
                              },
                              type: TextInputType.emailAddress,
                              hint: "ادخل البريد الإلكتروني",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grayishblue99a0aa)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2.23,
                                child: defaultFormField(
                                    controller: fNameController,
                                    type: TextInputType.name,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'ادخل الاسم الأول';
                                      }
                                    },
                                    hint: "الاسم الأول ",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.grayishblue99a0aa)),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2.28,
                                child: defaultFormField(
                                    controller: sNameController,
                                    type: TextInputType.name,
                                    validate: (value) {
                                      if (value.isEmpty) {
                                        return 'الاسم الأخير';
                                      }
                                    },
                                    hint: "الاسم الأخير",
                                    hintStyle: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.grayishblue99a0aa)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          defaultFormField(
                              controller: dataController,
                              type: TextInputType.number,
                              hint: "تاريخ الميلاد",
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'تاريخ الميلاد';
                                }
                              },
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grayishblue99a0aa)),
                          SizedBox(
                            height: 20.h,
                          ),
                          defaultFormField(
                              controller: countryController,
                              type: TextInputType.number,
                              hint: "الدولة",
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'الدولة';
                                }
                              },
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grayishblue99a0aa)),
                          SizedBox(
                            height: 20.h,
                          ),
                          defaultFormField(
                              controller: cityController,
                              type: TextInputType.number,
                              hint: " المدينة",
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'المدينة';
                                }
                              },
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grayishblue99a0aa)),
                          SizedBox(
                            height: 20.h,
                          ),
                          defaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              hint: "ادخل كلمة المرور ",
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'ادخل كلمة المرور';
                                }
                              },
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grayishblue99a0aa)),
                          SizedBox(
                            height: 20.h,
                          ),
                          defaultFormField(
                              controller: conpasswordController,
                              type: TextInputType.visiblePassword,
                              hint: "تأكيد كلمة المرور",
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'تأكيد كلمة المرور';
                                }
                              },
                              hintStyle: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.grayishblue99a0aa)),
                          SizedBox(
                            height: 40.h,
                          ),
                          (state is! CvSingUpLoadingState) ?
                          defauContainer(

                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                CvSingUpCubit.get(context).userRegister(
                                  country:countryController.text,
                                  city:cityController.text,
                                  conpassword: conpasswordController.text,
                                  firstname: fNameController.text,
                                  lastName: sNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  data: dataController.text,
                                );
                              }
                            },
                            height: 52.h,
                            text: "إنشاء حساب جديد ",
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontSize: 15.sp,
                              color: AppColor.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ) : CircularProgressIndicator(
                            color: AppColor.main,
                          )
                          ,
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'لديك حساب؟ ',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColor.p200E32,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w400),
                              ),

                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SingIn()));
                                },
                                child: Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color: AppColor.main,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },

        ),
      );
  }
}
