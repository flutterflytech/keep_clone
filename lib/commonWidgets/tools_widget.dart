import 'package:flutter/material.dart';
import 'package:google_keep_advanced/presentation/archive/archive_cubit.dart';
import 'package:google_keep_advanced/presentation/bin/bin_cubit.dart';
import 'package:provider/provider.dart';

import '../classes/notes.dart';
import '../presentation/notes/notes_cubit.dart';
import '../presentation/notes/notes_page.dart';
import '../utils/alerts_utils.dart';

class ToolsRowWidget extends StatelessWidget {
  final Function(bool) callback;
  const ToolsRowWidget({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///type:1 - Notes
    ///type:2 - Archived notes
    ///type:3 - Deleted notes

    int type = Provider.of<int>(context, listen: false);

    switch (type) {
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  Alerts.showSnackBar('fdkvklv', context);
                }),
            Transform.scale(
              scale: 0.7,
              child: MorePopUpWidget(callback: (value ) =>callback(value),  ),
            ),
          ],
        );
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                icon: Icons.unarchive_outlined,
                toolTip: 'Unarchive',
                onTap: () {
                  Notes note = Provider.of<Notes>(context, listen: false);
                  context.read<ArchiveCubit>().unarchiveNotes(note);
                }),
            TransformSmallScaleWidget(
                icon: Icons.more_vert, toolTip: 'More', onTap: () {}),
          ],
        );
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransformSmallScaleWidget(
                icon: Icons.delete_forever,
                toolTip: 'Delete forever',
                onTap: () {
                  Notes note = Provider.of<Notes>(context, listen: false);
                  context.read<BinCubit>().deletePermanent(note);
                }),
            TransformSmallScaleWidget(
                icon: Icons.restore_from_trash,
                toolTip: 'Restore',
                onTap: () {
                  Notes note = Provider.of<Notes>(context, listen: false);
                  context.read<BinCubit>().restoreNote(note);
                }),
          ],
        );
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                icon: Icons.archive_outlined, toolTip: 'Archive', onTap: () {}),
            TransformSmallScaleWidget(
                icon: Icons.more_vert, toolTip: 'More', onTap: () {}),
          ],
        );
    }
  }
}

class TransformSmallScaleWidget extends StatelessWidget {
  final IconData icon;
  final String toolTip;
  final Function() onTap;

  const TransformSmallScaleWidget(
      {Key? key,
      required this.icon,
      required this.toolTip,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: Icon(
          icon,
        ),
        tooltip: toolTip,
        hoverColor: Colors.black12,
      ),
    );
  }
}
