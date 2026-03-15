import 'package:flutter/material.dart';
import 'package:frontend/net/connection.dart';
import 'package:pantry_protocol/protocol.dart';

class ExtractorsScreen extends StatefulWidget {
  const ExtractorsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ExtractorsState();
}

class _ExtractorsState extends State<ExtractorsScreen> {
  late Future<ListExtractorsResponse> _extractors;

  @override
  void initState() {
    super.initState();
    _extractors = Connection.conn!.listExtractors(empty);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Installed Extractors")),
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
                            title: Text(item.baseDomain),
                          ),
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
  );
}
