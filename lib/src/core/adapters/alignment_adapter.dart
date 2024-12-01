import '../alignment.dart';
import 'package:jaspr/jaspr.dart';

/// Converts MainAxisAlignment to JustifyContent
extension MainAxisAlignmentAdapter on MainAxisAlignment {
  JustifyContent toJustifyContent() {
    switch (this) {
      case MainAxisAlignment.start:
        return JustifyContent.start;
      case MainAxisAlignment.end:
        return JustifyContent.end;
      case MainAxisAlignment.center:
        return JustifyContent.center;
      case MainAxisAlignment.spaceBetween:
        return JustifyContent.spaceBetween;
      case MainAxisAlignment.spaceAround:
        return JustifyContent.spaceAround;
      case MainAxisAlignment.spaceEvenly:
        return JustifyContent.spaceEvenly;
    }
  }
}

/// Converts CrossAxisAlignment to AlignItems
extension CrossAxisAlignmentAdapter on CrossAxisAlignment {
  AlignItems toAlignItems([TextBaseline? textBaseline]) {
    switch (this) {
      case CrossAxisAlignment.start:
        return AlignItems.start;
      case CrossAxisAlignment.end:
        return AlignItems.end;
      case CrossAxisAlignment.center:
        return AlignItems.center;
      case CrossAxisAlignment.stretch:
        return AlignItems.stretch;
      case CrossAxisAlignment.baseline:
        return textBaseline == TextBaseline.alphabetic 
            ? AlignItems.baseline 
            : AlignItems.start;
    }
  }
}

/// Converts AlignmentDirectional to CSS alignment properties
extension AlignmentDirectionalAdapter on AlignmentDirectional {
  ({AlignItems alignItems, JustifyContent justifyContent}) toFlexAlignment([TextDirection direction = TextDirection.ltr]) {
    return (
      alignItems: _getAlignItems(y),
      justifyContent: _getJustifyContent(direction == TextDirection.ltr ? start : -start),
    );
  }

  AlignItems _getAlignItems(double value) {
    if (value < 0) return AlignItems.start;
    if (value > 0) return AlignItems.end;
    return AlignItems.center;
  }

  JustifyContent _getJustifyContent(double value) {
    if (value < 0) return JustifyContent.start;
    if (value > 0) return JustifyContent.end;
    return JustifyContent.center;
  }
}

/// Converts Alignment to CSS position values
extension AlignmentAdapter on Alignment {
  ({Unit left, Unit top}) toPosition() {
    return (
      left: Unit.percent((x + 1) * 50),
      top: Unit.percent((y + 1) * 50),
    );
  }
}

/// Converts Clip to Overflow
extension ClipAdapter on Clip {
  Overflow toOverflow() {
    switch (this) {
      case Clip.none:
        return Overflow.visible;
      case Clip.hardEdge:
      case Clip.antiAlias:
      case Clip.antiAliasWithSaveLayer:
        return Overflow.hidden;
    }
  }
}
