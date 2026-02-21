// This is a generated file - do not edit.
//
// Generated from pb/crud.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use ingredientDescriptor instead')
const Ingredient$json = {
  '1': 'Ingredient',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
    {'1': 'amount', '3': 3, '4': 1, '5': 1, '10': 'amount'},
  ],
};

/// Descriptor for `Ingredient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingredientDescriptor = $convert.base64Decode(
    'CgpJbmdyZWRpZW50Eg4KAmlkGAEgASgFUgJpZBIUCgVsYWJlbBgCIAEoCVIFbGFiZWwSFgoGYW'
    '1vdW50GAMgASgBUgZhbW91bnQ=');

@$core.Deprecated('Use getIdRequestDescriptor instead')
const GetIdRequest$json = {
  '1': 'GetIdRequest',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `GetIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getIdRequestDescriptor =
    $convert.base64Decode('CgxHZXRJZFJlcXVlc3QSFAoFbGFiZWwYASABKAlSBWxhYmVs');

@$core.Deprecated('Use createIngredientRequestDescriptor instead')
const CreateIngredientRequest$json = {
  '1': 'CreateIngredientRequest',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    {'1': 'amount', '3': 2, '4': 1, '5': 1, '9': 0, '10': 'amount', '17': true},
  ],
  '8': [
    {'1': '_amount'},
  ],
};

/// Descriptor for `CreateIngredientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createIngredientRequestDescriptor =
    $convert.base64Decode(
        'ChdDcmVhdGVJbmdyZWRpZW50UmVxdWVzdBIUCgVsYWJlbBgBIAEoCVIFbGFiZWwSGwoGYW1vdW'
        '50GAIgASgBSABSBmFtb3VudIgBAUIJCgdfYW1vdW50');

@$core.Deprecated('Use deleteIngredientRequestDescriptor instead')
const DeleteIngredientRequest$json = {
  '1': 'DeleteIngredientRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `DeleteIngredientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteIngredientRequestDescriptor = $convert
    .base64Decode('ChdEZWxldGVJbmdyZWRpZW50UmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');

@$core.Deprecated('Use listIngredientsResponseDescriptor instead')
const ListIngredientsResponse$json = {
  '1': 'ListIngredientsResponse',
  '2': [
    {
      '1': 'ingredients',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pantry_protocol.Ingredient',
      '10': 'ingredients'
    },
  ],
};

/// Descriptor for `ListIngredientsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listIngredientsResponseDescriptor =
    $convert.base64Decode(
        'ChdMaXN0SW5ncmVkaWVudHNSZXNwb25zZRI9CgtpbmdyZWRpZW50cxgBIAMoCzIbLnBhbnRyeV'
        '9wcm90b2NvbC5JbmdyZWRpZW50UgtpbmdyZWRpZW50cw==');

@$core.Deprecated('Use updateIngredientRequestDescriptor instead')
const UpdateIngredientRequest$json = {
  '1': 'UpdateIngredientRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
  ],
};

/// Descriptor for `UpdateIngredientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateIngredientRequestDescriptor =
    $convert.base64Decode(
        'ChdVcGRhdGVJbmdyZWRpZW50UmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSFgoGYW1vdW50GAIgAS'
        'gBUgZhbW91bnQ=');

@$core.Deprecated('Use renameIngredientRequestDescriptor instead')
const RenameIngredientRequest$json = {
  '1': 'RenameIngredientRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'newLabel', '3': 2, '4': 1, '5': 9, '10': 'newLabel'},
  ],
};

/// Descriptor for `RenameIngredientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List renameIngredientRequestDescriptor =
    $convert.base64Decode(
        'ChdSZW5hbWVJbmdyZWRpZW50UmVxdWVzdBIOCgJpZBgBIAEoBVICaWQSGgoIbmV3TGFiZWwYAi'
        'ABKAlSCG5ld0xhYmVs');

@$core.Deprecated('Use pongDescriptor instead')
const Pong$json = {
  '1': 'Pong',
  '2': [
    {'1': 'response', '3': 1, '4': 1, '5': 9, '10': 'response'},
  ],
};

/// Descriptor for `Pong`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pongDescriptor =
    $convert.base64Decode('CgRQb25nEhoKCHJlc3BvbnNlGAEgASgJUghyZXNwb25zZQ==');
