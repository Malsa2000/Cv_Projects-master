import 'package:cv/Ui/add_new_quize.dart';
import 'package:cv/Ui/course/widget/add_new_lesson.dart';
import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/bloc/cubit_add_new_course/states.dart';
import 'package:cv/core/colors.dart';
import 'package:cv/modle/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
Widget AddNewLectures( String pathIdGet ,String courseIdGet){
  bool click = false;
  String pathId ,courseId;
  List<Map<String ,Lesson>> lessonList = [];


  return BlocBuilder<AddNewCourseCubit,AddNewCourseStates>(
      builder:(context, state){
        pathId = pathIdGet;
        courseId =courseIdGet;
        AddNewCourseCubit.get(context).readLessons(pathId,courseId);
        lessonList =AddNewCourseCubit.get(context).lessonList;
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          children: [
          lessonRow(click ,lessonList ,pathId ,courseId ,AddNewCourseCubit.get(context).lessonID),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:const Color(0xFF26B888),
                minimumSize: Size(310.w , 33.h),
                maximumSize: Size(310.w , 33.h),
                elevation: 2,
                alignment: AlignmentDirectional.center,
                padding:  EdgeInsets.all(10.h),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewLesson(
                pathId: pathId,
                  courseId: courseId,

                )));
              },
              // viewMore(context ,course[index].values.single.id!),
              child: Text(
                "اضافة درس جديد",style: GoogleFonts.tajawal(color: Colors.white,fontSize:12.sp ),

              )),

        ],);
      }  );}

  Widget lessonRow(bool click ,List<Map<String ,Lesson>> lessonList ,String pathId ,String courseId,
      List<String> id){
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
      padding: EdgeInsets.only(top: 30.h,left: 20.w,right: 20.w),
      child: ListView.builder(
        itemCount: lessonList.length!,
        shrinkWrap: true,
          itemBuilder: (context,index){
        return Column(children: [
          TextButton(onPressed: (){
            click = !click;
            print(click);
          }, child: Text(
              "الدرس $index", style: GoogleFonts.tajawal(
              fontSize: 13.sp, fontWeight: FontWeight.w600,
              color: AppColor.black))),
          Visibility(
            visible: click== false,
            child: Column(children: [
              Divider(color: AppColor.grayishblue99a0aa,height: 20.h,thickness: 0.5,endIndent: 10,indent: 10,),
              Row(children: [
                Icon(Icons.videocam_outlined,color: AppColor.main,),
                Text(
                    lessonList[index].values.single.lessonDescription!, style: GoogleFonts.tajawal(
                    fontSize: 12.sp, fontWeight: FontWeight.w600,
                    color: AppColor.black)),

              ],),
              Row(children: [
                Icon(Icons.videocam_outlined,color: AppColor.main,),
                Text(
                    lessonList[index].values.single.lessonRessorse!, style: GoogleFonts.tajawal(
                    fontSize: 12.sp, fontWeight: FontWeight.w600,
                    color: AppColor.black)),

              ],),
              Row(children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  AddNewQuize(pathId:pathId ,courseId: courseId ,lessonId: id[index],)
                  ));
                }, icon: Icon(Icons.add_card_sharp,color: AppColor.main,),),
                Text(
                    "اختبار قصير", style: GoogleFonts.tajawal(
                    fontSize: 12.sp, fontWeight: FontWeight.w600,
                    color: AppColor.black)),

              ],),
              Row(children: [
                Icon(Icons.circle,color: AppColor.main,),

              ],),
            ],),
          )
        ],);
      })
    );
  }





