import 'package:cv/Ui/course/course_detiles.dart';
import 'package:cv/Ui/create_new_course/add_new_course.dart';
import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/bloc/cubit_add_new_course/states.dart';
import 'package:cv/core/colors.dart';
import 'package:cv/modle/trainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllCoureseTheSamePath extends StatelessWidget {

   AllCoureseTheSamePath({Key? key, required this.pathId }) : super(key: key);
  String pathId;
  List<Map<String ,AddNewCourse>> course = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Row(children: [
            Text(
             " ",style: GoogleFonts.tajawal(color: Colors.black,fontSize:12.sp ),
            ),
            Text(
              "دورات مسار  ",style: GoogleFonts.tajawal(color: Colors.black,fontSize:12.sp ),
            )
          ],),
          BlocBuilder<AddNewCourseCubit,AddNewCourseStates>(
              builder:(context, state){
                course = AddNewCourseCubit.get(context).readcourse(pathId);
                AddNewCourseCubit.get(context).readcourse(pathId);
                if(state == AddNewCourseErrorState){
                  return Center(child: Text("List Is Empty"));
                }
                else if(state == AddNewCourseLodingState){
                  return Center(child:  CircularProgressIndicator(),);
                }
                else{
                return allCourseInPath(AddNewCourseCubit.get(context).courseID
                );}
              }  ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary:const Color(0xFF26B888),
                minimumSize: Size(79.w , 40.h),
                maximumSize: Size(79.w , 40.h),
                elevation: 2,
                alignment: AlignmentDirectional.center,
                padding:  EdgeInsets.all(10.h),
              ),
              onPressed: ()=>addNewCourse(context),
              child: Text(
                "اضافة درس جديد",style: GoogleFonts.tajawal(color: Colors.white,fontSize:12.sp ),

              )),

        ],
      )
    );
  }

  // void viewMore(BuildContext context ,String courseId){
  // Navigator.push(context, MaterialPageRoute(builder: (context)=>CouresDetailes(
  //   ,)));
  // }

  void addNewCourse(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewCourse(pathId: pathId)));
  }

  Widget allCourseInPath(List<String> id){
    return ListView.builder(
        shrinkWrap: true,
        itemCount: course.length,
        itemBuilder: (context,index){
          return  Container(

            margin: EdgeInsets.only(bottom: 20.h,left: 20.w,right: 20.w,top: 20.h),
            padding: EdgeInsets.all(20.h),
            decoration:const BoxDecoration(
              color: AppColor.white,
            ),
            width: 343.w,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                    fit: BoxFit.fitWidth,
                    height:182.h,
                    width: 343.w,
                    image:const AssetImage("assets/images/1.png")),
                Container(
                  width: 150.w,
                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                  margin: EdgeInsets.symmetric(horizontal: 30.h,vertical: 20.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(10.r))
                  ),
                  child:Text(
                    "مبتدئين",
                    style :GoogleFonts.tajawal(fontSize :14.sp ,fontWeight: FontWeight.w400 ,
                        color : AppColor.main),textAlign: TextAlign.start,),

                ),
                Text(
                  course[index].values.single.courseName!,
                  style :GoogleFonts.tajawal(fontSize :13.sp ,fontWeight: FontWeight.w400 ,
                      color : Colors.black),textAlign: TextAlign.start,),
                Text(
                  course[index].values.single.description,style :GoogleFonts.tajawal(fontSize :12.sp ,fontWeight: FontWeight.w400 ,
                    color : AppColor.ghostWhiteFA),textAlign: TextAlign.start,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.library_books,color: AppColor.main),
                    Text(
                      "${course[index].values.single.numberOfLecture}  درس " ,style :GoogleFonts.tajawal(fontSize :12.sp ,fontWeight: FontWeight.w400 ,
                        color : AppColor.black),textAlign: TextAlign.start,),
                    SizedBox(width: 30.w,),
                    Icon(Icons.person,color: AppColor.main),
                    Text(
                      "${course[index].values.single.numberOfSudent} طالب " ,style :GoogleFonts.tajawal(fontSize :12.sp ,fontWeight: FontWeight.w400 ,
                        color : AppColor.black),textAlign: TextAlign.start,),
                    SizedBox(width: 33.w,),
                    Icon(Icons.alarm,color: AppColor.main),
                    Text(
                      " ${course[index].values.single.timeOfCourse} ساعة " ,style :GoogleFonts.tajawal(fontSize :12.sp ,fontWeight: FontWeight.w400 ,
                        color : AppColor.black),textAlign: TextAlign.start,),
                  ],),
                SizedBox(height: 30.h,),
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
                      Map<String ,AddNewCourse> c = course[index];
                      print(course[index]);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CouresDetailes(
                       CourseObject:c,
                        pathId: pathId,
                        courseId: id[index]
                        ,)));
                    },
                   // viewMore(context ,course[index].values.single.id!),
                    child: Text(
                      "عرض المزيد",style: GoogleFonts.tajawal(color: Colors.white,fontSize:12.sp ),

                    )),
              ],),


          );
        });
  }
}
