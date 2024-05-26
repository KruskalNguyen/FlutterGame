import 'package:drainblood/Features/deckBuilder/presentation/views/deck_builder_view.dart';
import 'package:flutter/material.dart';

class DeckBuilderRoute {
  static const String routeName = '/builddeck';

  static Map<String, WidgetBuilder> get builder {
    return {
      routeName: (context) => DeckBuilderView(),
    };
  }

  static Future open(BuildContext context) {
    return Navigator.pushNamed(context, routeName);
  }
}
