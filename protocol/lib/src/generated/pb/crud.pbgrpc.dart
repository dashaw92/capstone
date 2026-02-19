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

  $grpc.ResponseFuture<$0.CreateUpcResponse> createUpc(
    $0.Upc request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createUpc, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListUpcsResponse> listUpcs(
    $0.GetUpcsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listUpcs, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListUpcsResponse> listAllUpcs(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listAllUpcs, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteUpc(
    $0.DeleteUpcRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteUpc, request, options: options);
  }

  $grpc.ResponseFuture<$0.Name> createName(
    $0.CreateNameRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createName, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> deleteName(
    $0.DeleteNameRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deleteName, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListNamesResponse> listNames(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listNames, request, options: options);
  }

  $grpc.ResponseFuture<$0.Item> getAmount(
    $0.GetAmountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getAmount, request, options: options);
  }

  $grpc.ResponseFuture<$0.Item> updateAmount(
    $0.AddAmountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updateAmount, request, options: options);
  }

  $grpc.ResponseFuture<$0.Item> setAmount(
    $0.SetAmountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$setAmount, request, options: options);
  }

  $grpc.ResponseFuture<$0.Item> resetAmount(
    $0.ResetAmountRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$resetAmount, request, options: options);
  }

  $grpc.ResponseFuture<$0.Pong> ping(
    $1.Empty request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$ping, request, options: options);
  }

  // method descriptors

  static final _$createUpc = $grpc.ClientMethod<$0.Upc, $0.CreateUpcResponse>(
      '/pantry_protocol.PantryService/CreateUpc',
      ($0.Upc value) => value.writeToBuffer(),
      $0.CreateUpcResponse.fromBuffer);
  static final _$listUpcs =
      $grpc.ClientMethod<$0.GetUpcsRequest, $0.ListUpcsResponse>(
          '/pantry_protocol.PantryService/ListUpcs',
          ($0.GetUpcsRequest value) => value.writeToBuffer(),
          $0.ListUpcsResponse.fromBuffer);
  static final _$listAllUpcs =
      $grpc.ClientMethod<$1.Empty, $0.ListUpcsResponse>(
          '/pantry_protocol.PantryService/ListAllUpcs',
          ($1.Empty value) => value.writeToBuffer(),
          $0.ListUpcsResponse.fromBuffer);
  static final _$deleteUpc = $grpc.ClientMethod<$0.DeleteUpcRequest, $1.Empty>(
      '/pantry_protocol.PantryService/DeleteUpc',
      ($0.DeleteUpcRequest value) => value.writeToBuffer(),
      $1.Empty.fromBuffer);
  static final _$createName = $grpc.ClientMethod<$0.CreateNameRequest, $0.Name>(
      '/pantry_protocol.PantryService/CreateName',
      ($0.CreateNameRequest value) => value.writeToBuffer(),
      $0.Name.fromBuffer);
  static final _$deleteName =
      $grpc.ClientMethod<$0.DeleteNameRequest, $1.Empty>(
          '/pantry_protocol.PantryService/DeleteName',
          ($0.DeleteNameRequest value) => value.writeToBuffer(),
          $1.Empty.fromBuffer);
  static final _$listNames = $grpc.ClientMethod<$1.Empty, $0.ListNamesResponse>(
      '/pantry_protocol.PantryService/ListNames',
      ($1.Empty value) => value.writeToBuffer(),
      $0.ListNamesResponse.fromBuffer);
  static final _$getAmount = $grpc.ClientMethod<$0.GetAmountRequest, $0.Item>(
      '/pantry_protocol.PantryService/GetAmount',
      ($0.GetAmountRequest value) => value.writeToBuffer(),
      $0.Item.fromBuffer);
  static final _$updateAmount =
      $grpc.ClientMethod<$0.AddAmountRequest, $0.Item>(
          '/pantry_protocol.PantryService/UpdateAmount',
          ($0.AddAmountRequest value) => value.writeToBuffer(),
          $0.Item.fromBuffer);
  static final _$setAmount = $grpc.ClientMethod<$0.SetAmountRequest, $0.Item>(
      '/pantry_protocol.PantryService/SetAmount',
      ($0.SetAmountRequest value) => value.writeToBuffer(),
      $0.Item.fromBuffer);
  static final _$resetAmount =
      $grpc.ClientMethod<$0.ResetAmountRequest, $0.Item>(
          '/pantry_protocol.PantryService/ResetAmount',
          ($0.ResetAmountRequest value) => value.writeToBuffer(),
          $0.Item.fromBuffer);
  static final _$ping = $grpc.ClientMethod<$1.Empty, $0.Pong>(
      '/pantry_protocol.PantryService/Ping',
      ($1.Empty value) => value.writeToBuffer(),
      $0.Pong.fromBuffer);
}

