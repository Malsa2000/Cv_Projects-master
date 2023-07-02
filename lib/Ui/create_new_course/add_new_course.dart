import 'dart:io';

import 'package:cv/Ui/course/all_course.dart';
import 'package:cv/Ui/course/all_course_the_same_path.dart';
import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/bloc/cubit_add_new_course/states.dart';
import 'package:cv/core/controller_helper.dart';
import 'package:cv/modle/followers_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewCourse extends StatefulWidget {
   CreateNewCourse({Key? key ,required this.pathId}) : super(key: key);

   String pathId ;

  @override
  State<CreateNewCourse> createState() => _CreateNewCourseState();
}

class _CreateNewCourseState extends State<CreateNewCourse> {

  String? _whatsShodeLearnText ,_generalQustionText ,_generalAswerText;
  List<dynamic> _whatsShodeLearnList = [];
   List<dynamic> _generalQustionList = [];
  List<dynamic> _generalQustionTitle = [];
  List<dynamic> _generalQustionanswer = [];

  String? _errorText;
   List<FollowersType> _type = <FollowersType>[
     FollowersType(id: 1, name: "يوجد شهادة"),
     FollowersType(id: 2, name: "لا يوجد شهادة"),
   ];
   int? _id ;


 late TextEditingController _courseDescription;

 late TextEditingController _whatsShodeLearn ;

 late TextEditingController _generalQustion;

 late TextEditingController _numberOfLecture;

  late TextEditingController _courseName;

  late TextEditingController _languges;

 TextEditingController _generalAnswer =TextEditingController();


  @override
  void initState() {
    super.initState();
    _numberOfLecture = TextEditingController();
    _generalQustion = TextEditingController();
    _courseName = TextEditingController();
    _whatsShodeLearn = TextEditingController();
    _courseDescription = TextEditingController();
    _languges = TextEditingController();

  }
  @override
  void dispose() {
    _numberOfLecture.dispose();
    _generalQustion.dispose();
    _whatsShodeLearn.dispose();
    _courseDescription.dispose();
    _courseName.dispose();
    _languges.dispose();
    super.dispose();
  }

   Widget lodingState(){
     return const CircularProgressIndicator(
       color: Colors.green,);}
   @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
           toolbarHeight: 88.h,
           titleSpacing: 0,
           backgroundColor: Colors.transparent,
           elevation: 0,
           title: Container(
             padding: EdgeInsets.symmetric(horizontal: 16.w),
             height: 88.h,
             width: double.infinity,
             alignment: Alignment.center,
             decoration: BoxDecoration(
               color: const Color(0xFF26B888),
               borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(20.r),
                   bottomRight: Radius.circular(20.r)),
             ),

