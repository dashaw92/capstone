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
  ],
};

/// Descriptor for `Ingredient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ingredientDescriptor = $convert.base64Decode(
    'CgpJbmdyZWRpZW50Eg4KAmlkGAEgASgFUgJpZBIUCgVsYWJlbBgCIAEoCVIFbGFiZWw=');

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

@$core.Deprecated('Use createIngredientsRequestDescriptor instead')
const CreateIngredientsRequest$json = {
  '1': 'CreateIngredientsRequest',
  '2': [
    {'1': 'label', '3': 1, '4': 3, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `CreateIngredientsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createIngredientsRequestDescriptor =
    $convert.base64Decode(
        'ChhDcmVhdGVJbmdyZWRpZW50c1JlcXVlc3QSFAoFbGFiZWwYASADKAlSBWxhYmVs');

@$core.Deprecated('Use createdIngredientsResponseDescriptor instead')
const CreatedIngredientsResponse$json = {
  '1': 'CreatedIngredientsResponse',
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

/// Descriptor for `CreatedIngredientsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createdIngredientsResponseDescriptor =
    $convert.base64Decode(
        'ChpDcmVhdGVkSW5ncmVkaWVudHNSZXNwb25zZRI9CgtpbmdyZWRpZW50cxgBIAMoCzIbLnBhbn'
        'RyeV9wcm90b2NvbC5JbmdyZWRpZW50UgtpbmdyZWRpZW50cw==');

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

@$core.Deprecated('Use extractorDescriptor instead')
const Extractor$json = {
  '1': 'Extractor',
  '2': [
    {'1': 'baseDomain', '3': 1, '4': 1, '5': 9, '10': 'baseDomain'},
  ],
};

/// Descriptor for `Extractor`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extractorDescriptor = $convert.base64Decode(
    'CglFeHRyYWN0b3ISHgoKYmFzZURvbWFpbhgBIAEoCVIKYmFzZURvbWFpbg==');

@$core.Deprecated('Use listExtractorsResponseDescriptor instead')
const ListExtractorsResponse$json = {
  '1': 'ListExtractorsResponse',
  '2': [
    {
      '1': 'extractors',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pantry_protocol.Extractor',
      '10': 'extractors'
    },
  ],
};

/// Descriptor for `ListExtractorsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listExtractorsResponseDescriptor =
    $convert.base64Decode(
        'ChZMaXN0RXh0cmFjdG9yc1Jlc3BvbnNlEjoKCmV4dHJhY3RvcnMYASADKAsyGi5wYW50cnlfcH'
        'JvdG9jb2wuRXh0cmFjdG9yUgpleHRyYWN0b3Jz');

@$core.Deprecated('Use executeExtractorRequestDescriptor instead')
const ExecuteExtractorRequest$json = {
  '1': 'ExecuteExtractorRequest',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `ExecuteExtractorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeExtractorRequestDescriptor =
    $convert.base64Decode(
        'ChdFeGVjdXRlRXh0cmFjdG9yUmVxdWVzdBIQCgN1cmwYASABKAlSA3VybA==');

@$core.Deprecated('Use extractorExecutionResponseDescriptor instead')
const ExtractorExecutionResponse$json = {
  '1': 'ExtractorExecutionResponse',
  '2': [
    {'1': 'ingredients', '3': 1, '4': 3, '5': 9, '10': 'ingredients'},
  ],
};

/// Descriptor for `ExtractorExecutionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extractorExecutionResponseDescriptor =
    $convert.base64Decode(
        'ChpFeHRyYWN0b3JFeGVjdXRpb25SZXNwb25zZRIgCgtpbmdyZWRpZW50cxgBIAMoCVILaW5ncm'
        'VkaWVudHM=');

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
