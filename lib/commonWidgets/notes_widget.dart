import 'package:flutter/material.dart';

import '../app_constants.dart';
import '../classes/notes.dart';
import '../presentation/notes/notes_page.dart';
import 'tools_widget.dart';

class NotesCard extends StatelessWidget {
  final Notes notes;

  const NotesCard({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 104,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: CLR.notesBorderColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  notes.title,
                ),
                Text(
                  notes.body,
                ),
              ],
            ),
          ),
          // const Spacer(
          //   flex: 1,
          // ),
          const ToolsRowWidget(),
        ],
      ),
    );
  }
}