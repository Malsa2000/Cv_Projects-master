import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cv/Ui/Profiles/Widget/path_education.dart';
import 'package:cv/Ui/course/all_course_the_same_path.dart';
import 'package:cv/Ui/course/course_detiles.dart';
import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/bloc/cubit_add_new_course/states.dart';
import 'package:cv/modle/path.dart';
import 'package:cv/modle/trainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class AllCourse extends StatelessWidget {
   AllCourse({Key? key }) : super(key: key);

  String id = "";
   String pathName = "";
   List<Map<String, PathCourse>> pathList = [];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الرئيسية"),
        backgroundColor: Colors.green,
      ),
      body: BlocConsumer<AddNewCourseCubit,AddNewCourseStates>(
        listener: (contex ,state){},
         builder:(context, state){
         pathList=  AddNewCourseCubit.get(context).readpath();
         AddNewCourseCubit.get(context).pathList;
         if(state == readPathErrorState){
           return Center(child: Text("List Is Empty"));
         }
       else if(state == readPathLodingState){
         return Center(child:  CircularProgressIndicator(),);
         }
       else{
         return onOprationDone(AddNewCourseCubit.get(context).pathID);
         }

    }  ),
    );
  }

 Widget onOprationDone(List<String> id){
     return ListView(
       children: [
         SizedBox(height: 30.h,),
         Text(
             "مرحبا أحمد", style: GoogleFonts.tajawal(
             fontSize: 13.sp, fontWeight: FontWeight.w600,
             color: Colors.black)),
         Text(
             "المسارات التعليمية التي قمت بإضافتها", style: GoogleFonts.tajawal(
             fontSize: 13.sp, fontWeight: FontWeight.w600,
             color: Colors.black)),
         ListView.builder(
             shrinkWrap: true,
             physics:const NeverScrollableScrollPhysics(),
             itemCount: pathList.length,
             itemBuilder: (context, index) {
               return Container(
                 margin: EdgeInsets.symmetric(vertical: 10.h),
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.all(Radius.circular(20.r))
                 ),
                 padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                 child: Row(
                   children: [
                     Image(
                         fit: BoxFit.fitWidth,
                         height: 112.h,
                         width: 165.w,
                         image: NetworkImage(
                             "https://media.istockphoto.com/id/1181366400/photo/in-the-hands-of-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-on.jpg?s=612x612&w=0&k=20&c=jWUMrHgjMY9zQXsAwZFb1jfM6KxZE16-IXI1bvehjQM=")),
                     SizedBox(width: 20.w,),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                             pathList[index].values.single.pathName!
                             , style: GoogleFonts.tajawal(
                             fontSize: 14.sp, fontWeight: FontWeight.w600,
                             color: Colors.black)),
                         Text(
                             id[index]
                             , style: GoogleFonts.tajawal(
                             fontSize: 12.sp, fontWeight: FontWeight.w400,
                             color: Colors.black)),
                         ElevatedButton(
                             style: ElevatedButton.styleFrom(
                               primary: const Color(0xFF26B888),
                               minimumSize: Size(160.w, 43.h),
                               maximumSize: Size(160.w, 43.h),
                               elevation: 2,
                               alignment: AlignmentDirectional.center,
                               padding: EdgeInsets.all(10.h),
                             ),
                             onPressed: () {
                               Navigator.push(context,
                                   MaterialPageRoute(builder: (context)=>
                                       AllCoureseTheSamePath(
                                           pathId: id[index]) ));
                             },
                             child: Text(
                               "عرض المزيد", style: GoogleFonts.tajawal(
                                 color: Colors.white, fontSize: 14.sp),

                             )),


                       ],)
                   ],),
               );
             })

       ],);
 }
   void viewCourseDetiles(String pathId,BuildContext context){
     Navigator.push(context,
         MaterialPageRoute(builder: (context)=>
         AllCoureseTheSamePath(
             pathId: pathId) ));
   }

}
