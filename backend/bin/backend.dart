import 'package:grpc/grpc.dart';
import 'package:pantry_protocol/protocol.dart' hide Extractor;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';
import 'package:http/http.dart' as http;

import 'crud.dart';
import 'extractors.dart';

class PantryService extends PantryServiceBase {
  final List<Extractor> extractors;
  final crud = Crud();

  PantryService({required this.extractors});

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
  Future<ExtractorExecutionResponse> executeExtractor(
    ServiceCall call,
    ExecuteExtractorRequest request,
  ) async {
    return ExtractorExecutionResponse(ingredients: []);
  }

  @override
  Future<ListExtractorsResponse> listExtractors(
    ServiceCall call,
    Empty request,
  ) async {
    return ListExtractorsResponse(extractors: []);
  }
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
  final extractors = await initExtractors();
  // test(
  //   extractors,
  //   "https://sallysbakingaddiction.com/chewy-chocolate-chip-cookies/",
  // );
  final server = Server.create(
    services: [PantryService(extractors: extractors)],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    interceptors: [logging],
  );
  await server.serve(port: 8080);
  print('Server started on port ${server.port}');
}

void test(List<Extractor> extractors, String recipe) async {
  final url = Uri.parse(recipe);
  final extractor = extractors
      .where((ent) => url.host.toLowerCase().contains(ent.domain.toLowerCase()))
      .firstOrNull;

  if (extractor == null) {
    print("no matching extractor for url!");
    return;
  }

  final body = await http.read(url);
  final output = extractor.extract(body);
  print(output);
}
