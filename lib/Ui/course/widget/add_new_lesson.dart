import 'package:cv/Ui/course/course_detiles.dart';
import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class AddNewLesson extends StatelessWidget {
   AddNewLesson({Key? key ,required this.courseId,required this.pathId}) : super(key: key);
   String pathId ,courseId;
  TextEditingController _lessonDescription =TextEditingController();
   TextEditingController _lessonVedioLink =TextEditingController();
   TextEditingController _lessonRessorse =TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "لوصف العام",
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 14.sp),
          ),
          Divider(height: 30.h,),

          Text(
            "نبذة",
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 14.sp),
          ),
          TextField(
            controller: _lessonDescription,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: const Color(0xFF707070), fontSize: 13.sp),
              constraints: BoxConstraints(
                  maxHeight: 80.h,
                  maxWidth: 318.w,
                  minWidth: 318.w,
                  minHeight: 80.h),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red, width: 1.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.3, color: Color(0xFf707070)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFFD0D6E0), width: 1.0),
              ),
            ),
            enabled: true,

          ),
          SizedBox(height: 20.h,),

          Text(
            "قم بتحميل الفيديو الخاص بك",
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 14.sp),
          ),
          TextField(
            controller: _lessonVedioLink,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: const Color(0xFF707070), fontSize: 13.sp),
              constraints: BoxConstraints(
                  maxHeight: 80.h,
                  maxWidth: 318.w,
                  minWidth: 318.w,
                  minHeight: 80.h),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red, width: 1.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.3, color: Color(0xFf707070)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFFD0D6E0), width: 1.0),
              ),
            ),
            enabled: true,

          ),
          SizedBox(height: 20.h,),

          Text(
            "مصادر الدرس او قم بتحميل اي روابط ",
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 14.sp),
          ),
          TextField(
            controller: _lessonRessorse,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                  color: const Color(0xFF707070), fontSize: 13.sp),
              constraints: BoxConstraints(
                  maxHeight: 80.h,
                  maxWidth: 318.w,
                  minWidth: 318.w,
                  minHeight: 80.h),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red, width: 1.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.3, color: Color(0xFf707070)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFFD0D6E0), width: 1.0),
              ),
            ),
            enabled: true,

          ),
          SizedBox(height: 30.h,),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF26B888),
                minimumSize: Size(343.w, 40.h),
                maximumSize: Size(343.w, 40.h),
                elevation: 2,
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.all(10.h),
              ),
              onPressed: ()=> addLesson(context),
              child: Text(
                "إضافة درس جديد",
                style: GoogleFonts.tajawal(
                    color: Colors.white, fontSize: 14.sp),
              )),
        ],),
    );
  }
 void  addLesson(BuildContext context){
     if(check()){
        addToDatabase(context);
        Navigator.pop(context);

     }
     else{
       return ;
     }
 }
 bool check(){
    if(_lessonDescription.text.isNotEmpty &&_lessonRessorse.text.isNotEmpty &&_lessonVedioLink.text.isNotEmpty){
      return true;
    }
    return false;
 }

   addToDatabase(BuildContext context){
     AddNewCourseCubit.get(context).createNewLesson(
       courseId: courseId,
         pathId: pathId,
         descriptionLesson: _lessonDescription.text,
         vedioLinkLesson: _lessonVedioLink.text,
         lessonResoucr: _lessonRessorse.text);
         }


}

