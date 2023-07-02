
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ControllerHelp on BuildContext{

 void snackBar({required String massage , bool error =false}){
   ScaffoldMessenger.of(this).showSnackBar(
     SnackBar(content: Text(massage ,style: GoogleFonts.cairo(fontSize: 16 )),
       backgroundColor:error == true ? Color(0xFFF6041D) :Color(0xFF0B9109),
       elevation: 2,
       duration: Duration(seconds: 2),),
   );
   }
}