             child: Row(
                 children: [
                   IconButton(onPressed: () {},
                       icon: const Icon(Icons.arrow_back_ios)),
                   Expanded(
                     flex: 3,
                     child: Text(
                       "أضف دورة تدربية جديدة", style: GoogleFonts.cairo(
                         fontSize: 13.sp, fontWeight: FontWeight.w600,
                         color: Colors.white), textAlign: TextAlign.center,),
                   ),

                 ]
             ),
           )),
       body: BlocConsumer<AddNewCourseCubit, AddNewCourseStates>(
         listener: (context, state) {},
         builder: (context, state) {
           if(state is AddNewCourseLodingState){
             return lodingState();
           }
           else if(state is AddNewCourseErrorState){
           }
           else{
           }
           return ListView(
             padding: EdgeInsets.symmetric(horizontal: 16.w),
             children: [
               Container(
                 margin: EdgeInsets.only(top: 24.h),
                 padding: EdgeInsets.symmetric(
                     horizontal: 12.w, vertical: 17.h),
                 color: Colors.white,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                         "  المعلومات الأساسية", style: GoogleFonts.cairo(
                         fontSize: 12.sp, fontWeight: FontWeight.w600,
                         color: Colors.black)),
                     const Divider(
                         color: Color(0xFFD0D6E0), height: 15, thickness: 1),
                     SizedBox(height: 35.h,),
                     Text(
                         "اسم الكورس", style: GoogleFonts.cairo(
                         fontSize: 14.sp, fontWeight: FontWeight.w400,
                         color: Colors.black)),
                     TextField(
                       controller: _courseName,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         hintText: "اسم الكورس",
                         hintStyle: TextStyle(
                             color: const Color(0xFF707070), fontSize: 13.sp),
                         constraints: BoxConstraints(
                             maxHeight: _errorText == null ? 48.h : 75.h,
                             maxWidth: 318.w),
                         errorBorder: const OutlineInputBorder(
                           borderSide: BorderSide(
                               color: Colors.red, width: 1.0),
                         ),
                         enabledBorder: const OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 0.5, color: Color(0xFf707070)),
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
                         "الشهادة", style: GoogleFonts.cairo(
                         fontSize: 14.sp, fontWeight: FontWeight.w400,
                         color: Colors.black)),
                     Container(
                       margin: EdgeInsets.only(top: 10.h),
                       padding: EdgeInsets.symmetric(horizontal: 10.w),
                       height: 48.h,
                       width: 318.5.w,
                       decoration: BoxDecoration(
                           border: Border.all(color: const Color(0xFf707070),
                               width: 0.25)),
                       child: DropdownButton<int>(
                           icon: const Icon(
                             Icons.arrow_drop_down_sharp, color: Colors.black,
                             size: 20,),
                           isExpanded: true,
                           underline: Container(color: Colors.transparent),
                           hint: const Text("يوجد شهادة"),
                           style: GoogleFonts.tajawal(fontSize: 14,
                               fontWeight: FontWeight.w400,
                               color: Color(0XFFD0D6E0)),
                           value: _id,
                           onChanged: (int? vlaue) {
                             _id = vlaue;
                           },
                           items: _type.map((FollowersType) =>
                               DropdownMenuItem<int>(
                                 child: Text(FollowersType.name),
                                 value: FollowersType.id,
                               ))
                               .toList()),

                     ),

                     SizedBox(height: 20.h,),
                     Text(
                         "اللغة", style: GoogleFonts.cairo(
                         fontSize: 14.sp, fontWeight: FontWeight.w400,
                         color: Colors.black)),
                     TextField(
                       controller: _languges,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         hintText: "اللغة",
                         hintStyle: TextStyle(
                             color: const Color(0xFF707070), fontSize: 13.sp),
                         constraints: BoxConstraints(
                             maxHeight: _errorText == null ? 48.h : 75.h,
                             maxWidth: 318.w),
                         errorBorder: const OutlineInputBorder(
                           borderSide: BorderSide(
                               color: Colors.red, width: 1.0),
                         ),
                         enabledBorder: const OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 0.5, color: Color(0xFf707070)),
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
                         "عدد الدروس", style: GoogleFonts.cairo(
                         fontSize: 14.sp, fontWeight: FontWeight.w400,
                         color: Colors.black)),
                     TextField(
                       controller: _numberOfLecture,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(
                         hintText: "8",
                         hintStyle: TextStyle(
                             color: const Color(0xFF707070), fontSize: 13.sp),
                         constraints: BoxConstraints(
                             maxHeight: _errorText == null ? 48.h : 75.h,
                             maxWidth: 318.w),
                         errorBorder: const OutlineInputBorder(
                           borderSide: BorderSide(
                               color: Colors.red, width: 1.0),
                         ),
                         enabledBorder: const OutlineInputBorder(
                           borderSide: BorderSide(
                               width: 0.5, color: Color(0xFf707070)),
                         ),
                         focusedBorder: const OutlineInputBorder(
                           borderSide: BorderSide(
                               color: Color(0xFFD0D6E0), width: 1.0),
                         ),
                       ),
                       enabled: true,

                     ),


                   ],),
               ),
               Container(
                 margin: EdgeInsets.only(top: 20.h),
                 padding: EdgeInsets.symmetric(
                     horizontal: 12.w, vertical: 16.h),
                 color: Colors.white,
                 child:
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                         "الوصف العام", style: GoogleFonts.cairo(
                         fontSize: 12.sp, fontWeight: FontWeight.w600,
                         color: Colors.black)),
                     const Divider(
                         color: Color(0xFFD0D6E0), height: 15, thickness: 1),

                     SizedBox(height: 35.h,),
                     Text(
                         "نبذة", style: GoogleFonts.cairo(
                         fontSize: 14.sp, fontWeight: FontWeight.w400,
                         color: Colors.black)),
                     SizedBox(height: 10.h,),
                     TextField(
                       controller: _courseDescription,
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

                     Text(
                         "ماذا سوف تتعلم", style: GoogleFonts.cairo(
                         fontSize: 14.sp, fontWeight: FontWeight.w400,
                         color: Colors.black)),
                     SizedBox(height: 10.h,),
                     Row(children: [
                       TextField(
                         controller: _whatsShodeLearn,
                         keyboardType: TextInputType.text,
                         decoration: InputDecoration(
                           hintText: "",
                           hintStyle: TextStyle(
                               color: const Color(0xFF707070), fontSize: 13.sp),
                           constraints: BoxConstraints(
                               maxHeight: 80.h,
                               maxWidth: 250.w,
                               minWidth: 250.w,
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
                       SizedBox(width: 5.w,),
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             primary: const Color(0xFF26B888),
                             minimumSize: Size(50.w, 80.h),
                             maximumSize: Size(50.w, 80.h),
                             elevation: 2,
                             alignment: AlignmentDirectional.center,
                             padding: EdgeInsets.all(10.h),
                           ),
                           onPressed: () {
                             setState(() {
                               addToList();
                               print("malsa ${_whatsShodeLearn.text}");
                             });


                           },
                           child: Text(
                             "+", style: GoogleFonts.tajawal(
                               color: Colors.white, fontSize: 14.sp),

                           )),
                     ],),

                     ConstrainedBox(
                       constraints: BoxConstraints(
                         maxHeight: 200.h,maxWidth: 200.w,minHeight: 200.h,minWidth: 200.w
                       ),
                       child: ListView.builder(
                         shrinkWrap: true,
                           padding: EdgeInsets.symmetric(
                               horizontal: 16.w, vertical: 20.h),
                           itemCount: _whatsShodeLearnList.length,
                           itemBuilder: (context, index) {
                             return Row(children: [
                               Text(
                                   "$index- ",
                                   style: GoogleFonts.cairo(fontSize: 13.sp,
                                       fontWeight: FontWeight.w400,
                                       color: Colors.black)),
                               Text(
                                   _whatsShodeLearnList[index],
                                   style: GoogleFonts.cairo(fontSize: 14.sp,
                                       fontWeight: FontWeight.w400,
                                       color: Colors.black)),
                             ],)
                             ;
                           }),
                     ),
                     Text(
                         "أسئلة عامة", style: GoogleFonts.cairo(
                         fontSize: 14.sp, fontWeight: FontWeight.w400,
                         color: Colors.black)),
                     SizedBox(height: 10.h,),
                     Row(children: [
                       TextField(
                         controller: _generalQustion,
                         keyboardType: TextInputType.text,
                         decoration: InputDecoration(
                           hintText: "Qustion",
                           hintStyle: TextStyle(
                               color: const Color(0xFF707070), fontSize: 13.sp),
                           constraints: BoxConstraints(
                               maxHeight: 80.h,
                               maxWidth: 110.w,
                               minWidth: 110.w,
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
                       SizedBox(width: 2.w,),
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             primary: const Color(0xFF26B888),
                             minimumSize: Size(40.w, 65.h),
                             maximumSize: Size(40.w, 65.h),
                             elevation: 2,
                             alignment: AlignmentDirectional.center,
                             padding: EdgeInsets.all(10.h),
                           ),
                           onPressed: () {
                              setState(() {
                                addToList2();
                              });
                        },
                           child: Text(
                             "+", style: GoogleFonts.tajawal(
                               color: Colors.white, fontSize: 14.sp),

                           )),
                       SizedBox(width: 7.w,),
                       TextField(
                         //controller: _generalAnswer,
                         keyboardType: TextInputType.text,
                         decoration: InputDecoration(
                           hintText: "answer",
                           hintStyle: TextStyle(
                               color: const Color(0xFF707070), fontSize: 13.sp),
                           constraints: BoxConstraints(
                               maxHeight: 80.h,
                               maxWidth: 110.w,
                               minWidth: 110.w,
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
                       SizedBox(width: 2.w,),
                       ElevatedButton(
                           style: ElevatedButton.styleFrom(
                             primary: const Color(0xFF26B888),
                             minimumSize: Size(40.w, 65.h),
                             maximumSize: Size(40.w, 65.h),
                             elevation: 2,
                             alignment: AlignmentDirectional.center,
                             padding: EdgeInsets.all(10.h),
                           ),
                           onPressed: () {
                             setState(() {
                               addToList2Answer();
                             });
                           },
                           child: Text(
                             "+", style: GoogleFonts.tajawal(
                               color: Colors.white, fontSize: 14.sp),

                           )),
                     ],),
                     ConstrainedBox(
                       constraints: BoxConstraints(
                         minWidth: 200.w,minHeight: 200.h,maxWidth: 200.w,maxHeight: 200.h
                       ),
                       child: ListView.builder(
                           shrinkWrap: true,
                           padding: EdgeInsets.symmetric(
                               horizontal: 16.w, vertical: 16.h),
                           itemCount: _generalQustionTitle.length,
                           physics:const NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) {
                             return Text(
                                     "$index ${_generalQustionTitle[index]}",
                                     style: GoogleFonts.cairo(fontSize: 20.sp,
                                         fontWeight: FontWeight.w400,
                                         color: Colors.black));


                           }),
                     ),
                     SizedBox(height: 16.h,),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           primary: const Color(0xFF26B888),
                           minimumSize: Size(343.w, 40.h),
                           maximumSize: Size(343.w, 40.h),
                           elevation: 2,
                           alignment: AlignmentDirectional.center,
                           padding: EdgeInsets.all(10.h),
                         ),
                         onPressed: () {
                           getImage();
                         },
                         child: Text(
                           "إضافة صورة",
                           style: GoogleFonts.tajawal(
                               color: Colors.white, fontSize: 14.sp),

                         )),
                     SizedBox(height: 16.h,),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           primary: const Color(0xFF26B888),
                           minimumSize: Size(343.w, 40.h),
                           maximumSize: Size(343.w, 40.h),
                           elevation: 2,
                           alignment: AlignmentDirectional.center,
                           padding: EdgeInsets.all(10.h),
                         ),
                         onPressed: () {

                           addCourse();
                         },
                         child: Text(
                           "إضافة دورة تدربية جديدة",
                           style: GoogleFonts.tajawal(
                               color: Colors.white, fontSize: 14.sp),

                         )),
                   ],),)

             ],
           );
         },
       ),
     );
  }

  File? file;
  Future<File> getImage() async {
    XFile? pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(()=>file = File(pickedImage.path));
    }
    return file!;
  }

  addToList() {
      _whatsShodeLearnText= _whatsShodeLearn.text ;
      _whatsShodeLearnList.add(_whatsShodeLearnText.toString());
      _whatsShodeLearn.clear();
      _whatsShodeLearn.text = "";

  }
  addToList2Answer() {
    _generalAswerText= _generalAnswer.text ;
    _generalQustionanswer.add(_generalAswerText);
    _generalAnswer.clear();
    _generalAnswer.text = "";

  }
  addToList2() {
       _generalQustionText= _generalQustion.text ;
       _generalQustionTitle.add(_generalQustionText);
       _generalQustion.clear();
       _generalQustion.text = "";

   }
   matchTowList(){
    _generalQustionList.add(_generalQustionTitle);
    _generalQustionList.add(_generalQustionanswer);

  }
   addCoaddCourseurseToFirebase(){
     AddNewCourseCubit.get(context).createCourse(
       courseName: _courseName.text,
       pathId:  widget.pathId,
       numberOfStudent: "5",
       timeOfL: "5",
       image: file!,
       date: "${DateTime.now().day}",
         certifcatedOrNo: "yes",
         languges: _languges.text,
         numberOfLecture: _numberOfLecture.text,
         description:_courseDescription.text,
         whataWeLearn: _whatsShodeLearnList,
         generalQustions: _generalQustionList,
       itemPath: 'Course',

          );

   }
   void addCourse(){
     if(checkData()){
       addCoaddCourseurseToFirebase();
       Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCoureseTheSamePath(pathId: widget.pathId)));
     }
   }
   bool checkData() {
     if (_numberOfLecture.text.isNotEmpty &&
         _courseDescription.text.isNotEmpty &&
         _languges.text.isNotEmpty&&
     _courseName.text.isNotEmpty
           ) {
       return true;
     }
     else {
       context.snackBar(massage: " Create New Course failed",error: true);
       return false;
     }
   }


}

