import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/bloc/cubit_add_new_course/states.dart';
import 'package:cv/core/colors.dart';
import 'package:cv/modle/trainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
Widget GeneralDescription(  Map<String ,AddNewCourse> listCourseItem){
  int index = 0;
  Map<String ,AddNewCourse> listCourse ;

  List list1 = [];
  List list2= [];

  return BlocBuilder<AddNewCourseCubit,AddNewCourseStates>(
      builder:(context, state){
        listCourse = listCourseItem;
        return  Container(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
          padding: EdgeInsets.only(top: 30.h,left: 20.w,right: 20.w),
          child: ListView(
            children: [
              //descriptions
              Text(
                  "نظرة عامة", style: GoogleFonts.tajawal(
                  fontSize: 13.sp, fontWeight: FontWeight.w600,
                  color: Colors.black)),
              Text(
                  listCourse.values.single.description! , style: GoogleFonts.tajawal(
                  fontSize: 12.sp, fontWeight: FontWeight.w600,
                  color:const Color(0xFF99A0AA))),
              SizedBox(height: 15.h,),
              //whats should learn
              Text(
                  "ماذا سوف تتعلم", style: GoogleFonts.tajawal(
                  fontSize: 13.sp, fontWeight: FontWeight.w600,
                  color: Colors.black)),
              ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                  shrinkWrap: true,
                  itemCount: listCourse.values.single.whataWeLearn.length!,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Row(
                      children: [
                        const Icon(Icons.check,color: Color(0xFF26B888),),
                        Text(
                            listCourse.values.single.whataWeLearn![index], style: GoogleFonts.tajawal(
                            fontSize: 12.sp, fontWeight: FontWeight.w600,
                            color:const Color(0xFF99A0AA))),

                      ],
                    );
                  }),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                padding: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w),
                color: AppColor.white,
                child: Column(children: [
                  Text(
                      "أسئلة عامة", style: GoogleFonts.tajawal(
                      fontSize: 13.sp, fontWeight: FontWeight.w600,
                      color: Colors.black)),
                  ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                      shrinkWrap: true,
                      itemCount: listCourse.values.single.generalQustions.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return Row(
                          children: [
                            Text(listCourse.values.single.generalQustions[index]!, style: GoogleFonts.tajawal(
                                fontSize: 12.sp, fontWeight: FontWeight.w600,
                                color:const Color(0xFF99A0AA))),

                          ],
                        );
                      }),

                ],),
              )
              //general Qustions

            ],),
        );
      }  );

}


