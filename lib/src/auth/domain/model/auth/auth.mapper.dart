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

  static int _$id(AuthModel v) => v.id;
  static const Field<AuthModel, int> _f$id = Field('id', _$id);
  static String _$username(AuthModel v) => v.username;
  static const Field<AuthModel, String> _f$username = Field(
    'username',
    _$username,
  );
  static String _$email(AuthModel v) => v.email;
  static const Field<AuthModel, String> _f$email = Field('email', _$email);
  static String _$firstName(AuthModel v) => v.firstName;
  static const Field<AuthModel, String> _f$firstName = Field(
    'firstName',
    _$firstName,
  );
  static String _$lastName(AuthModel v) => v.lastName;
  static const Field<AuthModel, String> _f$lastName = Field(
    'lastName',
    _$lastName,
  );
  static String _$gender(AuthModel v) => v.gender;
  static const Field<AuthModel, String> _f$gender = Field('gender', _$gender);
  static String _$image(AuthModel v) => v.image;
  static const Field<AuthModel, String> _f$image = Field('image', _$image);
  static String _$accessToken(AuthModel v) => v.accessToken;
  static const Field<AuthModel, String> _f$accessToken = Field(
    'accessToken',
    _$accessToken,
  );
  static String _$refreshToken(AuthModel v) => v.refreshToken;
  static const Field<AuthModel, String> _f$refreshToken = Field(
    'refreshToken',
    _$refreshToken,
  );

  @override
  final MappableFields<AuthModel> fields = const {
    #id: _f$id,
    #username: _f$username,
    #email: _f$email,
    #firstName: _f$firstName,
    #lastName: _f$lastName,
    #gender: _f$gender,
    #image: _f$image,
    #accessToken: _f$accessToken,
    #refreshToken: _f$refreshToken,
  };

  static AuthModel _instantiate(DecodingData data) {
    return AuthModel(
      id: data.dec(_f$id),
      username: data.dec(_f$username),
      email: data.dec(_f$email),
      firstName: data.dec(_f$firstName),
      lastName: data.dec(_f$lastName),
      gender: data.dec(_f$gender),
      image: data.dec(_f$image),
      accessToken: data.dec(_f$accessToken),
      refreshToken: data.dec(_f$refreshToken),
    );
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
  $R call({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? accessToken,
    String? refreshToken,
  });
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
  $R call({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? accessToken,
    String? refreshToken,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (username != null) #username: username,
      if (email != null) #email: email,
      if (firstName != null) #firstName: firstName,
      if (lastName != null) #lastName: lastName,
      if (gender != null) #gender: gender,
      if (image != null) #image: image,
      if (accessToken != null) #accessToken: accessToken,
      if (refreshToken != null) #refreshToken: refreshToken,
    }),
  );
  @override
  AuthModel $make(CopyWithData data) => AuthModel(
    id: data.get(#id, or: $value.id),
    username: data.get(#username, or: $value.username),
    email: data.get(#email, or: $value.email),
    firstName: data.get(#firstName, or: $value.firstName),
    lastName: data.get(#lastName, or: $value.lastName),
    gender: data.get(#gender, or: $value.gender),
    image: data.get(#image, or: $value.image),
    accessToken: data.get(#accessToken, or: $value.accessToken),
    refreshToken: data.get(#refreshToken, or: $value.refreshToken),
  );

  @override
  AuthModelCopyWith<$R2, AuthModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _AuthModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

