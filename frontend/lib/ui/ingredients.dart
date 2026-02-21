import 'package:flutter/material.dart';
import 'package:frontend/net/connection.dart';
import 'package:pantry_protocol/protocol.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _IngredientsState();
}

class _IngredientsState extends State<IngredientsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  late Future<ListNamesResponse> _names;

  @override
  void initState() {
    super.initState();
    _names = Connection.conn!.listNames(empty);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          child: FutureBuilder(
            future: _names,
            builder: (context, state) {
              if (state.hasData) {
                return ListView.builder(
                  itemCount: state.data!.names.length,
                  itemBuilder: (context, idx) {
                    final name = state.data!.names[idx];
                    return Row(
                      children: [
                        Flexible(
                          child: ListTile(
                            leading: Text(name.id.toString()),
                            title: Text(name.label),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Icon(Icons.add_a_photo),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await Connection.conn!.deleteName(
                              DeleteNameRequest(nameId: name.id),
                            );
                            setState(() {
                              _names = Connection.conn!.listNames(empty);
                            });
                          },
                          child: Icon(Icons.delete_forever),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    ),
    floatingActionButton: ElevatedButton.icon(
      onPressed: () => _addNameDialog(),
      label: const Text("Add ingredient"),
      icon: Icon(Icons.add),
    ),
  );

  void _submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await Connection.conn!.createName(
        CreateNameRequest(label: _nameController.text),
      );
      _nameController.clear();

      if (context.mounted) {
        Navigator.pop(context);
      }
      setState(() {
        _names = Connection.conn!.listNames(empty);
      });
    }
  }

  Future _addNameDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Add Ingredient"),
      content: Form(
        key: _formKey,
        child: Wrap(
          runSpacing: 16,
          children: [
            TextFormField(
              controller: _nameController,
              validator: (v) => v!.isEmpty ? 'Name must not be empty' : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Ingredient name",
              ),
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              autofocus: true,
              onFieldSubmitted: (_) => _submit(context),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(onPressed: () => _submit(context), child: const Text("Submit")),
      ],
    ),
  );
}
