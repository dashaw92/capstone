import 'package:grpc/grpc.dart';
import 'package:pantry_protocol/protocol.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

import 'crud.dart';
import 'extractors.dart' as ffi;

/// Implement the gRPC server service methods as defined by the protocol buffers definition (../pantry_protocol)
/// Most functions are delegated to the "crud" object where database interaction is implemented.
class PantryService extends PantryServiceBase {
  //registered extractors found at startup
  final List<ffi.Extractor> extractors;
  //A very creatively named object that provides the implementations for each of the following functions. crud.dart is exclusively linked to PostgreSQL operations.
  final crud = Crud();

  PantryService({required this.extractors});

  @override
  Future<CreatedIngredientsResponse> createIngredients(
    ServiceCall call,
    CreateIngredientsRequest request,
  ) => crud.createIngredients(request);

  @override
  Future<Empty> deleteIngredient(
    ServiceCall call,
    DeleteIngredientRequest request,
  ) => crud.deleteIngredient(request);

  @override
  Future<ListIngredientsResponse> listIngredients(
    ServiceCall call,
    Empty request,
  ) => crud.listIngredients();

  @override
  Future<Pong> ping(ServiceCall call, Empty request) => crud.ping();

  @override
  Future<ExtractorExecutionResponse> executeExtractor(
    ServiceCall call,
    ExecuteExtractorRequest request,
  ) async {
    final output = await ffi.runExtraction(extractors, request.url);
    return ExtractorExecutionResponse(ingredients: output);
  }

  @override
  Future<ListExtractorsResponse> listExtractors(
    ServiceCall call,
    Empty request,
  ) async {
    final pbExtractors = extractors.map((e) => Extractor(baseDomain: e.domain));
    return ListExtractorsResponse(extractors: pbExtractors);
  }
}

// "interceptor" that provides the API call logging
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
  //Resolve all extractors from ../extractors
  final extractors = await ffi.initExtractors();
  final server = Server.create(
    services: [PantryService(extractors: extractors)],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    interceptors: [logging],
  );
  //Starts the gRPC server. Program will run until the server is interrupted via ^C.
  await server.serve(port: 8080);
  print('Server started on port ${server.port}');
}
