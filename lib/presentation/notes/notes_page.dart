import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_keep_advanced/commonWidgets/empty_placeholder.dart';
import 'package:google_keep_advanced/presentation/notes/notes_cubit.dart';
import 'package:provider/provider.dart';

import '../../app_constants.dart';
import '../../classes/notes.dart';
import '../../commonWidgets/notes_widget.dart';
import '../../commonWidgets/tools_widget.dart';
import '../../utils/alerts_utils.dart';

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
            children: [
              const SizedBox(
                height: 20,
              ),
              TakeNoteField(
                titleController: _titleController,
                bodyController: _bodyController,
              ),
              Provider<int>(
                create: (_)=>1,
                  child: const StaggeredNotesView())
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
                          icon: Icon(Icons.push_pin_outlined),
                          tooltip: 'Pin note',
                        ),
                        suffixIconConstraints:
                            BoxConstraints.tight(const Size(45, 30)),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Title',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
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
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 10, top: 10)),
                ),
                Visibility(
                  visible: isExpanded,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_alert_outlined),
                        tooltip: 'New list',
                        hoverColor: Colors.black12,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.person_add_alt_outlined),
                        tooltip: 'New note with drawing',
                        hoverColor: Colors.black12,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.color_lens_outlined),
                        tooltip: 'New note with image',
                        hoverColor: Colors.black12,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.image_outlined),
                        tooltip: 'New note with image',
                        hoverColor: Colors.black12,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.archive_outlined),
                        tooltip: 'New note with image',
                        hoverColor: Colors.black12,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_vert),
                        tooltip: 'New note with image',
                        hoverColor: Colors.black12,
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
                                  foregroundColor: Colors.black),
                              child: const Text('Close'));
                        },
                      )
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

class StaggeredNotesView extends StatelessWidget {
  const StaggeredNotesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state.listOfNotes.isEmpty) {
          return const Expanded(
              child: EmptyPlaceholderWidget(
                  placeholderText: 'Notes you add appear here',
                  icon: Icons.lightbulb_outline));
        } else {
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
                itemCount: state.listOfNotes.length,
                itemBuilder: (context, index) {
                  return NotesCard(notes: state.listOfNotes[index]);
                },
              ),
            ),
          );
        }
      },
    );
  }
}
//
// class NotesCard extends StatelessWidget {
//   final Notes notes;
//
//   const NotesCard({Key? key, required this.notes}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //height: 104,
//       clipBehavior: Clip.antiAlias,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: CLR.notesBorderColor)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               children: [
//                 Text(
//                   notes.title,
//                 ),
//                 Text(
//                   notes.body,
//                 ),
//               ],
//             ),
//           ),
//           // const Spacer(
//           //   flex: 1,
//           // ),
//           Provider(
//             create: (_)=>notes,
//               child: const ToolsRowWidget()
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ToolsRowWidget extends StatelessWidget {
//   const ToolsRowWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Transform.scale(
//           scale: 0.7,
//           child: IconButton(
//             padding: EdgeInsets.zero,
//             onPressed: () {},
//             icon: const Icon(
//               Icons.add_alert_outlined,
//             ),
//             tooltip: 'Remind me',
//             hoverColor: Colors.black12,
//           ),
//         ),
//         Transform.scale(
//           scale: 0.7,
//           child: IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.person_add_alt_outlined, size: 24),
//             tooltip: 'Collaborator',
//             hoverColor: Colors.black12,
//           ),
//         ),
//         Transform.scale(
//           scale: 0.7,
//           child: IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.color_lens_outlined, size: 24),
//             tooltip: 'Background options',
//             hoverColor: Colors.black12,
//           ),
//         ),
//         Transform.scale(
//           scale: 0.7,
//           child: IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.image_outlined, size: 24),
//             tooltip: 'Add image',
//             hoverColor: Colors.black12,
//           ),
//         ),
//         Transform.scale(
//           scale: 0.7,
//           child: IconButton(
//             onPressed: () {
//               Notes note = Provider.of<Notes>(context,listen: false);
//               context.read<NotesCubit>().moveToArchive(note);
//               Alerts.showSnackBar('fdkvklv', context);
//             },
//             icon: const Icon(Icons.archive_outlined, size: 24),
//             tooltip: 'Archive',
//             hoverColor: Colors.black12,
//           ),
//         ),
//         Transform.scale(
//           scale: 0.7,
//           child: CustomPopUpWidget(),
//         ),
//       ],
//     );
//   }
// }

class CustomPopUpWidget extends StatelessWidget {
 CustomPopUpWidget({Key? key}) : super(key: key);
  final List<String> _list = [
    'Delete note',
    'Add label',
    'Add drawing',
    'Make a copy',
    'Show tick boxes',
    'Copy to Google Docs'

  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'More',
      onSelected: (index){
        if(index==0){

          Notes note = Provider.of<Notes>(context,listen: false);
          context.read<NotesCubit>().moveToBin(note);
          
        }
        
      },

      itemBuilder: (context) {
        return List.generate(5, (index) {
          return _buildPopMenuItem(_list[index],index);
        });
      },
      icon: const Icon(Icons.more_vert, size: 24),
    );
  }

 PopupMenuItem _buildPopMenuItem(String name,int index){
    return PopupMenuItem(child: Text(name),
    value: index,);

  }
}
