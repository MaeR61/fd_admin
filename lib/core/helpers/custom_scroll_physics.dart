import 'package:flutter/material.dart';

class MaeRScrollPhysics extends ScrollPhysics {
  final double itemDimension;

  const MaeRScrollPhysics({required this.itemDimension, super.parent});

  @override
  MaeRScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return MaeRScrollPhysics(
      itemDimension: itemDimension,
      parent: buildParent(ancestor),
    );
  }

  double _getPage(ScrollPosition position) {
    return position.pixels / itemDimension;
  }

  double _getPixels(double page) {
    return page * itemDimension;
  }

  double _getTargetPixels(
    ScrollPosition position,
    Tolerance tolerance,
    double velocity,
  ) {
    double page = _getPage(position);
    if (velocity < -tolerance.velocity) {
      page -= 0.1;
    } else if (velocity > tolerance.velocity) {
      page += 0.1;
    }
    return _getPixels(page.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    // If we're out of range and not headed back in range, defer to the parent
    // ballistics, which should put us back in range at a page boundary.
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }
    final Tolerance tolerance = toleranceFor(position);
    final double target = _getTargetPixels(
      position as ScrollPosition,
      tolerance,
      velocity,
    );
    if (target != position.pixels) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}