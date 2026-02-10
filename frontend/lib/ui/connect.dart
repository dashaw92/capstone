import 'package:flutter/material.dart';
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
      body: ListView.builder(
        itemCount: Prefs.numConnections,
        padding: EdgeInsets.all(16),
        itemBuilder: (context, idx) {
          final tile = ListTile(
            title: Text(connections[idx].id),
            onTap: () async {
              if (Prefs.lastConnection?.id == connections[idx].id) return;
              await Prefs.setLastServer(connections[idx]);
              setState(() {});
            },
            onLongPress: () {
              if (Prefs.lastConnection?.id == connections[idx].id) {
                Prefs.setLastServer(null);
              }
              Prefs.removeServer(connections[idx]);
              setState(() {});
            },
            leading: Prefs.lastConnection?.id == connections[idx].id
                ? Icon(Icons.radio_button_checked, color: Theme.of(context).colorScheme.inversePrimary)
                : Icon(Icons.radio_button_off, color: Theme.of(context).disabledColor)
          );

          return Container(
            child: tile,
          );
        },
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
                labelText: "Address"
              ),
            ),
            TextFormField(
              controller: _portController,
              validator: (v) =>
                  int.tryParse(v!) == null ? 'Invalid port' : null,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Port"
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
