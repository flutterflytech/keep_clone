import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToolsRowWidget extends StatelessWidget {
  const ToolsRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int type = Provider.of<int>(context,listen: false);
    switch(type){
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransformSmallScaleWidget(
                icon: Icons.add_alert_outlined, toolTip: 'Remind me', onTap: () {}),
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
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransformSmallScaleWidget(
                icon: Icons.add_alert_outlined, toolTip: 'Remind me', onTap: () {}),
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
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransformSmallScaleWidget(
                icon: Icons.add_alert_outlined, toolTip: 'Remind me', onTap: () {}),
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
      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TransformSmallScaleWidget(
                icon: Icons.add_alert_outlined, toolTip: 'Remind me', onTap: () {}),
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