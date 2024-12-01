class Alignment {
  const Alignment(this.x, this.y);

  final double x;
  final double y;

  // Predefined alignment constants
  static const topLeft = Alignment(-1.0, -1.0);
  static const topCenter = Alignment(0.0, -1.0);
  static const topRight = Alignment(1.0, -1.0);

  static const centerLeft = Alignment(-1.0, 0.0);
  static const center = Alignment(0.0, 0.0);
  static const centerRight = Alignment(1.0, 0.0);

  static const bottomLeft = Alignment(-1.0, 1.0);
  static const bottomCenter = Alignment(0.0, 1.0);
  static const bottomRight = Alignment(1.0, 1.0);
}

class AlignmentDirectional {
  const AlignmentDirectional(this.start, this.y);

  final double start;
  final double y;

  static const topStart = AlignmentDirectional(-1.0, -1.0);
  static const topCenter = AlignmentDirectional(0.0, -1.0);
  static const topEnd = AlignmentDirectional(1.0, -1.0);

  static const centerStart = AlignmentDirectional(-1.0, 0.0);
  static const center = AlignmentDirectional(0.0, 0.0);
  static const centerEnd = AlignmentDirectional(1.0, 0.0);

  static const bottomStart = AlignmentDirectional(-1.0, 1.0);
  static const bottomCenter = AlignmentDirectional(0.0, 1.0);
  static const bottomEnd = AlignmentDirectional(1.0, 1.0);
}

enum MainAxisAlignment {
  start,
  end,
  center,
  spaceBetween,
  spaceAround,
  spaceEvenly,
}

enum CrossAxisAlignment {
  start,
  end,
  center,
  stretch,
  baseline,
}

enum MainAxisSize {
  min,
  max,
}

enum StackFit {
  loose,
  expand,
  passthrough,
}

enum Clip {
  none,
  hardEdge,
  antiAlias,
  antiAliasWithSaveLayer,
}

enum VerticalDirection {
  up,
  down,
}

enum TextDirection {
  ltr,
  rtl,
}

enum TextBaseline {
  alphabetic,
  ideographic,
}
