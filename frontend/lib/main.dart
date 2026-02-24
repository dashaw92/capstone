import 'package:flutter/material.dart';
import 'package:frontend/storage/prefs.dart';
import 'package:frontend/ui/ui.dart';
import 'package:pantry_protocol/protocol.dart';

class Routes {
  Routes._();

  static const String home = '/';
  static const String established = '/established';
  static const String ingredients = '/established/ingredients';
  static const String extractors = '/established/extractors';
  static const String editExtractor = '/established/extractors/edit';
}

final Map<String, WidgetBuilder> _routes = {
  Routes.home: (_) => const ConnectScreen(),
  Routes.established: (_) => const EstablishedConnectionScreen(),
  Routes.ingredients: (_) => const IngredientsScreen(),
  Routes.extractors: (_) => const ExtractorsScreen(),
  Routes.editExtractor: (context) => EditExtractorScreen(extractor: ModalRoute.of(context)!.settings.arguments as int),
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantry Inventory',
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      initialRoute: Routes.home,
      routes: _routes,
    );
  }
}
