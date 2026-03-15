import 'package:flutter/material.dart';
import 'package:frontend/main.dart';
import 'package:pantry_protocol/protocol.dart';

import '../net/connection.dart';

class EstablishedConnectionScreen extends StatefulWidget {
  const EstablishedConnectionScreen({super.key});

  @override
  State<EstablishedConnectionScreen> createState() =>
      _EstablishedConnectionScreenState();
}

class _EstablishedConnectionScreenState
    extends State<EstablishedConnectionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _recipeUrlController = TextEditingController();

  Future<ExtractorExecutionResponse>? _extractorResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connected")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              child: Form(
                key: _formKey,
                child: Wrap(
                  runSpacing: 16,
                  children: [
                    TextFormField(
                      controller: _recipeUrlController,
                      validator: (v) =>
                          v!.isEmpty ? 'Invalid recipe URL' : null,
                      keyboardType: TextInputType.url,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Recipe URL',
                      ),
                      autofocus: true,
                      autocorrect: false,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _submit(context),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: _extractorResponse == null
                  ? const Text("Enter a recipe URL to check ingredients")
                  : FutureBuilder(
                      future: _extractorResponse,
                      builder: (context, state) {
                        if (state.hasData) {
                          return ListView.builder(
                            itemCount: state.data!.ingredients.length,
                            itemBuilder: (context, idx) {
                              final item = state.data!.ingredients[idx];
                              return Row(
                                children: [
                                  Flexible(child: ListTile(title: Text(item))),
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
      ),
      drawer: NavDrawer(),
    );
  }

  void _submit(BuildContext context) async {
    _extractorResponse = null;
    if (_formKey.currentState!.validate()) {
      setState(() {
        _extractorResponse = Connection.conn!.executeExtractor(
          ExecuteExtractorRequest(url: _recipeUrlController.text),
        );
      });
    }
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
          leading: const Icon(Icons.dataset_linked),
          title: const Text('Ingredients'),
          onTap: () {
            Navigator.pushNamed(context, Routes.ingredients);
          },
        ),
        ListTile(
          leading: const Icon(Icons.read_more),
          title: const Text('Extractors'),
          onTap: () {
            Navigator.pushNamed(context, Routes.extractors);
          },
        ),
      ],
    ),
  );
}
