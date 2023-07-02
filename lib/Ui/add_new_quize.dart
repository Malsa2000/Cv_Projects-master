import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/bloc/cubit_add_new_course/states.dart';
import 'package:cv/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modle/quise.dart';

class AddNewQuize extends StatefulWidget {
   AddNewQuize({Key? key ,required this.pathId,required this.courseId,required this.lessonId}) : super(key: key);

   String pathId ,courseId ,lessonId;
   List<Map<String ,Quize>> quizList = [];
  @override
  State<AddNewQuize> createState() => _AddNewQuizeState();
}

class _AddNewQuizeState extends State<AddNewQuize> {

  TextEditingController _qustionText =TextEditingController();
  TextEditingController _choose1 =TextEditingController();

  String? qustion1 ;
  String? _id;
  int index = -1;
  List<String> allOptions = [];
  late Quize quize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.save))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20.h),
        children: [
          SizedBox(height: 30.h,),
          Text(
            "الاسئلة",
            style: GoogleFonts.tajawal(
                color: Colors.black, fontSize: 14.sp),
          ),
          Divider(height: 30.h,),

          BlocBuilder<AddNewCourseCubit,AddNewCourseStates>(
          builder:(context, state){
          AddNewCourseCubit.get(context).readQuiz(widget.pathId,widget.courseId ,widget.lessonId);
          print("malsa qusie${widget.pathId} ${widget.courseId} ,${widget.lessonId}");
          widget.quizList =AddNewCourseCubit.get(context).quizList;
          return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.quizList.length,
        itemBuilder: (context,index){
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.all(Radius.circular(20.r))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.quizList[index].values.single.qustionName!,
                  style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w600,
                      color: Colors.black, fontSize: 14.sp),
                ),
                SizedBox(height: 10.h,),
                ListView.builder(
                  shrinkWrap: true,
                    itemCount:widget.quizList[index].values.single.qustionAnswer.length!,
                    itemBuilder: (context,index){
                  return RadioListTile(
                      title: Text(
                        widget.quizList[index].values.single.qustionAnswer[index]!,
                        style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w400,
                            color: Colors.black, fontSize: 12.sp),
                      ),
                      value: "a", groupValue: qustion1
                      , onChanged: (String? value){
                    value=  qustion1 ;
                  });
                })
              ],),
          );
        });
    }  ),


          SizedBox(height: 20.h,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF26B888),
                minimumSize: Size(343.w, 38.h),
                maximumSize: Size(343.w, 38.h),
                elevation: 2,
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.all(10.h),
              ),
              onPressed: ()=>AddQustion(context),
              child: Text(
                "إضافة سؤال جديد",
                style: GoogleFonts.tajawal(
                    color: Colors.white, fontSize: 14.sp),
              )),

        ],
      ),
    );
  }
   void AddQustion(BuildContext context)async{
     showModalBottomSheet(context: context, builder: (context){
       RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r)));
       const ClipOval(clipBehavior: Clip.antiAlias,);
       return BottomSheet(
           clipBehavior: Clip.antiAlias,
           onClosing:(){} ,
           backgroundColor: Colors.transparent,
           builder: (context){
             return Container(
               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r),
                     topRight: Radius.circular(30.r),
                   )
               ),
               child: ListView(
                 // mainAxisAlignment: MainAxisAlignment.start,
                 // crossAxisAlignment: CrossAxisAlignment.start,
                 // mainAxisSize: MainAxisSize.min,
                 children: [
                   Text(
                     "السؤال الأول",
                     style: GoogleFonts.tajawal(
                         color: Colors.black, fontSize: 14.sp),
                   ),
                   Divider(height: 30.h,),
                   TextField(
                     controller: _qustionText,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       hintText: "ادخل السؤال",
                       hintStyle: TextStyle(
                           color: const Color(0xFF707070), fontSize: 13.sp),
                       constraints: BoxConstraints(
                           maxHeight: 38.h,
                           maxWidth: 318.w,
                           minWidth: 318.w,
                           minHeight: 38.h),
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
                     "الخيارات",
                     style: GoogleFonts.tajawal(
                         color: Colors.black, fontSize: 14.sp),
                   ),
                   ListView.builder(
                     padding: EdgeInsets.all(20.h),
                     itemCount:allOptions.length,
                       shrinkWrap: true,
                       itemBuilder: (context,index){
                         return Container(
                           height: 38.h,
                           width: 272.w,
                           margin: EdgeInsets.symmetric(horizontal: 20.h,vertical: 10.h),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(7.r)),
                             color: AppColor.white,
                             border: Border.all(color: AppColor.grayishblue99a0aa),
                           ),
                           child: Text(
                             allOptions[index],
                             style: GoogleFonts.tajawal(
                                 color: Colors.black, fontSize: 13.sp),
                           ),

                         );
                       }),
                   Row(children: [
                     TextField(
                       controller: _choose1,
                       keyboardType: TextInputType.text,
                       decoration: InputDecoration(
                         hintText: "الخيار الاول",
                         hintStyle: TextStyle(
                             color: const Color(0xFF707070), fontSize: 13.sp),
                         constraints: BoxConstraints(
                             maxHeight: 38.h,
                             maxWidth: 272.w,
                             minWidth: 272.w,
                             minHeight: 38.h),
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
                     SizedBox(width: 10.w,),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           primary: const Color(0xFF26B888),
                           minimumSize: Size(41.w, 38.h),
                           maximumSize: Size(41.w, 38.h),
                           elevation: 2,
                           alignment: AlignmentDirectional.center,
                           padding: EdgeInsets.all(10.h),
                         ),
                         onPressed: ()=>addMoreOptions(),
                         child: Text(
                           "+",
                           style: GoogleFonts.tajawal(
                               color: Colors.white, fontSize: 14.sp),
                         )),
                   ],),

                   SizedBox(height: 20.h,),
                   Text(
                     "الإجابة الصحيحة",
                     style: GoogleFonts.tajawal(
                         color: Colors.black, fontSize: 14.sp),
                   ),
                   Container(
                     margin: EdgeInsets.only(top: 10.h),
                     padding: EdgeInsets.symmetric(horizontal: 10.w),
                     height: 48.h,
                     width: 318.5.w,
                     decoration: BoxDecoration(
                         border: Border.all(color: const Color(0xFf707070),
                             width: 0.25)),
                     child: DropdownButton<String>(
                         isExpanded: true,
                         underline: Container(color: Colors.transparent),
                         style: GoogleFonts.tajawal(fontSize: 14,
                             fontWeight: FontWeight.w400,
                             color:const Color(0XFFD0D6E0)),

                         value: _id,
                         onChanged: (String? vlaue) {
                           _id = vlaue;
                         },
                        items: allOptions.map((String v){
                           return  DropdownMenuItem<String>(
                               child: Text(v),
                               value: v,
                        );
                        }).toList()),

                   ),

                   SizedBox(height: 30.h,),
                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         primary: const Color(0xFF26B888),
                         minimumSize: Size(343.w, 38.h),
                         maximumSize: Size(343.w, 38.h),
                         elevation: 2,
                         alignment: AlignmentDirectional.center,
                         padding: EdgeInsets.all(10.h),
                       ),
                       onPressed: () {
                         uplodeQuizInDatabase();
                       },
                       child: Text(
                         "إضافة",
                         style: GoogleFonts.tajawal(
                             color: Colors.white, fontSize: 14.sp),
                       )),

                 ],),
             );
           });
     });
   }
   addMoreOptions(){
    setState(() {
      allOptions.add(_choose1.text);
      _choose1.clear();
      index++;
      print(index);
    });
   }
   addQusion(){
      quize = new Quize(qustionAnswer: allOptions,qustionName: _qustionText.text,rightAnswer: _id);

   }
  uplodeQuizInDatabase(){

    AddNewCourseCubit.get(context).creatQuiz(
        courseId:widget.courseId,
        pathId: widget.pathId,
        lessonId: widget.lessonId,
       rightAnswer: _choose1.text,
      answerQuiz: allOptions,
      quizeTitle: _qustionText.text,
    );
    Navigator.pop(context);
  }

}
