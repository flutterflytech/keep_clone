import 'package:flutter/material.dart';
import 'package:google_keep_advanced/commonWidgets/empty_placeholder.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';

import '../../app_constants.dart';

class RemainderPage extends StatefulWidget {
  const RemainderPage({Key? key}) : super(key: key);

  @override
  State<RemainderPage> createState() => _RemainderPageState();
}

class _RemainderPageState extends State<RemainderPage> {
  @override
  Widget build(BuildContext context) {

    return const Center(
      child: EmptyPlaceholderWidget(placeholderText: 'Notes with upcoming remainders appear here', icon: Icons.notifications_none),
    );
  }
}

