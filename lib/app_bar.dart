

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_advanced/app_constants.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';




final appBar = AppBar(
  leadingWidth: 200,
  leading: Row(
    children: [
      const SizedBox(width: 10,),
      IconButton(
        padding: const EdgeInsets.all(12),
        onPressed: (){
        },
          tooltip: 'Main menu',
          icon: const Icon(Icons.menu,color: Colors.grey,size: 24,)),
      Image.asset(ImagePaths.appLogo,fit: BoxFit.fill,height: 48,width: 48,),
     Text('Keep', style: GoogleFonts.roboto(color: CLR.defaultTextColor,fontSize: 22),),
    ],
  ),

  backgroundColor: Colors.white,
  bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
  child: Container(
    color: Colors.grey,
    height: 1.0,
  ),
),




);