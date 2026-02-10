import 'package:flutter/material.dart';
import 'package:frontend/main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: NavDrawer(),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_header(context), _menuItems(context)],
      ),
    ),
  );

  Widget _header(BuildContext context) => Container(
    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: Wrap(
      runSpacing: 24,
      children: [
        Center(child: Text('Pantry Inventory', style: TextStyle(fontSize: 24))),
        Divider(color: Theme.of(context).dividerColor),
      ],
    ),
  );

  Widget _menuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.router),
          title: const Text('Connect'),
          onTap: () {
            Navigator.pushNamed(context, Routes.connect);
          },
        ),
      ],
    ),
  );
}
