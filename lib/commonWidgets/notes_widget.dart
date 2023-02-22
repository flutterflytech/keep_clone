import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_constants.dart';
import '../classes/notes.dart';
import 'tools_widget.dart';

class NotesCard extends StatefulWidget {
  final Notes notes;

  const NotesCard({Key? key, required this.notes}) : super(key: key);

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = !isHovered;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = !isHovered;
        });
      },
      child: Theme(
        data: ThemeData(cardColor: Colors.white),
        child: Stack(
          children: [
            Card(
              elevation: isHovered?5:0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

              child: Container(
                width: 240,

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: isHovered?Border.all(color: Colors.white):Border.all(color: CLR.notesBorderColor)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            widget.notes.title,
                          ),
                          Text(
                            widget.notes.body,
                          ),
                        ],
                      ),
                    ),
                    isHovered
                        ? Provider<Notes>(
                            create: (_) => widget.notes, child: const ToolsRowWidget())
                        : const SizedBox(
                            height: 40,
                          ),
                  ],
                ),
              ),
            ),
            isHovered?Container(height: 20,width: 20,
            decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)),

            child: const Icon(Icons.check,color: Colors.white,size: 16.0,),):SizedBox(),
          ],
        ),
      ),
    );
  }
}
