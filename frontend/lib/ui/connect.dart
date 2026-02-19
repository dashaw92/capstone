import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/net/connection.dart';
import 'package:frontend/storage/prefs.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  ConnectScreenState createState() => ConnectScreenState();
}

class ConnectScreenState extends State<ConnectScreen> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _portController = TextEditingController();
  String? _selectedServer = Prefs.lastConnection?.id;

  @override
  void dispose() {
    _addressController.dispose();
    _portController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final connections = Prefs.connections;

    return Scaffold(
      appBar: AppBar(title: const Text("Connect")),
      body: Wrap(
        children: [
          DropdownMenu<String>(
            initialSelection: Prefs.lastConnection?.id,
            dropdownMenuEntries: [
              for (var i = 0; i < connections.length; i++)
                DropdownMenuEntry<String>(
                  value: connections[i].id,
                  label: connections[i].id,
                ),
            ],
            onSelected: (String? id) {
              _selectedServer = id;
            },
          ),
          ElevatedButton(
            child: const Text("Connect"),
            onPressed: () async {
              if (_selectedServer != null) {
                final connected = await Connection.tryConnect(
                  StoredConnection.fromId(_selectedServer!),
                );
                if (!context.mounted) return;
                if (connected) {
                  Navigator.pushNamed(context, Routes.established);
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Center(
                      child: Text("Failed to connect to server!"),
                    ),
                  ),
                );
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_selectedServer == null) return;
              if (Prefs.lastConnection?.id == _selectedServer) {
                Prefs.setLastServer(null);
              }
              Prefs.removeServer(StoredConnection.fromId(_selectedServer!));
              _selectedServer = null;
              setState(() {});
            },
            child: const Text("Delete"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () => _addConnectionDialog(),
        label: const Text("New"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Future _addConnectionDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("New Connection"),
      content: Form(
        key: _formKey,
        child: Wrap(
          runSpacing: 16,
          children: [
            TextFormField(
              controller: _addressController,
              validator: (v) =>
                  v!.isEmpty ? 'Missing address/IP for connection.' : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Address",
              ),
            ),
            TextFormField(
              controller: _portController,
              validator: (v) =>
                  int.tryParse(v!) == null ? 'Invalid port' : null,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Port",
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final connection = StoredConnection(
                address: _addressController.text,
                port: int.parse(_portController.text),
              );
              _addressController.clear();
              _portController.clear();
              _selectedServer = connection.id;
              Prefs.addServer(connection);
              Prefs.setLastServer(connection);
              Navigator.pop(context);
              setState(() {});
            }
          },
          child: const Text("Submit"),
        ),
      ],
    ),
  );
}
