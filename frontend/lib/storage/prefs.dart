import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class _Keys {
  _Keys._();

  static const lastConnection = "last-connection";
  static const connections = "connections";
}

class Prefs {
  static late SharedPreferences _prefs;
  static late Set<StoredConnection> _connections;
  static StoredConnection? _lastConnection;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    _connections = (_prefs.getStringList(_Keys.connections) ?? [])
        .map(StoredConnection.fromId)
        .toSet();
    _lastConnection = _prefs.containsKey(_Keys.lastConnection)
        ? StoredConnection.fromId(_prefs.getString(_Keys.lastConnection)!)
        : null;
  }

  static Future _updateConnections() async => await _prefs.setStringList(
    _Keys.connections,
    _connections.map((sc) => sc.id).toList(),
  );

  static Future addServer(StoredConnection connection) async {
    _connections.add(connection);
    await _updateConnections();
  }

  static Future removeServer(StoredConnection connection) async {
    _connections.removeWhere((sc) => sc.id == connection.id);
    await _updateConnections();
  }

  static Future setLastServer(StoredConnection? connection) async {
    _lastConnection = connection;
    await (connection == null
        ? _prefs.remove(_Keys.lastConnection)
        : _prefs.setString(_Keys.lastConnection, connection.id));
  }

  static int get numConnections => _connections.length;

  static List<StoredConnection> get connections =>
      _connections.toList(growable: false)
        ..sort((a, b) => a.id.compareTo(b.id));

  static StoredConnection? get lastConnection => _lastConnection;
}

class StoredConnection {
  final String address;
  final int port;

  StoredConnection({required this.address, required this.port});

  factory StoredConnection.fromId(String id) {
    final split = id.split(':');
    if (split.length != 2) {
      throw FormatException(
        "Provided id does not meet expected format: '<address>:<port>'",
      );
    }

    final address = split[0];
    final port = int.tryParse(split[1]) ?? 8080;
    return StoredConnection(address: address, port: port);
  }

  String get id => "$address:$port";
}
