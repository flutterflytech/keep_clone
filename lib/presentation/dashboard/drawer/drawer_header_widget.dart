import 'package:flutter/material.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';

import '../../../app_constants.dart';

class DrawerHeaderWidget extends StatelessWidget {

  const DrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 200,
      child: DrawerHeader(child: Column(
        children: [
          Image.asset(ImagePaths.appLogo,height: 130,width: 130,),
          const SizedBox(width: 40,),
          Text('Notes',style: context.headlineMedium,)
        ],
      ),),
    );
  }
}
