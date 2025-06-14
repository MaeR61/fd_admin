import 'package:fd_admin/app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class MaeRCurvedEdgesWidget extends StatelessWidget {
  const MaeRCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: MaeRCustomCurvedEdges(), child: child);
  }
}