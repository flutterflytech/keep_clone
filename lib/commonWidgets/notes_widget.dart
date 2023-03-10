import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';
import 'package:provider/provider.dart';

import '../app_constants.dart';
import '../classes/notes.dart';
import '../presentation/notes/notes_cubit.dart';
import '../presentation/notes/notes_page.dart';
import 'tools_widget.dart';

class NotesCard extends StatefulWidget {
  final Notes notes;

  const NotesCard({Key? key, required this.notes}) : super(key: key);

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Theme(
        data: ThemeData(cardColor: Colors.white),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                int type = Provider.of<int>(context, listen: false);
                NotesCubit notesCubit = BlocProvider.of<NotesCubit>(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        insetPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        child: ClipPath(
                          clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: Container(
                            height: null,
                            width: 600,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _titleController
                                    ..text = widget.notes.title,
                                  onTap: () {},
                                  maxLines: null,
                                  autofocus: false,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  onSubmitted: (value) {},
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon:
                                        const Icon(Icons.push_pin_outlined),
                                        tooltip: 'Pin note',
                                      ),
                                      suffixIconConstraints:
                                      BoxConstraints.tight(
                                          const Size(45, 30)),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Title',
                                      hintStyle: context.labelLarge!.copyWith(
                                          color: CLR.defaultTextColor),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                        top: 5,
                                        left: 10,
                                      )),
                                ),
                                TextField(
                                  controller: _bodyController
                                    ..text = widget.notes.body,
                                  maxLines: null,
                                  autofocus: false,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  onTap: () {},
                                  decoration: InputDecoration(
                                      suffixIconConstraints:
                                      BoxConstraints.tight(
                                          const Size(130, 40)),
                                      fillColor: Colors.white,
                                      filled: true,
                                      hintText: 'Take a note...',
                                      hintStyle: context.titleMedium!.copyWith(
                                          color: CLR.defaultTextColor),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, top: 10)),
                                ),
                                Row(
                                  children: [
                                    TransformSmallScaleWidget(
                                        icon: Icons.add_alert_outlined,
                                        toolTip: 'Remind me',
                                        onTap: () {}),
                                    TransformSmallScaleWidget(
                                        icon: Icons.person_add_alt_outlined,
                                        toolTip: 'Collaborator',
                                        onTap: () {}),
                                    TransformSmallScaleWidget(
                                        icon: Icons.color_lens_outlined,
                                        toolTip: 'Background options',
                                        onTap: () {}),
                                    TransformSmallScaleWidget(
                                        icon: Icons.archive_outlined,
                                        toolTip: 'Archive',
                                        onTap: () {
                                          // Notes note = Provider.of<Notes>(context, listen: false);
                                          // context.read<NotesCubit>().moveToArchive(note);
                                        }),
                                    Transform.scale(
                                      scale: 0.7,
                                      child: const MorePopUpWidget(),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    TextButton(
                                        onPressed: () {

                                          if(type==1){
                                            Notes note = Notes(_titleController.text, _bodyController.text);
                                            int key = widget.notes.key;

                                           notesCubit.editNotes(note,key);

                                          }
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                            fixedSize: const Size(87, 30),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(4)),
                                            foregroundColor: Colors.black),
                                        child: Text(
                                          'Close',
                                          style: context.labelLarge,
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );

                    });
              },
              child: Card(
                elevation: isHovered ? 5 : 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: isHovered
                          ? Border.all(color: Colors.white)
                          : Border.all(color: CLR.notesBorderColor)),
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
                              style: context.titleLarge,
                            ),
                            Text(
                              widget.notes.body,
                              style: context.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      isHovered
                          ? Provider<Notes>(
                              create: (_) => widget.notes,
                              child: const ToolsRowWidget())
                          : const SizedBox(
                              height: 40,
                            ),
                    ],
                  ),
                ),
              ),
            ),
            isHovered
                ? Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 16.0,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
