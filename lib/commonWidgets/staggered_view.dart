import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../classes/notes.dart';
import '../presentation/bin/bin_page.dart';

class StaggeredNotesView extends StatelessWidget {
  final List<Notes> listOfNotes;
  const StaggeredNotesView({
    Key? key, required this.listOfNotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: MasonryGridView.builder(
                gridDelegate:
                const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 260),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                itemCount: listOfNotes.length,
                itemBuilder: (context, index) {
                  return NotesCard(notes:listOfNotes[index]);
                },
              ),
            ),
          );
  }
}