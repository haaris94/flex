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
