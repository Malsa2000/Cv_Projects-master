import 'package:cv/Ui/Home/Screen/home_view.dart';
import 'package:cv/Ui/Home/Wdgets/corporate_updates.dart';
import 'package:cv/bloc/cubit_post/cubit.dart';
import 'package:cv/bloc/cubit_post/states.dart';
import 'package:cv/bloc/cubit_singin/cubit.dart';
import 'package:cv/core/colors.dart';
import 'package:cv/core/components.dart';
import 'package:cv/core/string.dart';
import 'package:cv/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

DateTime now = DateTime.now();
String formattedDate = DateFormat('kk:mm EEE d MMM').format(now);


class _AddPostState extends State<AddPost> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CvPostCubit, CvPostStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: CustomText(
                text: "إنشاء منشور",
                fontFamily: "Tajawal",
                fontWeight: FontWeight.w400,
                fontSize: 13,
                colors: Colors.white,
              ),
              actions: [
                Container(
                  alignment: AlignmentDirectional.center,
                  margin:
                      EdgeInsetsDirectional.only(end: 15, top: 20, bottom: 20),
                  width: 80,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: AppColor.white,
                  ),
                  child: GestureDetector(
                    onTap: () {

                        if (CvPostCubit.get(context).postImage == null) {
                          CvPostCubit.get(context).createPost(
                            time: formattedDate,
                            text: textController.text,
                          );
                        } else {
                        CvPostCubit.get(context).uploadPostImage(
                            time: formattedDate,
                            text: textController.text,
                          );


                     // else {
                        // CvPostCubit.get(context).uploadPostVideo(
                        //   time: formattedDate,
                        //   text: textController.text,
                        // );
                      }
                      if (state == CvCreatePostErrorState) {
                        print(
                            "object********************************************");
                      } else {
                        navigateAndFinish(context, HomeView());
                      }
                    },
                    child: Container(
                      child: CustomText(
                        text: "نشر",
                        fontFamily: "Tajawal",
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        colors: AppColor.main,
                      ),
                    ),
                  ),
                )
              ],
              leadingWidth: 90,
              toolbarHeight: 88,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 34,
                    color: AppColor.white,
                  )),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColor.main,
              ),
              elevation: 0,
              backgroundColor: AppColor.main,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            body: Padding(
              padding: const EdgeInsets.all(00.0),
              child: Column(
                children: [
                  if (state is CvCreatePostLoadingState)
                    LinearProgressIndicator(),
                  if (state is CvCreatePostLoadingState)
                    SizedBox(
                      height: 10.0.h,
                    ),
                  Padding(
                    padding:  EdgeInsets.all(10.0.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.p200E32,
                          child: Icon(IconlyLight.user_1, size: 18.h),
                          radius: 25.r,
                        ),
                        SizedBox(
                          width: 15.0.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                '$FirstName $LastName',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColor.black,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                children: [
                                  Text('المتابعين',
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          color: AppColor.black,
                                          fontFamily: 'Tajawal',
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Icon(
                                    IconlyLight.arrow_down_2,
                                    size: 13.h,
                                    color: AppColor.main,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: defaultFormFieldWithOut(
                        controller: textController,
                        MaxLines: 10,
                        color: AppColor.backgroundColorF3,
                        hint: "ما الذي ترغب في نشره   ؟",
                        hintStyle: TextStyle(
                            fontSize: 9.sp,
                            color: AppColor.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400)),
                  )),

                  SizedBox(
                    height: 20.0.h,
                  ),
                  if (CvPostCubit.get(context).postImage != null)
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          height: 140.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              4.0,
                            ),
                            image: DecorationImage(
                              image: FileImage(
                                  CvPostCubit.get(context).postImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: CircleAvatar(
                            radius: 20.0.r,
                            child: Icon(
                              Icons.close,
                              size: 16.0.h,
                            ),
                          ),
                          onPressed: () {
                            CvPostCubit.get(context).removePostImage();
                          },
                        ),
                      ],
                    ),

                  Expanded(
                    child: Container(
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0.r),
                            topRight: Radius.circular(20.0.r),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color:  Color(0x3dc5c5c5),
                              offset: Offset(0, -2),
                              blurRadius: 10.r,
                            ),
                          ],
                        ),
                        child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(34.0, 20.0, 34.0, 00.0.h),
                            child: SizedBox.expand(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        CvPostCubit.get(context).getPostImage();
                                      },
                                      child: bottomsheet(
                                          "أضف صورة أو عدة صور",
                                          IconlyLight.folder),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          // CvPostCubit.get(context)
                                          //     .getPostVideo();
                                        },
                                        child: bottomsheet("أضف فيديو", IconlyLight.video)),
                                    bottomsheet(
                                        "قم بالإشارة إلى أصدقاء أو شركات",
                                        IconlyLight.user),
                                    bottomsheet("شارك بحصولك على وظيفة",
                                        IconlyLight.work),
                                  ],
                                ),
                              ),
                            ))),
                  ),

                ],
              ),
            ));
      },
    );
  }
}

