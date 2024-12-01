import 'package:jaspr/jaspr.dart' as jaspr;

/// Base class for all widgets in the framework.
/// This serves as a wrapper around Jaspr's [Component] to provide
/// a more Flutter-like API.
abstract class Widget extends jaspr.Component {
  const Widget({super.key});

  factory Widget.fromComponent(jaspr.Component component) => _ComponentWidget(component);
}

/// A widget that has no state, similar to Flutter's StatelessWidget.
abstract class StatelessWidget extends jaspr.StatelessComponent {
  const StatelessWidget({super.key});

  /// Creates the widget tree for this widget.
  Widget buildWidget(jaspr.BuildContext context);

  @override
  Iterable<jaspr.Component> build(jaspr.BuildContext context) {
    final widget = buildWidget(context);
    return [widget];
  }
}

/// A widget that has mutable state.
abstract class StatefulWidget extends jaspr.StatefulComponent {
  const StatefulWidget({super.key});

  @override
  State createState();
}

/// The logic and internal state for a [StatefulWidget].
abstract class State<T extends StatefulWidget> extends jaspr.State<T> {
  /// Creates the widget tree for this widget's state.
  Widget buildWidget(jaspr.BuildContext context);

  @override
  Iterable<jaspr.Component> build(jaspr.BuildContext context) {
    final widget = buildWidget(context);
    return [widget];
  }
}

// Add this private implementation
class _ComponentWidget extends Widget {
  final jaspr.Component component;

  _ComponentWidget(this.component) : super(key: component.key);

  @override
  jaspr.Element createElement() => component.createElement();
}
