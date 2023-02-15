import 'package:flutter/material.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';

import '../app_constants.dart';

class EmptyPlaceholderWidget extends StatelessWidget {
  final String placeholderText;
  final IconData icon;
  const EmptyPlaceholderWidget({Key? key, required this.placeholderText, required this.icon}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 120,color: Colors.grey.shade300,),
        const SizedBox(height: 40,),
        Text(placeholderText,style: context.titleLarge!.copyWith(color: CLR.defaultTextColor),)
      ],
    );
  }
}
