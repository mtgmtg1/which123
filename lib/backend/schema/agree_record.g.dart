// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agree_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AgreeRecord> _$agreeRecordSerializer = new _$AgreeRecordSerializer();

class _$AgreeRecordSerializer implements StructuredSerializer<AgreeRecord> {
  @override
  final Iterable<Type> types = const [AgreeRecord, _$AgreeRecord];
  @override
  final String wireName = 'AgreeRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AgreeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.editedTime;
    if (value != null) {
      result
        ..add('edited_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userName;
    if (value != null) {
      result
        ..add('user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.service;
    if (value != null) {
      result
        ..add('service')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.company;
    if (value != null) {
      result
        ..add('company')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.personal;
    if (value != null) {
      result
        ..add('personal')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AgreeRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AgreeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'edited_time':
          result.editedTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'user_name':
          result.userName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'service':
          result.service = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'personal':
          result.personal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AgreeRecord extends AgreeRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final DateTime? editedTime;
  @override
  final String? bio;
  @override
  final String? userName;
  @override
  final bool? service;
  @override
  final bool? company;
  @override
  final bool? personal;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AgreeRecord([void Function(AgreeRecordBuilder)? updates]) =>
      (new AgreeRecordBuilder()..update(updates))._build();

  _$AgreeRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.editedTime,
      this.bio,
      this.userName,
      this.service,
      this.company,
      this.personal,
      this.ffRef})
      : super._();

  @override
  AgreeRecord rebuild(void Function(AgreeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AgreeRecordBuilder toBuilder() => new AgreeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AgreeRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        editedTime == other.editedTime &&
        bio == other.bio &&
        userName == other.userName &&
        service == other.service &&
        company == other.company &&
        personal == other.personal &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, email.hashCode),
                                                    displayName.hashCode),
                                                photoUrl.hashCode),
                                            uid.hashCode),
                                        createdTime.hashCode),
                                    phoneNumber.hashCode),
                                editedTime.hashCode),
                            bio.hashCode),
                        userName.hashCode),
                    service.hashCode),
                company.hashCode),
            personal.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AgreeRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('editedTime', editedTime)
          ..add('bio', bio)
          ..add('userName', userName)
          ..add('service', service)
          ..add('company', company)
          ..add('personal', personal)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AgreeRecordBuilder implements Builder<AgreeRecord, AgreeRecordBuilder> {
  _$AgreeRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  DateTime? _editedTime;
  DateTime? get editedTime => _$this._editedTime;
  set editedTime(DateTime? editedTime) => _$this._editedTime = editedTime;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  String? _userName;
  String? get userName => _$this._userName;
  set userName(String? userName) => _$this._userName = userName;

  bool? _service;
  bool? get service => _$this._service;
  set service(bool? service) => _$this._service = service;

  bool? _company;
  bool? get company => _$this._company;
  set company(bool? company) => _$this._company = company;

  bool? _personal;
  bool? get personal => _$this._personal;
  set personal(bool? personal) => _$this._personal = personal;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AgreeRecordBuilder() {
    AgreeRecord._initializeBuilder(this);
  }

  AgreeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _editedTime = $v.editedTime;
      _bio = $v.bio;
      _userName = $v.userName;
      _service = $v.service;
      _company = $v.company;
      _personal = $v.personal;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AgreeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AgreeRecord;
  }

  @override
  void update(void Function(AgreeRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AgreeRecord build() => _build();

  _$AgreeRecord _build() {
    final _$result = _$v ??
        new _$AgreeRecord._(
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            phoneNumber: phoneNumber,
            editedTime: editedTime,
            bio: bio,
            userName: userName,
            service: service,
            company: company,
            personal: personal,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
