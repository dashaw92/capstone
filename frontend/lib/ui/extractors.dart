import 'package:flutter/material.dart';
import 'package:pantry_protocol/protocol.dart';

import '../main.dart';
import '../net/connection.dart';

class ExtractorsScreen extends StatefulWidget {
  const ExtractorsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExtractorsScreenState();
}

class _ExtractorsScreenState extends State<ExtractorsScreen> {

  late Future<ListExtractorsResponse> _extractors;

  @override
  void initState() {
    super.initState();
    _extractors = Connection.conn!.listExtractors(empty);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Extractors")),
    body: Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          child: FutureBuilder(
            future: _extractors,
            builder: (context, state) {
              if (state.hasData) {
                return ListView.builder(
                  itemCount: state.data!.extractors.length,
                  itemBuilder: (context, idx) {
                    final item = state.data!.extractors[idx];
                    return Row(
                      children: [
                        Flexible(
                          child: ListTile(
                            leading: Text(item.id.toString()),
                            title: Text(item.label),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.editExtractor, arguments: item.id);
                          },
                          child: Icon(Icons.edit),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await Connection.conn!.deleteExtractor(
                              DeleteExtractorRequest(id: item.id),
                            );
                            setState(() {
                              _extractors = Connection.conn!.listExtractors(empty);
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
      onPressed: () => _addExtractorDialog(),
      label: const Text("New"),
      icon: Icon(Icons.code),
    ),
  );

  final _formKey = GlobalKey<FormState>();
  final _labelController = TextEditingController();

  void _submit(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final r = await Connection.conn!.createExtractor(CreateExtractorRequest(label: _labelController.text, script: "-- TODO: Template for quickstart\n"));
      _labelController.clear();

      if (context.mounted) {
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.editExtractor, arguments: r.id);

        setState(() {
          _extractors = Connection.conn!.listExtractors(empty);
        });
      }
    }
  }

  Future _addExtractorDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("New Extractor"),
      content: Form(
        key: _formKey,
        child: Wrap(
          runSpacing: 16,
          children: [
            TextFormField(
              controller: _labelController,
              validator: (v) => v!.isEmpty ? 'Name must not be empty' : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Extractor name",
              ),
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
              autofocus: true,
              textInputAction: TextInputAction.next,
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
          onPressed: () => _submit(context),
          child: const Text("Create"),
        ),
      ],
    ),
  );
}