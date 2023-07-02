import 'package:cv/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class AddNewQuiz extends StatelessWidget {
   AddNewQuiz({Key? key}) : super(key: key);
  TextEditingController _titleQustion =TextEditingController();
   TextEditingController _answerQustion =TextEditingController();
   List<String> answerProparity = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Text("السؤال الأول"),
        Divider(color: AppColor.grayishblue99a0aa,height: 20.h,thickness: 0.5,endIndent: 10,indent: 10,),
        TextField(
          controller: _titleQustion,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "اكتب هنا السؤال الأول",
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

        Text("الخيارات"),
        ListView.builder(
          itemCount: answerProparity.length,
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
          return Container(
            alignment: Alignment.centerRight,
            height: 38.h,
            width: 322.w,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 0.3, color:const Color(0xFf707070))
            ),
            child: Text(answerProparity[index]),
          );
        }),
        Row(children: [
          TextField(
            controller: _answerQustion,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "اكتب هنا السؤال الأول",
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
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF26B888),
                minimumSize: Size(38.w, 38.h),
                maximumSize: Size(38.w, 38.h),
                elevation: 2,
                alignment: AlignmentDirectional.center,
                padding: EdgeInsets.all(10.h),
              ),
              onPressed: ()=> addQustion(context),
              child: Text(
                "+",
                style: GoogleFonts.tajawal(
                    color: Colors.white, fontSize: 18.sp),
              )),
        ],),

        SizedBox(height: 20.h,),
      ],),
    );
  }

   addQustion(BuildContext context){
        String answer = _answerQustion.text;
        answerProparity.add(answer);
   }
}
