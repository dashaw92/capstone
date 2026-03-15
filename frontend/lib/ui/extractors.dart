import 'package:flutter/material.dart';
import 'package:frontend/net/connection.dart';
import 'package:pantry_protocol/protocol.dart';

import '../main.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _IngredientsState();
}

class _IngredientsState extends State<IngredientsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();

  late Future<ListIngredientsResponse> _ingredients;

  @override
  void initState() {
    super.initState();
    _ingredients = Connection.conn!.listIngredients(empty);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Ingredients")),
    body: Flex(
      direction: Axis.vertical,
      children: [
        Flexible(
          child: FutureBuilder(
            future: _ingredients,
            builder: (context, state) {
              if (state.hasData) {
                return ListView.builder(
                  itemCount: state.data!.ingredients.length,
                  itemBuilder: (context, idx) {
                    final item = state.data!.ingredients[idx];
                    return Row(
                      children: [
                        Flexible(
                          child: ListTile(
                            leading: Text(item.id.toString()),
                            title: Text(item.label),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _setAmountDialog(item.amount),
                          child: Icon(Icons.numbers),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await Connection.conn!.deleteIngredient(
                              DeleteIngredientRequest(id: item.id),
                            );
                            setState(() {
                              _ingredients = Connection.conn!.listIngredients(empty);
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
      final name = await Connection.conn!.createIngredient(
        CreateIngredientRequest(label: _nameController.text, amount: double.tryParse(_amountController.text) ?? 0.0),
      );

      _nameController.clear();
      _amountController.clear();

      if (context.mounted) {
        Navigator.pop(context);
      }
      setState(() {
        _ingredients = Connection.conn!.listIngredients(empty);
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
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              controller: _amountController,
              validator: (v) {
                if (v == null || v.isEmpty) return "Amount must not be empty";
                final parsed = double.tryParse(v);
                if (parsed == null || parsed < 0.0) return "Invalid amount";
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Amount (grams)",
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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
        ElevatedButton(
          onPressed: () => _submit(context),
          child: const Text("Submit"),
        ),
      ],
    ),
  );

  Future _setAmountDialog(double amount) {
    return showDialog(context: context, builder: (context) {
      return Center(child: Text("Currently have $amount"));
    });
  }
}
