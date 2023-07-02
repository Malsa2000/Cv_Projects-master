import 'package:cv/bloc/cubit_trainer_profile/cubit.dart';
import 'package:cv/core/controller_helper.dart';
import 'package:cv/modle/followers_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/cubit_trainer_profile/state.dart';
class TrainerProfile extends StatefulWidget {
  TrainerProfile({Key? key}) : super(key: key);

  @override
  State<TrainerProfile> createState() => _ProfileState();
}

class _ProfileState extends State<TrainerProfile> {
  List<FollowersType> _type = <FollowersType>[
    FollowersType(id: 1, name: "Gaza"),
    FollowersType(id: 2, name: "Nabls"),
    FollowersType(id: 3, name: "betlahem"),
    FollowersType(id: 3, name: "hebron"),

  ];

  int? _id ;
  String? imageUrl ;

  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _email;
  late TextEditingController _phoneNumber;
  late TextEditingController _descriptionJob;

Widget lodingState(){
  return const CircularProgressIndicator(
    color: Colors.green,
  );

}

  Widget createState(){
    return const CircularProgressIndicator(
      color: Colors.green,
    );

  }

@override
  void initState() {
    super.initState();
    _firstName = TextEditingController();
    _descriptionJob = TextEditingController();
    _phoneNumber = TextEditingController();
    _email = TextEditingController();
    _lastName = TextEditingController();

  }
  @override
  void dispose() {
    _firstName.dispose();
    _descriptionJob.dispose();
    _phoneNumber.dispose();
    _email.dispose();
    _lastName.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocConsumer<TrainerProfileCubit,TrainerProfileStates>(
        builder: (BuildContext context, state) {
          if(state is CreateTrainerProfileLodingState){
            return lodingState();
          }
          else if(state is CreateTrainerProfileErrorState){

          }
           else{

          }
          return ListView(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 16.w,top: 50.h,right: 16.w),
                  height: 154.h,
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    color:const Color(0xFF26B888),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r)),
                  ),
                  child:
                  Column(children: [
                    Text(
                      "تعديل الملف الشخصي" ,style :GoogleFonts.cairo(fontSize :13.sp ,fontWeight: FontWeight.w600 ,
                        color : Colors.white),textAlign: TextAlign.center,),
                    Stack(
                        children:[
                          CircleAvatar(
                            radius: 25.r,
                            backgroundColor:const Color(0xFFF2F2F3),
                            child: Image(
                              height: 36.h,
                              fit: BoxFit.contain,
                              width: 43.w,
                              image:AssetImage('images/post.png') ,),
                            //backgroundImage:
                          ),
                          Positioned(
                              left: 37.w,
                              top: 5.h,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushReplacementNamed(context,  "/short_quize");

                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 23.w,
                                    height: 23.h,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFF26B888)),
                                      borderRadius: BorderRadius.all(Radius.circular(11.r)),
                                      color: Colors.white,),
                                    child:Icon( Icons.camera_alt_outlined,size: 15.h,color: Color(0xFF26B888),)
                                ),
                              ))
                        ]
                    ),


                  ],)

              ),
              Container(
                margin: EdgeInsets.only(top: 24.h,left: 16.w ,right: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 12.w ,vertical: 17.h),
                color: Colors.white,

                child: ListView(
                  shrinkWrap: true,
                  children: [

                    Text(
                      "الملعومات الاساسية" ,style :GoogleFonts.cairo(fontSize :12.sp ,fontWeight: FontWeight.w400 ,
                        color : Colors.black),textAlign: TextAlign.start,),
                    Divider(color:const Color(0xFFD0D6E0),height: 15.h ,endIndent: 12 ,indent: 12,thickness: 0.25,),
                    SizedBox(height: 20.h,),
                    TextField(
                      controller: _firstName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "الاسم الأول",
                        hintStyle: TextStyle(
                            color:const Color(0xFFD0D6E0) , fontSize: 13.sp ),
                        constraints: BoxConstraints(
                            maxHeight: 48.h ,maxWidth: 318.w),
                        errorBorder:const OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.red, width: 1.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5, color: Color(0xFFD0D6E0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD0D6E0), width: 1.0),
                        ),
                      ),
                      enabled: true,

                    ),
                    SizedBox(height: 18.h,),
                    TextField(
                      controller: _lastName,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "الاسم الاخير",
                        hintStyle: TextStyle(
                            color:const Color(0xFFD0D6E0) , fontSize: 13.sp ),
                        constraints: BoxConstraints(
                            maxHeight: 48.h ,maxWidth: 318.w),
                        errorBorder:const OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.red, width: 1.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5, color: Color(0xFFD0D6E0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD0D6E0), width: 1.0),
                        ),
                      ),
                      enabled: true,

                    ),
                    SizedBox(height: 18.h,),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "البريد الالكتروني",
                        hintStyle: TextStyle(
                            color:const Color(0xFFD0D6E0) , fontSize: 13.sp ),
                        constraints: BoxConstraints(
                            maxHeight: 48.h ,maxWidth: 318.w),
                        errorBorder:const OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.red, width: 1.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5, color: Color(0xFFD0D6E0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD0D6E0), width: 1.0),
                        ),
                      ),
                      enabled: true,

                    ),
                    SizedBox(height: 18.h,),
                    Row(
                      children: [
                        Container(
                          height:48.h ,
                          margin: EdgeInsets.only(right: 7.w),
                          alignment: Alignment.center,
                          width: 48.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.r)),
                              border: Border.all(color:const Color(0xFFD0D6E0) ,width: 0.25)),
                          child: DropdownButton<int>(
                              icon: const Icon(Icons.arrow_drop_down_sharp ,color: Colors.grey,size: 20,),
                              isExpanded: true,
                              underline:   Container(color: Colors.transparent),
                              style: GoogleFonts.tajawal(fontSize: 14 ,fontWeight: FontWeight.w400 ,color: Color(0XFFD0D6E0)),
                              value: _id ,
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
                        TextField(
                          controller: _phoneNumber,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "رقم الموبايل ",
                            hintStyle: TextStyle(
                                color:const Color(0xFFD0D6E0) , fontSize: 13.sp ),
                            constraints: BoxConstraints(
                                maxHeight: 48.h ,maxWidth: 260.w ,minWidth: 260.w),
                            errorBorder:const OutlineInputBorder(
                              borderSide:  BorderSide(color: Colors.red, width: 1.0),
                            ),
                            enabledBorder:const OutlineInputBorder(
                              borderSide: BorderSide(width: 0.5, color: Color(0xFFD0D6E0)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFD0D6E0), width: 1.0),
                            ),
                          ),
                          enabled: true,

                        ),
                      ],
                    ),
                    SizedBox(height: 18.h,),
                    TextField(
                      controller: _descriptionJob,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "الوصف الوظيفيي",
                        hintStyle: TextStyle(
                            color:const Color(0xFFD0D6E0) , fontSize: 13.sp ),
                        constraints: BoxConstraints(
                            maxHeight: 48.h ,maxWidth: 318.w),
                        errorBorder:const OutlineInputBorder(
                          borderSide:  BorderSide(color: Colors.red, width: 1.0),
                        ),
                        enabledBorder:const OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5, color: Color(0xFFD0D6E0)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD0D6E0), width: 1.0),
                        ),
                      ),
                      enabled: true,

                    ),
                    Container(
                      margin: EdgeInsets.only(top: 18.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      height:48.h ,
                      width: 318.5.w,
                      decoration: BoxDecoration(border: Border.all(color:const Color(0xFFD0D6E0) ,width: 0.25)),
                      child: DropdownButton<int>(
                          icon: const Icon(Icons.arrow_drop_down_sharp ,color: Colors.black,size: 20,),
                          isExpanded: true,
                          underline:   Container(color: Colors.transparent),
                          hint: const Text("الدولة ",style: TextStyle(color: Color(0XFFD0D6E0)),),
                          style: GoogleFonts.tajawal(fontSize: 14 ,fontWeight: FontWeight.w400 ,color:Color(0XFFD0D6E0)),
                          value: _id ,
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
                    Container(
                      margin: EdgeInsets.only(top: 18.h ,bottom: 20.h),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      height:48.h ,
                      width: 318.5.w,
                      decoration: BoxDecoration(border: Border.all(color:const Color(0xFFD0D6E0) ,width: 0.25)),
                      child: DropdownButton<int>(
                          icon: const Icon(Icons.arrow_drop_down_sharp ,color: Colors.black,size: 20,),
                          isExpanded: true,
                          underline:   Container(color: Colors.transparent),
                          hint: const Text("المدينة",style: TextStyle(color: Color(0XFFD0D6E0))),
                          style: GoogleFonts.tajawal(fontSize: 14 ,fontWeight: FontWeight.w400 ,color:Color(0XFFD0D6E0)),
                          value: _id ,
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
                          CreateNewTrainerProfile();
                        },
                        child: Text(
                          "تسجيل مدرب جديد",style: GoogleFonts.tajawal(color: Colors.white,fontSize:14.sp ),

                        )),

                  ],
                ),
              )
            ],);
        },
        listener: (BuildContext context, Object? state) {},

      ) ,
    );
  }

 void CreateNewTrainerProfile(){
       if(checkData()){
         return createTrainer();
       }
  }
  bool checkData() {
    if (_firstName.text.isNotEmpty &&
        _lastName.text.isNotEmpty &&
        _email.text.isNotEmpty &&
        _phoneNumber.text.isNotEmpty &&
        _descriptionJob.text.isNotEmpty) {

      return true;
    }
    else {
      context.snackBar(massage: " Trainer profile faild",error: true);
      return false;
    }
  }
  createTrainer(){
    TrainerProfileCubit.get(context).trainerProfileCreate(
        firstName: _firstName.text, lastName: _lastName.text,
        email: _email.text, phoneNumer: _phoneNumber.text,
        description: _descriptionJob.text , city:
        "Gaza", country: "palestine");

        }
}
