import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/bloc/cubit_add_new_course/states.dart';
import 'package:cv/core/colors.dart';
import 'package:cv/modle/trainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
Widget detiles(Map<String ,AddNewCourse> listCourseItem){

  Map<String ,AddNewCourse> listCourse ;

  return BlocBuilder<AddNewCourseCubit,AddNewCourseStates>(
      builder:(context, state){
          listCourse = listCourseItem;


        return  Container(
          height: 380.h,
          padding :EdgeInsets.symmetric(horizontal: 20.w ,vertical: 20.h),
          margin: EdgeInsets.only(top:30.h,left: 16.w,right: 16.w),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.all(Radius.circular(15.r))
          ),
          child: Column(
            children: [
              Text(
                  "تفاصيل الدورة التدربية", style: GoogleFonts.tajawal(
                  fontSize: 13.sp, fontWeight: FontWeight.w600,
                  color: Colors.black)),
              const Divider(
                  color: Color(0xFFD0D6E0), height: 15, thickness: 1),
              //date
              ListTile(
                title: Text(
                    "تاريخ النشر", style: GoogleFonts.tajawal(
                    fontSize: 13.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),
                leading:const Icon(Icons.date_range ,color: Color(0xFF26B888),),
                subtitle:Text(
                    listCourse.values.single.date!, style: GoogleFonts.tajawal(
                    fontSize: 11.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),


              ),
              //مدة
              ListTile(
                title: Text(
                    "المدة", style: GoogleFonts.tajawal(
                    fontSize: 13.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),
                leading:const Icon(Icons.date_range ,color: Color(0xFF26B888),),
                subtitle:Text(
                    listCourse.values.single.timeOfCourse!, style: GoogleFonts.tajawal(
                    fontSize: 11.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),


              ),
              //number of Student
              ListTile(
                title: Text(
                    "عدد الطلاب", style: GoogleFonts.tajawal(
                    fontSize: 13.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),
                leading:const Icon(Icons.person ,color: Color(0xFF26B888),),
                subtitle:Text(
                    listCourse.values.single.numberOfSudent!, style: GoogleFonts.tajawal(
                    fontSize: 11.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),


              ),
              //شهادة
              ListTile(
                title: Text(
                    "شهادة", style: GoogleFonts.tajawal(
                    fontSize: 13.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),
                leading:const Icon(Icons.call_to_action_sharp ,color: Color(0xFF26B888),),
                subtitle:Text(
                    listCourse.values.single.certifcatedOrNo!, style: GoogleFonts.tajawal(
                    fontSize: 11.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),


              ),
              //اللغة
              ListTile(
                title: Text(
                    "اللغة", style: GoogleFonts.tajawal(
                    fontSize: 13.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),
                leading:const Icon(Icons.language ,color: Color(0xFF26B888),),
                subtitle:Text(
                    listCourse.values.single.languges!, style: GoogleFonts.tajawal(
                    fontSize: 11.sp, fontWeight: FontWeight.w600,
                    color: Colors.black)),


              ),

            ],
          ),
        );
      }  );

}