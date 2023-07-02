import 'package:cv/Ui/course/widget/add_new_lectues.dart';
import 'package:cv/Ui/course/widget/detials.dart';
import 'package:cv/Ui/course/widget/general_description.dart';
import 'package:cv/modle/trainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CouresDetailes extends StatefulWidget {
  CouresDetailes({Key? key, required this.CourseObject ,required this.courseId,
  required this.pathId}) : super(key: key);
  Map<String ,AddNewCourse> CourseObject;
  String pathId,courseId;

  @override
  State<CouresDetailes> createState() => _CouresDetailesState();
}

class _CouresDetailesState extends State<CouresDetailes> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor:const Color(0xFF26B888),
            tabs: [Text("التفاصيل" ,style :GoogleFonts.tajawal(fontSize :12.sp ,fontWeight: FontWeight.w600 ,
                color : Colors.black)),
              Text("الوصف العام", style :GoogleFonts.tajawal(fontSize :12.sp ,fontWeight: FontWeight.w600 ,
                  color : Colors.black)),
              Text("الدروس", style :GoogleFonts.tajawal(fontSize :12.sp ,fontWeight: FontWeight.w600 ,
                  color : Colors.black)),
              Text("الطلاب", style :GoogleFonts.tajawal(fontSize :12.sp ,fontWeight: FontWeight.w600 ,
                  color : Colors.black)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
             detiles(widget.CourseObject),
             GeneralDescription(widget.CourseObject),
            AddNewLectures(widget.pathId ,widget.courseId),
            Container(

            ),
          ],
        )
    );
  }
}
