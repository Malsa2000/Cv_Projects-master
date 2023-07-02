import 'package:cv/Ui/NavBar/navbar.dart';
import 'package:cv/Ui/Room/room_details.dart';
import 'package:cv/Ui/Room/voice_screen.dart';
import 'package:cv/Ui/SingIn/singin.dart';
import 'package:cv/Ui/Splash_Screen/splash_Screen.dart';
import 'package:cv/Ui/course/all_course.dart';
import 'package:cv/Ui/create_new_course/add_new_course.dart';
import 'package:cv/Ui/test.dart';
import 'package:cv/Ui/trainer_profile/profile.dart';
import 'package:cv/bloc/cubit_add_new_course/cubit.dart';
import 'package:cv/bloc/cubit_navbar/cubit.dart';
import 'package:cv/bloc/cubit_navbar/states.dart';
import 'package:cv/bloc/cubit_post/cubit.dart';
import 'package:cv/bloc/cubit_post/states.dart';
import 'package:cv/bloc/cubit_trainer_profile/cubit.dart';
import 'package:cv/core/cache_helper.dart';
import 'package:cv/core/components.dart';
import 'package:cv/firebase_options.dart';
import 'package:cv/test_malsa.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var FirstName;

var LastName;
var UId;
var ImagePer;

//Definition of Firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  //var token = await FirebaseMessaging.instance.getToken();
  // print('#########################' + token);

  // // foreground fcm
  // FirebaseMessaging.onMessage.listen((event) {
  //   print('on message');
  //   print(event.data.toString());
  //
  //   showToast(
  //     text: 'on message',
  //     state: ToastStates.SUCCESS,
  //   );
  // });

  // when click on notification to open app
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('on message opened app');
  //   print(event.data.toString());
  //   showToast(
  //     text: 'on message opened app',
  //     state: ToastStates.SUCCESS,
  //   );
  // });

  // background fcm
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //
  //
  // bool isDark = CacheHelper.getData(key: 'isDark');
  //
  Widget widget;

  uId = CacheHelper.getData(key: 'uid');

  if (uId != null) {
    widget = NavBarLayout();
  } else {
    widget = SingIn();
    print("uid : /*/*/*/*/$uId");
  }

  runApp(MyApp(
    // isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  //required this.startWidget

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 814),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (BuildContext context) =>
                  SocialCubit()
                    ..getUserData()

              ),
              BlocProvider(
                create: (BuildContext context) =>
                CvPostCubit()
                  ..getPosts(),
              ),
              BlocProvider(
                  create: (BuildContext context) => TrainerProfileCubit()
              ),
              BlocProvider(
                  create: (BuildContext context) => AddNewCourseCubit()
              ),
            ],
            child:
            BlocConsumer<SocialCubit, SocialStates>(listener: (context, state) {

              FirstName = SocialCubit
                  .get(context)
                  .user!
                  .firstname;
              LastName = SocialCubit
                  .get(context)
                  .user!
                  .lastName;
              UId = SocialCubit
                  .get(context)
                  .user!
                  .uId;
              ImagePer = SocialCubit
                  .get(context)
                  .user!
                  .image;
              print(FirstName);
            }, builder: (context, state) {
              return MaterialApp(
                title: 'CV',
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('ar', 'AE'),
                ],
                //home: startWidget,
                home: AddPath(),
              );
            }));
      },
    );
  }
}
