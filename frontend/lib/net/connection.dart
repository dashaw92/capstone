import 'package:frontend/storage/prefs.dart';
import 'package:grpc/grpc.dart';
import 'package:pantry_protocol/protocol.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

final empty = Empty();

class Connection {
  Connection._();

  static ClientChannel? _chan;
  static PantryServiceClient? conn;

  static Future<bool> tryConnect(StoredConnection server) async {
    try {
      await disconnect();
      _chan = ClientChannel(
        server.address,
        port: server.port,
        options: const ChannelOptions(
            credentials: ChannelCredentials.insecure()),
      );
      conn = PantryServiceClient(_chan!);
      final pong = await conn?.ping(empty);
      if (pong == null) {
        _chan = null;
        conn = null;
        return false;
      }

      return true;
    } catch (_) {
      return false;
    }
  }

  static Future<void> disconnect() async {
    await _chan?.shutdown();
    _chan = null;
    conn = null;
  }
}
