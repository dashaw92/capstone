import 'package:grpc/grpc.dart';
import 'package:pantry_protocol/protocol.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

import 'crud.dart';

class PantryService extends PantryServiceBase {
  final crud = Crud();

  @override
  Future<Ingredient> createIngredient(
    ServiceCall call,
    CreateIngredientRequest request,
  ) async => await crud.createIngredient(request);

  @override
  Future<Empty> deleteIngredient(
    ServiceCall call,
    DeleteIngredientRequest request,
  ) async => await crud.deleteIngredient(request);

  @override
  Future<ListIngredientsResponse> listIngredients(
    ServiceCall call,
    Empty request,
  ) async => await crud.listIngredients();

  @override
  Future<Pong> ping(ServiceCall call, Empty request) async => await crud.ping();

  @override
  Future<Ingredient> renameIngredient(
    ServiceCall call,
    RenameIngredientRequest request,
  ) async => await crud.renameIngredient(request);

  @override
  Future<Ingredient> updateIngredient(
    ServiceCall call,
    UpdateIngredientRequest request,
  ) async => await crud.updateAmount(request);

  @override
  Future<Extractor> createExtractor(
    ServiceCall call,
    CreateExtractorRequest request,
  ) async => await crud.createExtractor(request);

  @override
  Future<Empty> deleteExtractor(
    ServiceCall call,
    DeleteExtractorRequest request,
  ) async => await crud.deleteExtractor(request);

  @override
  Future<ListExtractorsResponse> listExtractors(
    ServiceCall call,
    Empty request,
  ) async => await crud.listExtractors();

  @override
  Future<Extractor> updateExtractor(
    ServiceCall call,
    UpdateExtractorRequest request,
  ) async => await crud.updateExtractor(request);

  @override
  Future<Extractor> getExtractor(
    ServiceCall call,
    GetExtractorRequest request,
  ) async => await crud.getExtractor(request.id);
}

Future<GrpcError?> logging(ServiceCall call, ServiceMethod method) async {
  final time = DateTime.now();
  final client = call.clientMetadata ?? {};
  final method = client[":method"];
  final name = client[":path"];
  final remote = call.remoteAddress?.address;

  print("[$time] $remote => $method $name");
  return null;
}

void main(List<String> args) async {
  final server = Server.create(
    services: [PantryService()],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    interceptors: [logging],
  );
  await server.serve(port: 8080);
  print('Server started on port ${server.port}');
}
