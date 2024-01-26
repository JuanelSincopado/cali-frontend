import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomExpansionPanel extends StatelessWidget {
  const CustomExpansionPanel({
    super.key,
    this.color = const Color(0xFFE6EFFD),
    this.childColor = const Color(0xFFE6EFFD),
    required this.title,
    required this.child,
  });

  final Color color;
  final String title;
  final Widget child;
  final Color childColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color,
      child: ExpandableNotifier(
        initialExpanded: false,
        child: ExpandablePanel(
          header: Container(
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xFF1E4B84),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          collapsed: Container(),
          expanded: Container(
            color: childColor,
            width: double.infinity,
            child: child,
          ),
        ),
      ),
    );
  }
}
