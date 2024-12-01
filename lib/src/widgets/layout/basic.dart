import 'package:flex/src/core/alignment.dart';
import 'package:flex/src/widgets/framework.dart';
import 'package:jaspr/jaspr.dart';

class Align extends StatelessComponent {
  const Align({
    super.key,
    required this.child,
    this.alignment = Alignment.center,
  });

  final Component child;
  final Alignment alignment;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      [
        div(
          [child],
          styles: Styles.box(
            position: Position.absolute(
              left: Unit.percent((alignment.x + 1) * 50),
              top: Unit.percent((alignment.y + 1) * 50),
            ),
            transform: Transform.translate(
              x: Unit.percent(-50),
              y: Unit.percent(-50),
            ),
          ),
        ),
      ],
      styles: Styles.box(
        position: Position.relative(),
        width: 100.percent,
        height: 100.percent,
      ),
    );
  }
}

class Padd extends StatelessWidget {
  const Padd({super.key, required this.child, required this.padding});

  final Component child;
  final EdgeInsets padding;

  @override
  Widget buildWidget(BuildContext context) {
    return Widget.fromComponent(
      DomComponent.wrap(
        key: key,
        styles: Styles.box(padding: padding),
        child: child,
      ),
    );
  }
}

class Padding extends StatelessComponent {
  const Padding({super.key, required this.child, required this.padding});

  final Component child;
  final EdgeInsets padding;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent.wrap(
      key: key,
      styles: Styles.box(padding: padding),
      child: child,
    );
  }
}

/// A widget that takes up the full width and height of its parent and centers its child.
class Center extends StatelessComponent {
  final Component child;

  const Center({super.key, required this.child});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent.wrap(
      key: key,
      child: child,
      styles: Styles.combine([
        Styles.box(
          display: Display.flex,
          width: 100.percent,
          height: 100.percent,
        ),
        const Styles.flexbox(
          justifyContent: JustifyContent.center,
          alignItems: AlignItems.center,
        ),
      ]),
    );
  }
}

class SizedBox extends StatelessComponent {
  /// Creates a fixed size box. The [width] and [height] parameters can be null,
  /// in which case the box will try to size itself to match the child's size.
  const SizedBox({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  /// Creates a box that will become as small as its parent allows.
  const SizedBox.shrink({super.key, required this.child})
      : width = Unit.zero,
        height = Unit.zero;

  /// Creates a box that will become as large as its parent allows.
  const SizedBox.expand({super.key, required this.child})
      : width = const Unit.percent(100),
        height = const Unit.percent(100);

  final Component child;
  final Unit? width;
  final Unit? height;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final styles = width != null || height != null
        ? Styles.box(
            width: width,
            height: height,
            overflow: Overflow.hidden,
          )
        : null;

    yield DomComponent.wrap(
      key: key,
      child: child,
      styles: styles,
    );
  }
}

class Stack extends StatelessComponent {
  const Stack({super.key, required this.children});

  final List<Component> children;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      children,
      styles: Styles.box(display: Display.flex),
    );
  }
}

// class Column extends Widget {
//   const Column({super.key, required this.children});

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) => ColumnLayout(children: children);
// }

// class Row extends Widget {
//   const Row({super.key, required this.children});

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) => RowLayout(children: children);
// }
