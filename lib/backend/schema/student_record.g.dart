// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StudentRecord> _$studentRecordSerializer =
    new _$StudentRecordSerializer();

class _$StudentRecordSerializer implements StructuredSerializer<StudentRecord> {
  @override
  final Iterable<Type> types = const [StudentRecord, _$StudentRecord];
  @override
  final String wireName = 'StudentRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, StudentRecord object,
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
    value = object.personref;
    if (value != null) {
      result
        ..add('personref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.personlistref;
    if (value != null) {
      result
        ..add('personlistref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.proref;
    if (value != null) {
      result
        ..add('proref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.prolistref;
    if (value != null) {
      result
        ..add('prolistref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.stop;
    if (value != null) {
      result
        ..add('stop')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.workhistory;
    if (value != null) {
      result
        ..add('workhistory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.workhistorystring;
    if (value != null) {
      result
        ..add('workhistorystring')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  StudentRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StudentRecordBuilder();

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
        case 'personref':
          result.personref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'personlistref':
          result.personlistref.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'proref':
          result.proref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'prolistref':
          result.prolistref.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'stop':
          result.stop = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'workhistory':
          result.workhistory = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'workhistorystring':
          result.workhistorystring.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$StudentRecord extends StudentRecord {
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
  final DocumentReference<Object?>? personref;
  @override
  final BuiltList<DocumentReference<Object?>>? personlistref;
  @override
  final DocumentReference<Object?>? proref;
  @override
  final BuiltList<DocumentReference<Object?>>? prolistref;
  @override
  final int? price;
  @override
  final bool? stop;
  @override
  final double? workhistory;
  @override
  final BuiltList<String>? workhistorystring;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$StudentRecord([void Function(StudentRecordBuilder)? updates]) =>
      (new StudentRecordBuilder()..update(updates))._build();

  _$StudentRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.editedTime,
      this.bio,
      this.userName,
      this.personref,
      this.personlistref,
      this.proref,
      this.prolistref,
      this.price,
      this.stop,
      this.workhistory,
      this.workhistorystring,
      this.ffRef})
      : super._();

  @override
  StudentRecord rebuild(void Function(StudentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StudentRecordBuilder toBuilder() => new StudentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StudentRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        editedTime == other.editedTime &&
        bio == other.bio &&
        userName == other.userName &&
        personref == other.personref &&
        personlistref == other.personlistref &&
        proref == other.proref &&
        prolistref == other.prolistref &&
        price == other.price &&
        stop == other.stop &&
        workhistory == other.workhistory &&
        workhistorystring == other.workhistorystring &&
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            email
                                                                                .hashCode),
                                                                        displayName
                                                                            .hashCode),
                                                                    photoUrl
                                                                        .hashCode),
                                                                uid.hashCode),
                                                            createdTime
                                                                .hashCode),
                                                        phoneNumber.hashCode),
                                                    editedTime.hashCode),
                                                bio.hashCode),
                                            userName.hashCode),
                                        personref.hashCode),
                                    personlistref.hashCode),
                                proref.hashCode),
                            prolistref.hashCode),
                        price.hashCode),
                    stop.hashCode),
                workhistory.hashCode),
            workhistorystring.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'StudentRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('editedTime', editedTime)
          ..add('bio', bio)
          ..add('userName', userName)
          ..add('personref', personref)
          ..add('personlistref', personlistref)
          ..add('proref', proref)
          ..add('prolistref', prolistref)
          ..add('price', price)
          ..add('stop', stop)
          ..add('workhistory', workhistory)
          ..add('workhistorystring', workhistorystring)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class StudentRecordBuilder
    implements Builder<StudentRecord, StudentRecordBuilder> {
  _$StudentRecord? _$v;

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

  DocumentReference<Object?>? _personref;
  DocumentReference<Object?>? get personref => _$this._personref;
  set personref(DocumentReference<Object?>? personref) =>
      _$this._personref = personref;

  ListBuilder<DocumentReference<Object?>>? _personlistref;
  ListBuilder<DocumentReference<Object?>> get personlistref =>
      _$this._personlistref ??= new ListBuilder<DocumentReference<Object?>>();
  set personlistref(ListBuilder<DocumentReference<Object?>>? personlistref) =>
      _$this._personlistref = personlistref;

  DocumentReference<Object?>? _proref;
  DocumentReference<Object?>? get proref => _$this._proref;
  set proref(DocumentReference<Object?>? proref) => _$this._proref = proref;

  ListBuilder<DocumentReference<Object?>>? _prolistref;
  ListBuilder<DocumentReference<Object?>> get prolistref =>
      _$this._prolistref ??= new ListBuilder<DocumentReference<Object?>>();
  set prolistref(ListBuilder<DocumentReference<Object?>>? prolistref) =>
      _$this._prolistref = prolistref;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  bool? _stop;
  bool? get stop => _$this._stop;
  set stop(bool? stop) => _$this._stop = stop;

  double? _workhistory;
  double? get workhistory => _$this._workhistory;
  set workhistory(double? workhistory) => _$this._workhistory = workhistory;

  ListBuilder<String>? _workhistorystring;
  ListBuilder<String> get workhistorystring =>
      _$this._workhistorystring ??= new ListBuilder<String>();
  set workhistorystring(ListBuilder<String>? workhistorystring) =>
      _$this._workhistorystring = workhistorystring;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  StudentRecordBuilder() {
    StudentRecord._initializeBuilder(this);
  }

  StudentRecordBuilder get _$this {
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
      _personref = $v.personref;
      _personlistref = $v.personlistref?.toBuilder();
      _proref = $v.proref;
      _prolistref = $v.prolistref?.toBuilder();
      _price = $v.price;
      _stop = $v.stop;
      _workhistory = $v.workhistory;
      _workhistorystring = $v.workhistorystring?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StudentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$StudentRecord;
  }

  @override
  void update(void Function(StudentRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StudentRecord build() => _build();

  _$StudentRecord _build() {
    _$StudentRecord _$result;
    try {
      _$result = _$v ??
          new _$StudentRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              editedTime: editedTime,
              bio: bio,
              userName: userName,
              personref: personref,
              personlistref: _personlistref?.build(),
              proref: proref,
              prolistref: _prolistref?.build(),
              price: price,
              stop: stop,
              workhistory: workhistory,
              workhistorystring: _workhistorystring?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'personlistref';
        _personlistref?.build();

        _$failedField = 'prolistref';
        _prolistref?.build();

        _$failedField = 'workhistorystring';
        _workhistorystring?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'StudentRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
