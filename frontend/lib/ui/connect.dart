import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:frontend/net/connection.dart';
import 'package:frontend/storage/prefs.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  ConnectScreenState createState() => ConnectScreenState();
}

class DropdownConnectionButton extends StatelessWidget {
  final String? server;
  const DropdownConnectionButton({required this.server, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("Connect"),
      onPressed: () async {
        if (server != null) {
          final connected = await Connection.tryConnect(
            StoredConnection.fromId(server!),
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
    );
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownMenu<String>(
                  initialSelection: _selectedServer,
                  dropdownMenuEntries: [
                    for (var i = 0; i < connections.length; i++)
                      DropdownMenuEntry<String>(
                        value: connections[i].id,
                        label: connections[i].id,
                        trailingIcon: DropdownConnectionButton(server: connections[i].id),
                      ),
                  ],
                  onSelected: (String? id) {
                    _selectedServer = id;
                    if (id != null) {
                      Prefs.setLastServer(StoredConnection.fromId(id));
                    }
                  },
                  showTrailingIcon: true,
                  trailingIcon: DropdownConnectionButton(server: _selectedServer),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (Prefs.lastConnection?.id == _selectedServer) {
                        Prefs.setLastServer(null);
                      }
                      if (_selectedServer != null) {
                        Prefs.removeServer(StoredConnection.fromId(_selectedServer!));
                      }
                      _selectedServer = connections.firstOrNull?.id;
                    });
                  },
                  child: const Text("Delete"),
                ),
              ],

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () => _addConnectionDialog(),
        label: const Text("New"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void _submit() {
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
                  v!.isEmpty ? 'Invalid address/IP' : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Address",
              ),
              autofocus: true,
              textInputAction: TextInputAction.next,
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
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
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
          onPressed: _submit,
          child: const Text("Submit"),
        ),
      ],
    ),
  );
}
