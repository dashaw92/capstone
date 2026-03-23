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

  $grpc.ResponseFuture<$0.CreatedIngredientsResponse> createIngredients(
    $0.CreateIngredientsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createIngredients, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListIngredientsResponse> listIngredients(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listIngredients, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteIngredient(
    $0.DeleteIngredientRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteIngredient, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListExtractorsResponse> listExtractors(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listExtractors, request, options: options);
  }

  $grpc.ResponseFuture<$0.ExtractorExecutionResponse> executeExtractor(
    $0.ExecuteExtractorRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$executeExtractor, request, options: options);
  }

  $grpc.ResponseFuture<$0.Pong> ping(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  // method descriptors

  static final _$createIngredients = $grpc.ClientMethod<
          $0.CreateIngredientsRequest, $0.CreatedIngredientsResponse>(
      '/pantry_protocol.PantryService/CreateIngredients',
      ($0.CreateIngredientsRequest value) => value.writeToBuffer(),
      $0.CreatedIngredientsResponse.fromBuffer);
  static final _$listIngredients =
      $grpc.ClientMethod<$1.Empty, $0.ListIngredientsResponse>(
          '/pantry_protocol.PantryService/ListIngredients',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ListIngredientsResponse.fromBuffer);
  static final _$deleteIngredient =
      $grpc.ClientMethod<$0.DeleteIngredientRequest, $1.Empty>(
          '/pantry_protocol.PantryService/DeleteIngredient',
          ($0.DeleteIngredientRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$listExtractors =
      $grpc.ClientMethod<$1.Empty, $0.ListExtractorsResponse>(
          '/pantry_protocol.PantryService/ListExtractors',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ListExtractorsResponse.fromBuffer);
  static final _$executeExtractor = $grpc.ClientMethod<
          $0.ExecuteExtractorRequest, $0.ExtractorExecutionResponse>(
      '/pantry_protocol.PantryService/ExecuteExtractor',
      ($0.ExecuteExtractorRequest value) => value.writeToBuffer(),
      $0.ExtractorExecutionResponse.fromBuffer);
  static final _$ping = $grpc.ClientMethod<$1.Empty, $0.Pong>(
      '/pantry_protocol.PantryService/Ping',
      ($1.Empty value) => value.writeToBuffer(),
      $0.Pong.fromBuffer);
}

@$pb.GrpcServiceName('pantry_protocol.PantryService')
abstract class PantryServiceBase extends $grpc.Service {
  $core.String get $name => 'pantry_protocol.PantryService';

  PantryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateIngredientsRequest,
            $0.CreatedIngredientsResponse>(
        'CreateIngredients',
        createIngredients_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateIngredientsRequest.fromBuffer(value),
        ($0.CreatedIngredientsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListIngredientsResponse>(
        'ListIngredients',
        listIngredients_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListIngredientsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteIngredientRequest, $1.Empty>(
        'DeleteIngredient',
        deleteIngredient_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteIngredientRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListExtractorsResponse>(
        'ListExtractors',
        listExtractors_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListExtractorsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExecuteExtractorRequest,
            $0.ExtractorExecutionResponse>(
        'ExecuteExtractor',
        executeExtractor_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ExecuteExtractorRequest.fromBuffer(value),
        ($0.ExtractorExecutionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Pong>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Pong value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreatedIngredientsResponse> createIngredients_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreateIngredientsRequest> $request) async {
    return createIngredients($call, await $request);
  }

  $async.Future<$0.CreatedIngredientsResponse> createIngredients(
      $grpc.ServiceCall call, $0.CreateIngredientsRequest request);

  $async.Future<$0.ListIngredientsResponse> listIngredients_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return listIngredients($call, await $request);
  }

  $async.Future<$0.ListIngredientsResponse> listIngredients(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$1.Empty> deleteIngredient_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteIngredientRequest> $request) async {
    return deleteIngredient($call, await $request);
  }

  $async.Future<$1.Empty> deleteIngredient(
      $grpc.ServiceCall call, $0.DeleteIngredientRequest request);

  $async.Future<$0.ListExtractorsResponse> listExtractors_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return listExtractors($call, await $request);
  }

  $async.Future<$0.ListExtractorsResponse> listExtractors(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.ExtractorExecutionResponse> executeExtractor_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.ExecuteExtractorRequest> $request) async {
    return executeExtractor($call, await $request);
  }

  $async.Future<$0.ExtractorExecutionResponse> executeExtractor(
      $grpc.ServiceCall call, $0.ExecuteExtractorRequest request);

  $async.Future<$0.Pong> ping_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return ping($call, await $request);
  }

  $async.Future<$0.Pong> ping($grpc.ServiceCall call, $1.Empty request);
}
