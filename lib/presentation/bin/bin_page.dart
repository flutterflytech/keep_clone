import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_keep_advanced/presentation/bin/bin_cubit.dart';

import '../../app_constants.dart';
import '../../classes/notes.dart';
import '../../commonWidgets/empty_placeholder.dart';
import '../../commonWidgets/staggered_view.dart';

class BinPage extends StatefulWidget {
  const BinPage({Key? key}) : super(key: key);

  @override
  State<BinPage> createState() => _BinPageState();
}

class _BinPageState extends State<BinPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BinCubit(),
      child: BlocBuilder<BinCubit, BinState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state.listOfDeletedBin.isEmpty? const Center(
                child: EmptyPlaceholderWidget(
                    placeholderText: 'No Notes in  Recycle Bin',
                    icon: CupertinoIcons.trash),
              ):StaggeredNotesView(listOfNotes: state.listOfDeletedBin,),
            ],
          );
        },
      ),
    );
  }
}




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

class ToolsRowWidget extends StatelessWidget {
  const ToolsRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 0.7,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(
              Icons.add_alert_outlined,
            ),
            tooltip: 'Remind me',
            hoverColor: Colors.black12,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_outlined, size: 24),
            tooltip: 'Collaborator',
            hoverColor: Colors.black12,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.color_lens_outlined, size: 24),
            tooltip: 'Background options',
            hoverColor: Colors.black12,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.image_outlined, size: 24),
            tooltip: 'Add image',
            hoverColor: Colors.black12,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.archive_outlined, size: 24),
            tooltip: 'Archive',
            hoverColor: Colors.black12,
          ),
        ),
        Transform.scale(
          scale: 0.7,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 24),
            tooltip: 'More',
            hoverColor: Colors.black12,
          ),
        ),
      ],
    );
  }
}

