import 'package:jaspr/jaspr.dart';

extension DomComponentCopyWith on DomComponent {
  DomComponent copyWith({
    Key? key,
    String? tag,
    String? id,
    String? classes,
    Styles? styles,
    Map<String, String>? attributes,
    Component? child,
    List<Component>? children,
    Map<String, EventCallback>? events,
  }) {
    return DomComponent(
      key: key ?? this.key,
      tag: tag ?? this.tag,
      id: id ?? this.id,
      classes: classes ?? this.classes,
      styles: styles ?? this.styles,
      attributes: attributes ?? this.attributes,
      child: child ?? this.child,
      children: children ?? this.children,
      events: events ?? this.events,
    );
  }
}