@$pb.GrpcServiceName('pantry_protocol.PantryService')
abstract class PantryServiceBase extends $grpc.Service {
  $core.String get $name => 'pantry_protocol.PantryService';

  PantryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Upc, $0.CreateUpcResponse>(
        'CreateUpc',
        createUpc_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Upc.fromBuffer(value),
        ($0.CreateUpcResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUpcsRequest, $0.ListUpcsResponse>(
        'ListUpcs',
        listUpcs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUpcsRequest.fromBuffer(value),
        ($0.ListUpcsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListUpcsResponse>(
        'ListAllUpcs',
        listAllUpcs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListUpcsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUpcRequest, $1.Empty>(
        'DeleteUpc',
        deleteUpc_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteUpcRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateNameRequest, $0.Name>(
        'CreateName',
        createName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateNameRequest.fromBuffer(value),
        ($0.Name value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteNameRequest, $1.Empty>(
        'DeleteName',
        deleteName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteNameRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListNamesResponse>(
        'ListNames',
        listNames_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListNamesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAmountRequest, $0.Item>(
        'GetAmount',
        getAmount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAmountRequest.fromBuffer(value),
        ($0.Item value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddAmountRequest, $0.Item>(
        'UpdateAmount',
        updateAmount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddAmountRequest.fromBuffer(value),
        ($0.Item value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetAmountRequest, $0.Item>(
        'SetAmount',
        setAmount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetAmountRequest.fromBuffer(value),
        ($0.Item value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResetAmountRequest, $0.Item>(
        'ResetAmount',
        resetAmount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResetAmountRequest.fromBuffer(value),
        ($0.Item value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.Pong>(
        'Ping',
        ping_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.Pong value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateUpcResponse> createUpc_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.Upc> $request) async {
    return createUpc($call, await $request);
  }

  $async.Future<$0.CreateUpcResponse> createUpc(
      $grpc.ServiceCall call, $0.Upc request);

  $async.Future<$0.ListUpcsResponse> listUpcs_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetUpcsRequest> $request) async {
    return listUpcs($call, await $request);
  }

  $async.Future<$0.ListUpcsResponse> listUpcs(
      $grpc.ServiceCall call, $0.GetUpcsRequest request);

  $async.Future<$0.ListUpcsResponse> listAllUpcs_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return listAllUpcs($call, await $request);
  }

  $async.Future<$0.ListUpcsResponse> listAllUpcs(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$1.Empty> deleteUpc_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteUpcRequest> $request) async {
    return deleteUpc($call, await $request);
  }

  $async.Future<$1.Empty> deleteUpc(
      $grpc.ServiceCall call, $0.DeleteUpcRequest request);

  $async.Future<$0.Name> createName_Pre($grpc.ServiceCall $call,
      $async.Future<$0.CreateNameRequest> $request) async {
    return createName($call, await $request);
  }

  $async.Future<$0.Name> createName(
      $grpc.ServiceCall call, $0.CreateNameRequest request);

  $async.Future<$1.Empty> deleteName_Pre($grpc.ServiceCall $call,
      $async.Future<$0.DeleteNameRequest> $request) async {
    return deleteName($call, await $request);
  }

  $async.Future<$1.Empty> deleteName(
      $grpc.ServiceCall call, $0.DeleteNameRequest request);

  $async.Future<$0.ListNamesResponse> listNames_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return listNames($call, await $request);
  }

  $async.Future<$0.ListNamesResponse> listNames(
      $grpc.ServiceCall call, $1.Empty request);

  $async.Future<$0.Item> getAmount_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetAmountRequest> $request) async {
    return getAmount($call, await $request);
  }

  $async.Future<$0.Item> getAmount(
      $grpc.ServiceCall call, $0.GetAmountRequest request);

  $async.Future<$0.Item> updateAmount_Pre($grpc.ServiceCall $call,
      $async.Future<$0.AddAmountRequest> $request) async {
    return updateAmount($call, await $request);
  }

  $async.Future<$0.Item> updateAmount(
      $grpc.ServiceCall call, $0.AddAmountRequest request);

  $async.Future<$0.Item> setAmount_Pre($grpc.ServiceCall $call,
      $async.Future<$0.SetAmountRequest> $request) async {
    return setAmount($call, await $request);
  }

  $async.Future<$0.Item> setAmount(
      $grpc.ServiceCall call, $0.SetAmountRequest request);

  $async.Future<$0.Item> resetAmount_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ResetAmountRequest> $request) async {
    return resetAmount($call, await $request);
  }

  $async.Future<$0.Item> resetAmount(
      $grpc.ServiceCall call, $0.ResetAmountRequest request);

  $async.Future<$0.Pong> ping_Pre(
      $grpc.ServiceCall $call, $async.Future<$1.Empty> $request) async {
    return ping($call, await $request);
  }

  $async.Future<$0.Pong> ping($grpc.ServiceCall call, $1.Empty request);
}
