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

@$core.Deprecated('Use upcDescriptor instead')
const Upc$json = {
  '1': 'Upc',
  '2': [
    {'1': 'upc', '3': 1, '4': 1, '5': 9, '10': 'upc'},
    {'1': 'nameId', '3': 2, '4': 1, '5': 5, '10': 'nameId'},
  ],
};

/// Descriptor for `Upc`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upcDescriptor = $convert.base64Decode(
    'CgNVcGMSEAoDdXBjGAEgASgJUgN1cGMSFgoGbmFtZUlkGAIgASgFUgZuYW1lSWQ=');

@$core.Deprecated('Use nameDescriptor instead')
const Name$json = {
  '1': 'Name',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'label', '3': 2, '4': 1, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `Name`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nameDescriptor = $convert.base64Decode(
    'CgROYW1lEg4KAmlkGAEgASgFUgJpZBIUCgVsYWJlbBgCIAEoCVIFbGFiZWw=');

@$core.Deprecated('Use itemDescriptor instead')
const Item$json = {
  '1': 'Item',
  '2': [
    {'1': 'nameId', '3': 1, '4': 1, '5': 5, '10': 'nameId'},
    {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
  ],
};

/// Descriptor for `Item`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itemDescriptor = $convert.base64Decode(
    'CgRJdGVtEhYKBm5hbWVJZBgBIAEoBVIGbmFtZUlkEhYKBmFtb3VudBgCIAEoAVIGYW1vdW50');

@$core.Deprecated('Use createUpcResponseDescriptor instead')
const CreateUpcResponse$json = {
  '1': 'CreateUpcResponse',
  '2': [
    {
      '1': 'upc',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.pantry_protocol.Upc',
      '10': 'upc'
    },
  ],
};

/// Descriptor for `CreateUpcResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUpcResponseDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVVcGNSZXNwb25zZRImCgN1cGMYASABKAsyFC5wYW50cnlfcHJvdG9jb2wuVXBjUg'
    'N1cGM=');

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

@$core.Deprecated('Use getUpcsRequestDescriptor instead')
const GetUpcsRequest$json = {
  '1': 'GetUpcsRequest',
  '2': [
    {'1': 'nameId', '3': 1, '4': 1, '5': 5, '10': 'nameId'},
  ],
};

/// Descriptor for `GetUpcsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUpcsRequestDescriptor = $convert
    .base64Decode('Cg5HZXRVcGNzUmVxdWVzdBIWCgZuYW1lSWQYASABKAVSBm5hbWVJZA==');

@$core.Deprecated('Use listUpcsResponseDescriptor instead')
const ListUpcsResponse$json = {
  '1': 'ListUpcsResponse',
  '2': [
    {
      '1': 'upcs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pantry_protocol.Upc',
      '10': 'upcs'
    },
  ],
};

/// Descriptor for `ListUpcsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listUpcsResponseDescriptor = $convert.base64Decode(
    'ChBMaXN0VXBjc1Jlc3BvbnNlEigKBHVwY3MYASADKAsyFC5wYW50cnlfcHJvdG9jb2wuVXBjUg'
    'R1cGNz');

@$core.Deprecated('Use deleteUpcRequestDescriptor instead')
const DeleteUpcRequest$json = {
  '1': 'DeleteUpcRequest',
  '2': [
    {'1': 'upc', '3': 1, '4': 1, '5': 9, '10': 'upc'},
  ],
};

/// Descriptor for `DeleteUpcRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUpcRequestDescriptor =
    $convert.base64Decode('ChBEZWxldGVVcGNSZXF1ZXN0EhAKA3VwYxgBIAEoCVIDdXBj');

@$core.Deprecated('Use deleteUpcsRequestDescriptor instead')
const DeleteUpcsRequest$json = {
  '1': 'DeleteUpcsRequest',
  '2': [
    {'1': 'nameId', '3': 1, '4': 1, '5': 5, '10': 'nameId'},
  ],
};

