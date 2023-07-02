
import 'dart:io';
import 'package:cv/Ui/course/all_course.dart';
import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddPath extends StatefulWidget {
  const AddPath({Key? key}) : super(key: key);

  @override
  State<AddPath> createState() => _AddPathState();
}

class _AddPathState extends State<AddPath> {
  late TextEditingController _courseName;

  @override
  void initState() {
    super.initState();
    _courseName = TextEditingController();

  }
  @override
  void dispose() {
    _courseName.dispose();
    super.dispose();
  }
  File? _images;
  final imagePicker = ImagePicker();
  File? paths;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:   ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF26B888),
              minimumSize: Size(343.w, 40.h),
              maximumSize: Size(343.w, 40.h),
              elevation: 2,
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.all(10.h),
            ),
            onPressed: () {

              AddNewCoures(context);
            },
            child: Text(
              "إضافة دورة تدربية جديدة",
              style: GoogleFonts.tajawal(
                  color: Colors.white, fontSize: 14.sp),

            )),
      ),
    );
  }

  void AddNewCoures(BuildContext context)async{
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "أضف مسار تعليمي" ,style :GoogleFonts.cairo(fontSize :12.sp ,fontWeight: FontWeight.w700 ,
                      color : Colors.black)),
                  const Divider(color:  Color(0xFFD0D6E0),height: 18, thickness: 1),
                  SizedBox(height: 20.h,),
                  Text(
                      "اسم المسار " ,style :GoogleFonts.tajawal(fontSize :14.sp ,fontWeight: FontWeight.w400 ,
                      color : Colors.black)),
                  SizedBox(height: 20.h,),

                  TextField(
                    controller: _courseName,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "ادخل اسم المسار",
                      hintStyle: TextStyle(
                          color:const Color(0xFF707070) , fontSize: 13.sp ),
                      constraints: BoxConstraints(
                          maxHeight:  48.h,maxWidth: 342.w ,minHeight: 48.h ,minWidth: 342.w),
                      errorBorder:const OutlineInputBorder(
                        borderSide:  BorderSide(color: Colors.red, width: 1.0),
                      ),
                      enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(width: 0.5, color: Color(0xFf707070)),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD0D6E0), width: 1.0),
                      ),
                    ),
                    enabled: true,

                  ),
                  SizedBox(height: 25.h,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:AppColor.white,
                        minimumSize: Size(343.w , 40.h),
                        maximumSize: Size(343.w , 40.h),
                        elevation: 2,
                        alignment: AlignmentDirectional.center,
                        padding:  EdgeInsets.all(10.h),
                      ),
                      onPressed: (){
                        getImage();
                      },
                      child: Text(
                        "إضافة صورة للمسار",style: GoogleFonts.tajawal(color: AppColor.black,fontSize:14.sp ),

                      )),
                  Text(
                    "إضافة مسار تعليمي",style: GoogleFonts.tajawal(color: Colors.white,fontSize:14.sp ),

                  ),
                //file ==null? Text("") :Image(image: FileImage(file!)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:const Color(0xFF26B888),
                        minimumSize: Size(343.w , 40.h),
                        maximumSize: Size(343.w , 40.h),
                        elevation: 2,
                        alignment: AlignmentDirectional.center,
                        padding:  EdgeInsets.all(10.h),
                      ),
                      onPressed: (){
                        creatPath();
                      },
                      child: Text(
                        "إضافة مسار تعليمي",style: GoogleFonts.tajawal(color: Colors.white,fontSize:14.sp ),

                      )),
                ],),
            );
          });
    });
  }

 void addNewPath(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCourse()));
 }

 creatPath(){
   AddNewCourseCubit.get(context).creatPath(pathName: _courseName.text, image: file!);
   addNewPath();
       }

  File? file;
  Future<File> getImage() async {
    XFile? pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(()=>file = File(pickedImage.path));
    }
    print(" malsa  FileName is : ${file.toString()}");
    return file!;
  }


}
