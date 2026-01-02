// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'auth.dart';

class AuthModelMapper extends ClassMapperBase<AuthModel> {
  AuthModelMapper._();

  static AuthModelMapper? _instance;
  static AuthModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AuthModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'AuthModel';

  static int _$myValue(AuthModel v) => v.myValue;
  static const Field<AuthModel, int> _f$myValue = Field('myValue', _$myValue);

  @override
  final MappableFields<AuthModel> fields = const {#myValue: _f$myValue};

  static AuthModel _instantiate(DecodingData data) {
    return AuthModel(data.dec(_f$myValue));
  }

  @override
  final Function instantiate = _instantiate;

  static AuthModel fromJson(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<AuthModel>(map);
  }

  static AuthModel fromJsonString(String json) {
    return ensureInitialized().decodeJson<AuthModel>(json);
  }
}

mixin AuthModelMappable {
  String toJsonString() {
    return AuthModelMapper.ensureInitialized().encodeJson<AuthModel>(
      this as AuthModel,
    );
  }

  Map<String, dynamic> toJson() {
    return AuthModelMapper.ensureInitialized().encodeMap<AuthModel>(
      this as AuthModel,
    );
  }

  AuthModelCopyWith<AuthModel, AuthModel, AuthModel> get copyWith =>
      _AuthModelCopyWithImpl<AuthModel, AuthModel>(
        this as AuthModel,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AuthModelMapper.ensureInitialized().stringifyValue(
      this as AuthModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return AuthModelMapper.ensureInitialized().equalsValue(
      this as AuthModel,
      other,
    );
  }

  @override
  int get hashCode {
    return AuthModelMapper.ensureInitialized().hashValue(this as AuthModel);
  }
}

extension AuthModelValueCopy<$R, $Out> on ObjectCopyWith<$R, AuthModel, $Out> {
  AuthModelCopyWith<$R, AuthModel, $Out> get $asAuthModel =>
      $base.as((v, t, t2) => _AuthModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AuthModelCopyWith<$R, $In extends AuthModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? myValue});
  AuthModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AuthModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, AuthModel, $Out>
    implements AuthModelCopyWith<$R, AuthModel, $Out> {
  _AuthModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<AuthModel> $mapper =
      AuthModelMapper.ensureInitialized();
  @override
  $R call({int? myValue}) =>
      $apply(FieldCopyWithData({if (myValue != null) #myValue: myValue}));
  @override
  AuthModel $make(CopyWithData data) =>
      AuthModel(data.get(#myValue, or: $value.myValue));

  @override
  AuthModelCopyWith<$R2, AuthModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

