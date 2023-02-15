import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_advanced/commonWidgets/empty_placeholder.dart';
import 'package:google_keep_advanced/presentation/archive/archive_cubit.dart';

import '../../commonWidgets/staggered_view.dart';

class ArchivePage extends StatefulWidget {
  const ArchivePage({Key? key}) : super(key: key);


  @override
  State<ArchivePage> createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArchiveCubit(),
      child: BlocBuilder<ArchiveCubit, ArchiveState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state.listOfArchivedBin.isEmpty? const Center(
                child: EmptyPlaceholderWidget(
                    placeholderText: 'Your archived notes appear here',
                    icon: Icons.archive_outlined),
              ):StaggeredNotesView(listOfNotes: state.listOfArchivedBin,),
            ],
          );
        },
      ),
    );

  }
}
