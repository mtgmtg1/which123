// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feelset_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeelsetRecord> _$feelsetRecordSerializer =
    new _$FeelsetRecordSerializer();

class _$FeelsetRecordSerializer implements StructuredSerializer<FeelsetRecord> {
  @override
  final Iterable<Type> types = const [FeelsetRecord, _$FeelsetRecord];
  @override
  final String wireName = 'FeelsetRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, FeelsetRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.feel;
    if (value != null) {
      result
        ..add('feel')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.createat;
    if (value != null) {
      result
        ..add('createat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userref;
    if (value != null) {
      result
        ..add('userref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.day;
    if (value != null) {
      result
        ..add('day')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.stringfeel;
    if (value != null) {
      result
        ..add('stringfeel')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  FeelsetRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeelsetRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'feel':
          result.feel = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'createat':
          result.createat = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'userref':
          result.userref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'day':
          result.day = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'stringfeel':
          result.stringfeel = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$FeelsetRecord extends FeelsetRecord {
  @override
  final int? feel;
  @override
  final DateTime? createat;
  @override
  final DocumentReference<Object?>? userref;
  @override
  final int? day;
  @override
  final String? stringfeel;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$FeelsetRecord([void Function(FeelsetRecordBuilder)? updates]) =>
      (new FeelsetRecordBuilder()..update(updates))._build();

  _$FeelsetRecord._(
      {this.feel,
      this.createat,
      this.userref,
      this.day,
      this.stringfeel,
      this.ffRef})
      : super._();

  @override
  FeelsetRecord rebuild(void Function(FeelsetRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeelsetRecordBuilder toBuilder() => new FeelsetRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeelsetRecord &&
        feel == other.feel &&
        createat == other.createat &&
        userref == other.userref &&
        day == other.day &&
        stringfeel == other.stringfeel &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, feel.hashCode), createat.hashCode),
                    userref.hashCode),
                day.hashCode),
            stringfeel.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FeelsetRecord')
          ..add('feel', feel)
          ..add('createat', createat)
          ..add('userref', userref)
          ..add('day', day)
          ..add('stringfeel', stringfeel)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class FeelsetRecordBuilder
    implements Builder<FeelsetRecord, FeelsetRecordBuilder> {
  _$FeelsetRecord? _$v;

  int? _feel;
  int? get feel => _$this._feel;
  set feel(int? feel) => _$this._feel = feel;

  DateTime? _createat;
  DateTime? get createat => _$this._createat;
  set createat(DateTime? createat) => _$this._createat = createat;

  DocumentReference<Object?>? _userref;
  DocumentReference<Object?>? get userref => _$this._userref;
  set userref(DocumentReference<Object?>? userref) => _$this._userref = userref;

  int? _day;
  int? get day => _$this._day;
  set day(int? day) => _$this._day = day;

  String? _stringfeel;
  String? get stringfeel => _$this._stringfeel;
  set stringfeel(String? stringfeel) => _$this._stringfeel = stringfeel;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  FeelsetRecordBuilder() {
    FeelsetRecord._initializeBuilder(this);
  }

  FeelsetRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _feel = $v.feel;
      _createat = $v.createat;
      _userref = $v.userref;
      _day = $v.day;
      _stringfeel = $v.stringfeel;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeelsetRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeelsetRecord;
  }

  @override
  void update(void Function(FeelsetRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FeelsetRecord build() => _build();

  _$FeelsetRecord _build() {
    final _$result = _$v ??
        new _$FeelsetRecord._(
            feel: feel,
            createat: createat,
            userref: userref,
            day: day,
            stringfeel: stringfeel,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
