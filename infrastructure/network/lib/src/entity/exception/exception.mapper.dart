// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exception.dart';

class ExceptionEntityMapper extends ClassMapperBase<ExceptionEntity> {
  ExceptionEntityMapper._();

  static ExceptionEntityMapper? _instance;
  static ExceptionEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExceptionEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ExceptionEntity';

  static int _$code(ExceptionEntity v) => v.code;
  static const Field<ExceptionEntity, int> _f$code = Field(
    'code',
    _$code,
    opt: true,
    def: 400,
  );
  static String _$error(ExceptionEntity v) => v.error;
  static const Field<ExceptionEntity, String> _f$error = Field(
    'error',
    _$error,
    opt: true,
    def: '',
  );
  static String _$message(ExceptionEntity v) => v.message;
  static const Field<ExceptionEntity, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
    def: '',
  );
  static List<String>? _$errors(ExceptionEntity v) => v.errors;
  static const Field<ExceptionEntity, List<String>> _f$errors = Field(
    'errors',
    _$errors,
    opt: true,
  );

  @override
  final MappableFields<ExceptionEntity> fields = const {
    #code: _f$code,
    #error: _f$error,
    #message: _f$message,
    #errors: _f$errors,
  };

  static ExceptionEntity _instantiate(DecodingData data) {
    return ExceptionEntity(
      code: data.dec(_f$code),
      error: data.dec(_f$error),
      message: data.dec(_f$message),
      errors: data.dec(_f$errors),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ExceptionEntity fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExceptionEntity>(map);
  }

  static ExceptionEntity fromJsonString(String json) {
    return ensureInitialized().decodeJson<ExceptionEntity>(json);
  }
}

mixin ExceptionEntityMappable {
  String toJsonString() {
    return ExceptionEntityMapper.ensureInitialized()
        .encodeJson<ExceptionEntity>(this as ExceptionEntity);
  }

  Map<String, dynamic> toJson() {
    return ExceptionEntityMapper.ensureInitialized().encodeMap<ExceptionEntity>(
      this as ExceptionEntity,
    );
  }

  ExceptionEntityCopyWith<ExceptionEntity, ExceptionEntity, ExceptionEntity>
  get copyWith =>
      _ExceptionEntityCopyWithImpl<ExceptionEntity, ExceptionEntity>(
        this as ExceptionEntity,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExceptionEntityMapper.ensureInitialized().stringifyValue(
      this as ExceptionEntity,
    );
  }

  @override
  bool operator ==(Object other) {
    return ExceptionEntityMapper.ensureInitialized().equalsValue(
      this as ExceptionEntity,
      other,
    );
  }

  @override
  int get hashCode {
    return ExceptionEntityMapper.ensureInitialized().hashValue(
      this as ExceptionEntity,
    );
  }
}

extension ExceptionEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExceptionEntity, $Out> {
  ExceptionEntityCopyWith<$R, ExceptionEntity, $Out> get $asExceptionEntity =>
      $base.as((v, t, t2) => _ExceptionEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExceptionEntityCopyWith<$R, $In extends ExceptionEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get errors;
  $R call({int? code, String? error, String? message, List<String>? errors});
  ExceptionEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ExceptionEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExceptionEntity, $Out>
    implements ExceptionEntityCopyWith<$R, ExceptionEntity, $Out> {
  _ExceptionEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExceptionEntity> $mapper =
      ExceptionEntityMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get errors =>
      $value.errors != null
      ? ListCopyWith(
          $value.errors!,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(errors: v),
        )
      : null;
  @override
  $R call({
    int? code,
    String? error,
    String? message,
    Object? errors = $none,
  }) => $apply(
    FieldCopyWithData({
      if (code != null) #code: code,
      if (error != null) #error: error,
      if (message != null) #message: message,
      if (errors != $none) #errors: errors,
    }),
  );
  @override
  ExceptionEntity $make(CopyWithData data) => ExceptionEntity(
    code: data.get(#code, or: $value.code),
    error: data.get(#error, or: $value.error),
    message: data.get(#message, or: $value.message),
    errors: data.get(#errors, or: $value.errors),
  );

  @override
  ExceptionEntityCopyWith<$R2, ExceptionEntity, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExceptionEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