/// Descriptor for `DeleteUpcsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUpcsRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVVcGNzUmVxdWVzdBIWCgZuYW1lSWQYASABKAVSBm5hbWVJZA==');

@$core.Deprecated('Use createNameRequestDescriptor instead')
const CreateNameRequest$json = {
  '1': 'CreateNameRequest',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
  ],
};

/// Descriptor for `CreateNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createNameRequestDescriptor = $convert
    .base64Decode('ChFDcmVhdGVOYW1lUmVxdWVzdBIUCgVsYWJlbBgBIAEoCVIFbGFiZWw=');

@$core.Deprecated('Use deleteNameRequestDescriptor instead')
const DeleteNameRequest$json = {
  '1': 'DeleteNameRequest',
  '2': [
    {'1': 'nameId', '3': 1, '4': 1, '5': 5, '10': 'nameId'},
  ],
};

/// Descriptor for `DeleteNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteNameRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVOYW1lUmVxdWVzdBIWCgZuYW1lSWQYASABKAVSBm5hbWVJZA==');

@$core.Deprecated('Use listNamesResponseDescriptor instead')
const ListNamesResponse$json = {
  '1': 'ListNamesResponse',
  '2': [
    {
      '1': 'names',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.pantry_protocol.Name',
      '10': 'names'
    },
  ],
};

/// Descriptor for `ListNamesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listNamesResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0TmFtZXNSZXNwb25zZRIrCgVuYW1lcxgBIAMoCzIVLnBhbnRyeV9wcm90b2NvbC5OYW'
    '1lUgVuYW1lcw==');

@$core.Deprecated('Use getAmountRequestDescriptor instead')
const GetAmountRequest$json = {
  '1': 'GetAmountRequest',
  '2': [
    {'1': 'nameId', '3': 1, '4': 1, '5': 5, '10': 'nameId'},
  ],
};

/// Descriptor for `GetAmountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAmountRequestDescriptor = $convert
    .base64Decode('ChBHZXRBbW91bnRSZXF1ZXN0EhYKBm5hbWVJZBgBIAEoBVIGbmFtZUlk');

@$core.Deprecated('Use addAmountRequestDescriptor instead')
const AddAmountRequest$json = {
  '1': 'AddAmountRequest',
  '2': [
    {'1': 'nameId', '3': 1, '4': 1, '5': 5, '10': 'nameId'},
    {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
  ],
};

/// Descriptor for `AddAmountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addAmountRequestDescriptor = $convert.base64Decode(
    'ChBBZGRBbW91bnRSZXF1ZXN0EhYKBm5hbWVJZBgBIAEoBVIGbmFtZUlkEhYKBmFtb3VudBgCIA'
    'EoAVIGYW1vdW50');

@$core.Deprecated('Use setAmountRequestDescriptor instead')
const SetAmountRequest$json = {
  '1': 'SetAmountRequest',
  '2': [
    {'1': 'nameId', '3': 1, '4': 1, '5': 5, '10': 'nameId'},
    {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
  ],
};

/// Descriptor for `SetAmountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setAmountRequestDescriptor = $convert.base64Decode(
    'ChBTZXRBbW91bnRSZXF1ZXN0EhYKBm5hbWVJZBgBIAEoBVIGbmFtZUlkEhYKBmFtb3VudBgCIA'
    'EoAVIGYW1vdW50');

@$core.Deprecated('Use resetAmountRequestDescriptor instead')
const ResetAmountRequest$json = {
  '1': 'ResetAmountRequest',
  '2': [
    {'1': 'nameId', '3': 1, '4': 1, '5': 5, '10': 'nameId'},
  ],
};

/// Descriptor for `ResetAmountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetAmountRequestDescriptor =
    $convert.base64Decode(
        'ChJSZXNldEFtb3VudFJlcXVlc3QSFgoGbmFtZUlkGAEgASgFUgZuYW1lSWQ=');

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
