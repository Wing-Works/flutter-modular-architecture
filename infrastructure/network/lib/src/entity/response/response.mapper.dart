// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'response.dart';

class ResponseEntityMapper extends ClassMapperBase<ResponseEntity> {
  ResponseEntityMapper._();

  static ResponseEntityMapper? _instance;
  static ResponseEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ResponseEntityMapper._());
      ExceptionEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ResponseEntity';

  static String? _$response(ResponseEntity v) => v.response;
  static const Field<ResponseEntity, String> _f$response = Field(
    'response',
    _$response,
    opt: true,
    def: '',
  );
  static String? _$data(ResponseEntity v) => v.data;
  static const Field<ResponseEntity, String> _f$data = Field(
    'data',
    _$data,
    opt: true,
  );
  static ExceptionEntity? _$error(ResponseEntity v) => v.error;
  static const Field<ResponseEntity, ExceptionEntity> _f$error = Field(
    'error',
    _$error,
    opt: true,
  );
  static String? _$statusCode(ResponseEntity v) => v.statusCode;
  static const Field<ResponseEntity, String> _f$statusCode = Field(
    'statusCode',
    _$statusCode,
    opt: true,
    def: '',
  );
  static bool _$successfulResponse(ResponseEntity v) => v.successfulResponse;
  static const Field<ResponseEntity, bool> _f$successfulResponse = Field(
    'successfulResponse',
    _$successfulResponse,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<ResponseEntity> fields = const {
    #response: _f$response,
    #data: _f$data,
    #error: _f$error,
    #statusCode: _f$statusCode,
    #successfulResponse: _f$successfulResponse,
  };

  static ResponseEntity _instantiate(DecodingData data) {
    return ResponseEntity(
      response: data.dec(_f$response),
      data: data.dec(_f$data),
      error: data.dec(_f$error),
      statusCode: data.dec(_f$statusCode),
      successfulResponse: data.dec(_f$successfulResponse),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ResponseEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ResponseEntity>(map);
  }

  static ResponseEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ResponseEntity>(json);
  }
}

mixin ResponseEntityMappable {
  String toJsonString() {
    return ResponseEntityMapper.ensureInitialized().encodeJson<ResponseEntity>(
      this as ResponseEntity,
    );
  }

  Map<String, dynamic> toJson() {
    return ResponseEntityMapper.ensureInitialized().encodeMap<ResponseEntity>(
      this as ResponseEntity,
    );
  }

  ResponseEntityCopyWith<ResponseEntity, ResponseEntity, ResponseEntity>
  get copyWith => _ResponseEntityCopyWithImpl<ResponseEntity, ResponseEntity>(
    this as ResponseEntity,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ResponseEntityMapper.ensureInitialized().stringifyValue(
      this as ResponseEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ResponseEntityMapper.ensureInitialized().equalsValue(
      this as ResponseEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ResponseEntityMapper.ensureInitialized().hashValue(
      this as ResponseEntity,
    );
  }
}

extension ResponseEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ResponseEntity, $Out> {
  ResponseEntityCopyWith<$R, ResponseEntity, $Out> get $asResponseEntity =>
      $base.as((v, t, t2) => _ResponseEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ResponseEntityCopyWith<$R, $In extends ResponseEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ExceptionEntityCopyWith<$R, ExceptionEntity, ExceptionEntity>? get error;
  $R call({
    String? response,
    String? data,
    ExceptionEntity? error,
    String? statusCode,
    bool? successfulResponse,
  });
  ResponseEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ResponseEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ResponseEntity, $Out>
    implements ResponseEntityCopyWith<$R, ResponseEntity, $Out> {
  _ResponseEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ResponseEntity> $mapper =
      ResponseEntityMapper.ensureInitialized();
  @override
  ExceptionEntityCopyWith<$R, ExceptionEntity, ExceptionEntity>? get error =>
      $value.error?.copyWith.$chain((v) => call(error: v));
  @override
  $R call({
    Object? response = $none,
    Object? data = $none,
    Object? error = $none,
    Object? statusCode = $none,
    bool? successfulResponse,
  }) => $apply(
    FieldCopyWithData({
      if (response != $none) #response: response,
      if (data != $none) #data: data,
      if (error != $none) #error: error,
      if (statusCode != $none) #statusCode: statusCode,
      if (successfulResponse != null) #successfulResponse: successfulResponse,
    }),
  );
  @override
  ResponseEntity $make(CopyWithData data) => ResponseEntity(
    response: data.get(#response, or: $value.response),
    data: data.get(#data, or: $value.data),
    error: data.get(#error, or: $value.error),
    statusCode: data.get(#statusCode, or: $value.statusCode),
    successfulResponse: data.get(
      #successfulResponse,
      or: $value.successfulResponse,
    ),
  );

  @override
  ResponseEntityCopyWith<$R2, ResponseEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ResponseEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

