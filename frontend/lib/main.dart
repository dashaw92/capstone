import 'package:flutter/material.dart';
import 'package:frontend/storage/prefs.dart';
import 'package:frontend/ui/ui.dart';

import 'package:pantry_protocol/protocol.dart';

// final _stub = PantryServiceClient(
//   ClientChannel(
//     '192.168.40.160',
//     port: 8080,
//     options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
//   ),
// );

class Routes {
  Routes._();

  static const String home = '/';
  static const String connect = '/connect';
}

final Map<String, WidgetBuilder> _routes = {
  Routes.home: (_) => const HomeScreen(),
  Routes.connect: (_) => ConnectScreen(),
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
