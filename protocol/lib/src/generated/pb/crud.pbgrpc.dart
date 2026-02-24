// This is a generated file - do not edit.
//
// Generated from pb/crud.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart' as $1;

import 'crud.pb.dart' as $0;

export 'crud.pb.dart';

@$pb.GrpcServiceName('pantry_protocol.PantryService')
class PantryServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PantryServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.Ingredient> createIngredient(
    $0.CreateIngredientRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createIngredient, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListIngredientsResponse> listIngredients(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listIngredients, request, options: options);
  }

  $grpc.ResponseFuture<$0.Ingredient> updateIngredient(
    $0.UpdateIngredientRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateIngredient, request, options: options);
  }

  $grpc.ResponseFuture<$0.Ingredient> renameIngredient(
    $0.RenameIngredientRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$renameIngredient, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteIngredient(
    $0.DeleteIngredientRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteIngredient, request, options: options);
  }

  $grpc.ResponseFuture<$0.Extractor> createExtractor(
    $0.CreateExtractorRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createExtractor, request, options: options);
  }

  $grpc.ResponseFuture<$0.Extractor> updateExtractor(
    $0.UpdateExtractorRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateExtractor, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListExtractorsResponse> listExtractors(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listExtractors, request, options: options);
  }

  $grpc.ResponseFuture<$0.Extractor> getExtractor(
    $0.GetExtractorRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getExtractor, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteExtractor(
    $0.DeleteExtractorRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteExtractor, request, options: options);
  }

  $grpc.ResponseFuture<$0.Pong> ping(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  // method descriptors

  static final _$createIngredient =
      $grpc.ClientMethod<$0.CreateIngredientRequest, $0.Ingredient>(
          '/pantry_protocol.PantryService/CreateIngredient',
          ($0.CreateIngredientRequest value) => value.writeToBuffer(),
          $0.Ingredient.fromBuffer);
  static final _$listIngredients =
      $grpc.ClientMethod<$1.Empty, $0.ListIngredientsResponse>(
          '/pantry_protocol.PantryService/ListIngredients',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ListIngredientsResponse.fromBuffer);
  static final _$updateIngredient =
      $grpc.ClientMethod<$0.UpdateIngredientRequest, $0.Ingredient>(
          '/pantry_protocol.PantryService/UpdateIngredient',
          ($0.UpdateIngredientRequest value) => value.writeToBuffer(),
          $0.Ingredient.fromBuffer);
  static final _$renameIngredient =
      $grpc.ClientMethod<$0.RenameIngredientRequest, $0.Ingredient>(
          '/pantry_protocol.PantryService/RenameIngredient',
          ($0.RenameIngredientRequest value) => value.writeToBuffer(),
          $0.Ingredient.fromBuffer);
  static final _$deleteIngredient =
      $grpc.ClientMethod<$0.DeleteIngredientRequest, $1.Empty>(
          '/pantry_protocol.PantryService/DeleteIngredient',
          ($0.DeleteIngredientRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$createExtractor =
      $grpc.ClientMethod<$0.CreateExtractorRequest, $0.Extractor>(
          '/pantry_protocol.PantryService/CreateExtractor',
          ($0.CreateExtractorRequest value) => value.writeToBuffer(),
          $0.Extractor.fromBuffer);
  static final _$updateExtractor =
      $grpc.ClientMethod<$0.UpdateExtractorRequest, $0.Extractor>(
          '/pantry_protocol.PantryService/UpdateExtractor',
          ($0.UpdateExtractorRequest value) => value.writeToBuffer(),
          $0.Extractor.fromBuffer);
  static final _$listExtractors =
      $grpc.ClientMethod<$1.Empty, $0.ListExtractorsResponse>(
          '/pantry_protocol.PantryService/ListExtractors',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ListExtractorsResponse.fromBuffer);
  static final _$getExtractor =
      $grpc.ClientMethod<$0.GetExtractorRequest, $0.Extractor>(
          '/pantry_protocol.PantryService/GetExtractor',
          ($0.GetExtractorRequest value) => value.writeToBuffer(),
          $0.Extractor.fromBuffer);
  static final _$deleteExtractor =
      $grpc.ClientMethod<$0.DeleteExtractorRequest, $1.Empty>(
          '/pantry_protocol.PantryService/DeleteExtractor',
          ($0.DeleteExtractorRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$ping = $grpc.ClientMethod<$1.Empty, $0.Pong>(
      '/pantry_protocol.PantryService/Ping',
      ($1.Empty value) => value.writeToBuffer(),
      $0.Pong.fromBuffer);
}

@$pb.GrpcServiceName('pantry_protocol.PantryService')
abstract class PantryServiceBase extends $grpc.Service {
  $core.String get $name => 'pantry_protocol.PantryService';

  PantryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateIngredientRequest, $0.Ingredient>(
        'CreateIngredient',
        createIngredient_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateIngredientRequest.fromBuffer(value),
        ($0.Ingredient value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListIngredientsResponse>(
        'ListIngredients',
        listIngredients_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListIngredientsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateIngredientRequest, $0.Ingredient>(
        'UpdateIngredient',
        updateIngredient_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateIngredientRequest.fromBuffer(value),
        ($0.Ingredient value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RenameIngredientRequest, $0.Ingredient>(
        'RenameIngredient',
        renameIngredient_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RenameIngredientRequest.fromBuffer(value),
        ($0.Ingredient value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteIngredientRequest, $1.Empty>(
        'DeleteIngredient',
        deleteIngredient_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteIngredientRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateExtractorRequest, $0.Extractor>(
        'CreateExtractor',
        createExtractor_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateExtractorRequest.fromBuffer(value),
        ($0.Extractor value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateExtractorRequest, $0.Extractor>(
        'UpdateExtractor',
        updateExtractor_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateExtractorRequest.fromBuffer(value),
        ($0.Extractor value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListExtractorsResponse>(
        'ListExtractors',
        listExtractors_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListExtractorsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetExtractorRequest, $0.Extractor>(
        'GetExtractor',
        getExtractor_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetExtractorRequest.fromBuffer(value),
        ($0.Extractor value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteExtractorRequest, $1.Empty>(
        'DeleteExtractor',
        deleteExtractor_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteExtractorRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Pong>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Pong value) => value.writeToBuffer()));
  }

  $async.Future<$0.Ingredient> createIngredient_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateIngredientRequest> $request) async {
    return createIngredient($call, await $request);
  }

  $async.Future<$0.Ingredient> createIngredient(
      $grpc.ServiceCall call, $0.CreateIngredientRequest request);

  $async.Future<$0.ListIngredientsResponse> listIngredients_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return listIngredients($call, await $request);
  }

  $async.Future<$0.ListIngredientsResponse> listIngredients(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.Ingredient> updateIngredient_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateIngredientRequest> $request) async {
    return updateIngredient($call, await $request);
  }

  $async.Future<$0.Ingredient> updateIngredient(
      $grpc.ServiceCall call, $0.UpdateIngredientRequest request);

  $async.Future<$0.Ingredient> renameIngredient_Pre($grpc.ServiceCall $call,
      $async.Future<$0.RenameIngredientRequest> $request) async {
    return renameIngredient($call, await $request);
  }

  $async.Future<$0.Ingredient> renameIngredient(
      $grpc.ServiceCall call, $0.RenameIngredientRequest request);

  $async.Future<$1.Empty> deleteIngredient_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteIngredientRequest> $request) async {
    return deleteIngredient($call, await $request);
  }

  $async.Future<$1.Empty> deleteIngredient(
      $grpc.ServiceCall call, $0.DeleteIngredientRequest request);

  $async.Future<$0.Extractor> createExtractor_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateExtractorRequest> $request) async {
    return createExtractor($call, await $request);
  }

  $async.Future<$0.Extractor> createExtractor(
      $grpc.ServiceCall call, $0.CreateExtractorRequest request);

  $async.Future<$0.Extractor> updateExtractor_Pre($grpc.ServiceCall $call,
      $async.Future<$0.UpdateExtractorRequest> $request) async {
    return updateExtractor($call, await $request);
  }

  $async.Future<$0.Extractor> updateExtractor(
      $grpc.ServiceCall call, $0.UpdateExtractorRequest request);

  $async.Future<$0.ListExtractorsResponse> listExtractors_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return listExtractors($call, await $request);
  }

  $async.Future<$0.ListExtractorsResponse> listExtractors(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.Extractor> getExtractor_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetExtractorRequest> $request) async {
    return getExtractor($call, await $request);
  }

  $async.Future<$0.Extractor> getExtractor(
      $grpc.ServiceCall call, $0.GetExtractorRequest request);

  $async.Future<$1.Empty> deleteExtractor_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteExtractorRequest> $request) async {
    return deleteExtractor($call, await $request);
  }

  $async.Future<$1.Empty> deleteExtractor(
      $grpc.ServiceCall call, $0.DeleteExtractorRequest request);

  $async.Future<$0.Pong> ping_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return ping($call, await $request);
  }

  $async.Future<$0.Pong> ping($grpc.ServiceCall call, $1.Empty request);
}
