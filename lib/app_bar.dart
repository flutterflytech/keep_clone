

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_advanced/app_constants.dart';
import 'package:google_keep_advanced/extensions/breakpoints_extension.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';




// final appBar = AppBar(
//   leadingWidth: 950,
//   leading: Row(
//     children: [
//       const SizedBox(width: 10,),
//       IconButton(
//         padding: const EdgeInsets.all(12),
//         onPressed: (){
//           Scaffold.of(context).openDrawer();
//         },
//           tooltip: 'Main menu',
//           icon: const Icon(Icons.menu,color: Colors.grey,size: 24,)),
//       Image.asset(ImagePaths.appLogo,fit: BoxFit.fill,height: 24,width: 24,),
//      const SizedBox(width: 10,),
//      Text('Notes', style: GoogleFonts.roboto(color: CLR.defaultTextColor,fontSize: 22),),
//       const SizedBox(width: 60,),
//       SearchBar(),
//     ],
//   ),
//
//
//   backgroundColor: Colors.white,
//   bottom: PreferredSize(
//       preferredSize: const Size.fromHeight(1.0),
//   child: Container(
//     color: Colors.grey,
//     height: 1.0,
//   ),
// ),
//
//
//
//
// );


class SearchBar extends StatelessWidget {
   SearchBar({Key? key}) : super(key: key);
 final  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,dimens) {
       double maxWidth = MediaQuery.of(context).size.width;
       if(maxWidth>565){
         return Container(

           width: maxWidth >= 950? 722: maxWidth*0.50,
           margin: const EdgeInsets.only(left: 60),
           height: 48,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(8),
               color: CLR.searchBoxColor
           ),
           child: TextField(
             controller: searchController,
             autofocus: false,
             decoration: InputDecoration(
               hintText: 'Search',
               hintStyle: GoogleFonts.roboto(color: CLR.defaultTextColor,fontSize: 16),
               prefixIcon: IconButton(
                 onPressed: (){

                 },
                 tooltip: 'Search',
                 icon: const Icon(Icons.search,color: CLR.defaultTextColor,),

               ),
               border: InputBorder.none,
             ),

           ),
         );
       }else{
         return Row(
           children: [
             const Spacer(flex: 1,),
             IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: CLR.defaultTextColor,)),
           ],
         );

       }

      }
    );
  }
}
