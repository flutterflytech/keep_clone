import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../classes/notes.dart';
import 'notes_widget.dart';

class StaggeredNotesView extends StatefulWidget {
  final List<Notes> listOfNotes;

  const StaggeredNotesView({Key? key, required this.listOfNotes})
      : super(key: key);

  @override
  State<StaggeredNotesView> createState() => _StaggeredNotesViewState();
}

class _StaggeredNotesViewState extends State<StaggeredNotesView> {
  int count = 4;

  // getCrossAxisCount(BuildContext context){
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, dimens) {
        double width = MediaQuery.of(context).size.width;
        if (width > 1890) {
          count = 7;
        } else if (width > 1666) {
          count = 6;
        } else if (width > 1444) {
          count = 5;
        } else if (width > 1222) {
          count = 4;
        } else if (width > 1003) {
          count = 3;
        } else if (width > 600) {
          count = 2;
        } else {
          count = 1;
        }

        if (dimens.maxWidth > 610) {
          return Padding(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
            child: MasonryGridView.builder(
              gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              itemCount: widget.listOfNotes.length,
              itemBuilder: (context, index) {
                return NotesCard(notes: widget.listOfNotes[index]);
              },
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.listOfNotes.length,
                itemBuilder: (context, index) {
                  return NotesCard(notes: widget.listOfNotes[index]);
                }),
          );
        }
      }),
    );
  }
}

// class StaggeredNotesView extends StatelessWidget {
//   final List<Notes> listOfNotes;
//   const StaggeredNotesView({
//     Key? key, required this.listOfNotes,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
//               child: MasonryGridView.builder(
//                 gridDelegate:
//                 const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 240),
//                 crossAxisSpacing: 10,
//                 mainAxisSpacing: 10,
//                 shrinkWrap: true,
//                 itemCount: listOfNotes.length,
//                 itemBuilder: (context, index) {
//                   return NotesCard(notes:listOfNotes[index]);
//                 },
//               ),
//             ),
//           );
//   }
// }
