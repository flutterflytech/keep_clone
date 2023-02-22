import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';
import 'package:google_keep_advanced/presentation/bin/bin_cubit.dart';
import 'package:provider/provider.dart';

import '../../app_constants.dart';
import '../../classes/notes.dart';
import '../../commonWidgets/empty_placeholder.dart';
import '../../commonWidgets/staggered_view.dart';
import '../../commonWidgets/tools_widget.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Notes in the Recycle Bin are deleted after 7 days.',
                      style: context.titleMedium!
                          .copyWith(fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    state.listOfDeletedBin.isNotEmpty
                        ? TextButton(
                            onPressed: () {

                              context.read<BinCubit>().cleanBin();
                            },
                      style: TextButton.styleFrom(
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.white,
                        backgroundColor: Colors.white,

                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            
                        ),


                      ),
                            child: Text(
                              'Empty Bin',
                              style: context.titleSmall!
                                  .copyWith(color: Colors.blue),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              state.listOfDeletedBin.isEmpty
                  ? const Spacer(
                      flex: 1,
                    )
                  : const SizedBox(),
              state.listOfDeletedBin.isEmpty
                  ? const EmptyPlaceholderWidget(
                      placeholderText: 'No Notes in  Recycle Bin',
                      icon: CupertinoIcons.trash)
                  : Provider<int>(
                create:(_)=>3,
                    child: StaggeredNotesView(
                        listOfNotes: state.listOfDeletedBin,
                      ),
                  ),
              state.listOfDeletedBin.isEmpty
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




