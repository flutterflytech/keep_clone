import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';
import 'package:google_keep_advanced/presentation/notes/notes_cubit.dart';
import 'package:provider/provider.dart';

import '../../app_constants.dart';
import '../../classes/notes.dart';
import '../../commonWidgets/empty_placeholder.dart';
import '../../commonWidgets/staggered_view.dart';
import '../../commonWidgets/tools_widget.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TakeNoteField(
                titleController: _titleController,
                bodyController: _bodyController,
              ),
              state.listOfNotes.isEmpty
                  ? const Spacer(
                flex: 1,
              )
                  : const SizedBox(),
              state.listOfNotes.isEmpty
                  ? const Center(
                child: EmptyPlaceholderWidget(
                    placeholderText: 'Notes you add appear here',
                    icon: Icons.lightbulb_outline),
              ):Provider<int>(
                  create: (_) => 1,
                  child: StaggeredNotesView(
                    listOfNotes: state.listOfNotes,
                  )),
              state.listOfNotes.isEmpty
                  ? const Spacer(
                flex: 1,
              )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

class TakeNoteField extends StatefulWidget {
  final TextEditingController titleController;

  final TextEditingController bodyController;

  const TakeNoteField(
      {Key? key, required this.titleController, required this.bodyController})
      : super(key: key);

  @override
  State<TakeNoteField> createState() => _TakeNoteFieldState();
}

class _TakeNoteFieldState extends State<TakeNoteField> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          child: Container(
            height: isExpanded ? null : 48,
            width: dimens.maxWidth >= 700 ? 600 : 400,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: isExpanded,
                  child: TextField(
                    controller: widget.titleController,
                    onTap: () {},
                    maxLines: null,
                    autofocus: false,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    onSubmitted: (value) {},
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.push_pin_outlined),
                          tooltip: 'Pin note',
                        ),
                        suffixIconConstraints:
                            BoxConstraints.tight(const Size(45, 30)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Title',
                        hintStyle: context.labelLarge!.copyWith(color: CLR.defaultTextColor),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                          top: 5,
                          left: 10,
                        )),
                  ),
                ),
                TextField(
                  controller: widget.bodyController,
                  maxLines: null,
                  autofocus: false,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  onTap: () {
                    setState(() {
                      isExpanded = true;
                    });
                  },
                  decoration: InputDecoration(
                      suffixIcon: isExpanded
                          ? const SizedBox()
                          : Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.check_box_outlined),
                                  tooltip: 'New list',
                                  hoverColor: Colors.black12,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.brush),
                                  tooltip: 'New note with drawing',
                                  hoverColor: Colors.black12,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.image_outlined),
                                  tooltip: 'New note with image',
                                  hoverColor: Colors.black12,
                                ),
                              ],
                            ),
                      suffixIconConstraints:
                          BoxConstraints.tight(const Size(130, 40)),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Take a note...',
                      hintStyle: context.titleMedium!.copyWith(color: CLR.defaultTextColor),

                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 10, top: 10)),
                ),
                Visibility(
                  visible: isExpanded,
                  child: Row(
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
                            Notes note = Provider.of<Notes>(context, listen: false);
                            context.read<NotesCubit>().moveToArchive(note);
                          }),
                      Transform.scale(
                        scale: 0.7,
                        child: const MorePopUpWidget(),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      BlocBuilder<NotesCubit, NotesState>(
                        builder: (context, state) {
                          return TextButton(
                              onPressed: () {
                                if (widget.titleController.text.isNotEmpty ||
                                    widget.bodyController.text.isNotEmpty) {
                                  context.read<NotesCubit>().createNote(Notes(
                                      widget.titleController.text,
                                      widget.bodyController.text));
                                  widget.bodyController.clear();
                                  widget.titleController.clear();
                                }
                                setState(() {
                                  isExpanded = false;
                                });
                              },
                              style: TextButton.styleFrom(
                                fixedSize: const Size(87, 30),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                
                                  foregroundColor: Colors.black),
                              child:  Text('Close',style: context.labelLarge,));
                        },
                      ),
                      const SizedBox(width: 10,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class MorePopUpWidget extends StatefulWidget {
  const MorePopUpWidget({Key? key}) : super(key: key);

  @override
  State<MorePopUpWidget> createState() => _MorePopUpWidgetState();
}

class _MorePopUpWidgetState extends State<MorePopUpWidget> {
  final List<String> _list = [
    'Delete note',
    'Add label',
    'Add drawing',
    'Make a copy',
    'Show checkboxes',
    'Copy to Google Docs'
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.white,splashColor: Colors.black12,),
      child: PopupMenuButton(
        tooltip: 'More',
        color: Colors.white,
        elevation: 5,
        splashRadius: 20,
        padding: EdgeInsets.zero,
        surfaceTintColor:Colors.black12,
        position: PopupMenuPosition.under,
        constraints: const BoxConstraints(maxHeight: 204, maxWidth: 163),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (index) {
          if (index == 0) {
            Notes note = Provider.of<Notes>(context, listen: false);
            context.read<NotesCubit>().moveToBin(note);
          }
        },
        onCanceled: (){

        },
        initialValue: 0,
        itemBuilder: (context) {
          return List.generate(_list.length, (index) {
            return _buildPopMenuItem(_list[index], index, context);
          });
        },
        icon: const Icon(
          Icons.more_vert,
          size: 24,
          color: Colors.black,
        ),
      ),
    );
  }

  PopupMenuItem _buildPopMenuItem(
      String name, int index, BuildContext context) {
    return PopupMenuItem(
      value: index,
      height: 30,
      child: Text(
        name,
        style: context.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}

