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

  Set<String> knownIngredients = {};
  ListIngredientsResponse? _ingredients;
  Future<ExtractorExecutionResponse>? _extractorResponse;

  @override
  void initState() {
    super.initState();
    setup();
  }

  Future<void> setup() async {
    knownIngredients.clear();
    _ingredients = await Connection.conn!.listIngredients(empty);
  }

  Future<void> updateIngredients() async {
    CreateIngredientsRequest req = CreateIngredientsRequest(label: [
      for (var ingredient in knownIngredients)
        ? haveIngredient(ingredient) ? null : ingredient
    ]);
    await Connection.conn!.createIngredients(req);
    knownIngredients.clear();
    _ingredients = await Connection.conn!.listIngredients(empty);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connected")),
      floatingActionButton: knownIngredients.isEmpty
          ? null
          : ElevatedButton(
              onPressed: updateIngredients,
              child: const Text("Update"),
            ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Flex(
          spacing: 16.0,
          direction: Axis.vertical,
          children: [
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
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
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        _recipeUrlController.clear();
                        _extractorResponse = null;
                        knownIngredients.clear();
                      });
                    },
                    child: Icon(Icons.backspace),
                  ),
                ],
              ),
            ),
            Flexible(
              child: _extractorResponse == null
                  ? const Text("Enter a recipe URL to check ingredients")
                  : FutureBuilder(
                      future: _extractorResponse,
                      builder: (context, state) {
                        if (state.hasData) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Table(
                              border: TableBorder.all(),
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              columnWidths: {
                                0: IntrinsicColumnWidth(),
                                1: FlexColumnWidth(),
                              },
                              children: <TableRow>[
                                TableRow(
                                  children: [
                                    const Checkbox(value: true, onChanged: null),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        "Ingredient",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                for (var ingredient in state.data!.ingredients)
                                  TableRow(
                                    children: [
                                      Checkbox(
                                        value: haveIngredient(ingredient) || knownIngredients.contains(ingredient),
                                        onChanged: (bool? value) {
                                          setState(() {
                                            if (value ?? true) {
                                              knownIngredients.add(ingredient);
                                            } else {
                                              knownIngredients.remove(ingredient);
                                            }
                                          });
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16.0,
                                        ),
                                        child: Text(ingredient),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
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

  bool haveIngredient(String ingredient) {
    return _ingredients!.ingredients.any(
      (ing) => ing.label.toLowerCase() == ingredient.toLowerCase(),
    );
  }

  void _submit(BuildContext context) async {
    _extractorResponse = null;
    if (_formKey.currentState!.validate()) {
      setState(() {
        setup();
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
