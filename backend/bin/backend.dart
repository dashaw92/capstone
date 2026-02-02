import 'package:grpc/grpc.dart';
import 'package:pantry_protocol/protocol.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

import 'crud.dart';

class PantryService extends PantryServiceBase {
  final crud = Crud();

  @override
  Future<Name> createName(ServiceCall call, CreateNameRequest request) async =>
      await crud.createName(request);
  @override
  Future<CreateUpcResponse> createUpc(ServiceCall call, Upc request) async =>
      await crud.createUpc(request);

  @override
  Future<Empty> deleteName(ServiceCall call, DeleteNameRequest request) async =>
      await crud.deleteName(request);

  @override
  Future<Empty> deleteUpc(ServiceCall call, DeleteUpcRequest request) async =>
      await crud.deleteUpc(request);

  @override
  Future<Item> getAmount(ServiceCall call, GetAmountRequest request) async =>
      await crud.getAmount(request);
  @override
  Future<ListUpcsResponse> listAllUpcs(ServiceCall call, Empty request) async =>
      await crud.listAllUpcs();

  @override
  Future<ListNamesResponse> listNames(ServiceCall call, Empty request) async =>
      await crud.listNames();

  @override
  Future<ListUpcsResponse> listUpcs(
    ServiceCall call,
    GetUpcsRequest request,
  ) async => await crud.listUpcs(request);

  @override
  Future<Item> resetAmount(
    ServiceCall call,
    ResetAmountRequest request,
  ) async => await crud.setAmount(request.nameId, 0.0);

  @override
  Future<Item> setAmount(ServiceCall call, SetAmountRequest request) async =>
      await crud.setAmount(request.nameId, request.amount);

  @override
  Future<Item> updateAmount(ServiceCall call, AddAmountRequest request) async =>
      await crud.updateAmount(request);
}

void main(List<String> args) async {
  final server = Server.create(
    services: [PantryService()],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 8080);
  print('Server started on port ${server.port}');
}
