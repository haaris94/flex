import 'package:flex/src/core/adapters/alignment_adapter.dart';
import 'package:flex/src/core/alignment.dart';
import 'package:flex/src/widgets/framework.dart';
import 'package:jaspr/jaspr.dart';

class Align extends StatelessWidget {
  const Align({
    super.key,
    required this.child,
    this.alignment = Alignment.center,
  });

  final Component child;
  final Alignment alignment;

  @override
  Widget buildWidget(BuildContext context) {
    return Widget.fromComponent(
      div(
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
      ),
    );
  }
}

class Padding extends StatelessWidget {
  const Padding({super.key, required this.child, required this.padding});

  final Widget child;
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

/// A widget that takes up the full width and height of its parent and centers its child.
class Center extends StatelessWidget {
  final Widget child;

  const Center({super.key, required this.child});

  @override
  Widget buildWidget(BuildContext context) {
    return Widget.fromComponent(
      DomComponent.wrap(
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
      ),
    );
  }
}

class SizedBox extends StatelessWidget {
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

  final Widget child;
  final Unit? width;
  final Unit? height;

  @override
  Widget buildWidget(BuildContext context) {
    final styles = width != null || height != null
        ? Styles.box(
            width: width,
            height: height,
            overflow: Overflow.hidden,
          )
        : null;

    return Widget.fromComponent(
      DomComponent.wrap(
        key: key,
        child: child,
        styles: styles,
      ),
    );
  }
}

class Stack extends StatelessWidget {
  const Stack({
    super.key,
    required this.children,
    this.alignment = AlignmentDirectional.topStart,
    this.fit = StackFit.loose,
    this.clipBehavior = Clip.none,
  });

  final List<Widget> children;
  final AlignmentDirectional alignment;
  final StackFit fit;
  final Clip clipBehavior;

  @override
  Widget buildWidget(BuildContext context) {
    final alignmentStyle = alignment.toFlexAlignment();
    
    return Widget.fromComponent(
      div(
        children,
        styles: Styles.combine([
          Styles.box(
            position: Position.relative(),
            display: Display.flex,
            overflow: clipBehavior.toOverflow(),
            width: fit == StackFit.expand ? 100.percent : null,
            height: fit == StackFit.expand ? 100.percent : null,
          ),
          Styles.flexbox(
            alignItems: alignmentStyle.alignItems,
            justifyContent: alignmentStyle.justifyContent,
          ),
        ]),
      ),
    );
  }
}

class Positioned extends StatelessWidget {
  const Positioned({
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    required this.child,
  });

  final Unit? left;
  final Unit? top;
  final Unit? right;
  final Unit? bottom;
  final Unit? width;
  final Unit? height;
  final Widget child;

  @override
  Widget buildWidget(BuildContext context) {
    return Widget.fromComponent(
      div(
        [child],
        styles: Styles.box(
          position: Position.absolute(
            left: left,
            top: top,
            right: right,
            bottom: bottom,
          ),
          width: width,
          height: height,
        ),
      ),
    );
  }
}

class Row extends StatelessWidget {
  const Row({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget buildWidget(BuildContext context) {
    return Widget.fromComponent(
      div(
        children,
        styles: Styles.combine([
          Styles.box(
            display: Display.flex,
            width: mainAxisSize == MainAxisSize.max ? 100.percent : null,
          ),
          Styles.flexbox(
            direction: FlexDirection.row,
            justifyContent: mainAxisAlignment.toJustifyContent(),
            alignItems: crossAxisAlignment.toAlignItems(),
          ),
        ]),
      ),
    );
  }
}

class Column extends StatelessWidget {
  const Column({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  @override
  Widget buildWidget(BuildContext context) {
    final isReversed = verticalDirection == VerticalDirection.up;
    final childrenToRender = isReversed ? children.reversed.toList() : children;

    return Widget.fromComponent(
      div(
        childrenToRender,
        styles: Styles.combine([
          Styles.box(
            display: Display.flex,
            height: mainAxisSize == MainAxisSize.max ? 100.percent : null,
          ),
          Styles.flexbox(
            direction: isReversed ? FlexDirection.columnReverse : FlexDirection.column,
            justifyContent: mainAxisAlignment.toJustifyContent(),
            alignItems: crossAxisAlignment.toAlignItems(textBaseline),
          ),
        ]),
      ),
    );
  }
}
