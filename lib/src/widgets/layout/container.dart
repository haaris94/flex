import 'package:flex/src/widgets/framework.dart';
import 'package:jaspr/jaspr.dart';

class DecoratedBox extends StatelessWidget {
  const DecoratedBox({super.key, required this.child});

  final Widget child;

  @override
  Widget buildWidget(BuildContext context) {
    return child;
  }
}

class Container extends StatelessWidget {
  const Container({super.key, required this.child});

  final Widget child;

  @override
  Widget buildWidget(BuildContext context) {
    return child;
  }
}
