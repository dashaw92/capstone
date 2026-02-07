import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import 'package:pantry_protocol/protocol.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

final _stub = PantryServiceClient(
  ClientChannel(
    '192.168.40.160',
    port: 8080,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Frontend'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test gRPC Connection'),
      ),
      body: Stack(
        children: [
          ElevatedButton(
            onPressed: () async {
              _stub.createName(
                CreateNameRequest(label: "Powdered Ginger"),
              );
            },
            child: Text("Add next item"),
          ),
        ],
      ),
    );
  }
}
