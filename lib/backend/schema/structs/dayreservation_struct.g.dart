// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dayreservation_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DayreservationStruct> _$dayreservationStructSerializer =
    new _$DayreservationStructSerializer();

class _$DayreservationStructSerializer
    implements StructuredSerializer<DayreservationStruct> {
  @override
  final Iterable<Type> types = const [
    DayreservationStruct,
    _$DayreservationStruct
  ];
  @override
  final String wireName = 'DayreservationStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DayreservationStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.m01;
    if (value != null) {
      result
        ..add('m01')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.m02;
    if (value != null) {
      result
        ..add('m02')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.m03;
    if (value != null) {
      result
        ..add('m03')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    value = object.reservations;
    if (value != null) {
      result
        ..add('reservations')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    return result;
  }

  @override
  DayreservationStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DayreservationStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'm01':
          result.m01.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'm02':
          result.m02.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'm03':
          result.m03.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'reservations':
          result.reservations.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(DateTime)]))!
              as BuiltList<Object?>);
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$DayreservationStruct extends DayreservationStruct {
  @override
  final BuiltList<DateTime>? m01;
  @override
  final BuiltList<DateTime>? m02;
  @override
  final BuiltList<DateTime>? m03;
  @override
  final BuiltList<DateTime>? reservations;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$DayreservationStruct(
          [void Function(DayreservationStructBuilder)? updates]) =>
      (new DayreservationStructBuilder()..update(updates))._build();

  _$DayreservationStruct._(
      {this.m01,
      this.m02,
      this.m03,
      this.reservations,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'DayreservationStruct', 'firestoreUtilData');
  }

  @override
  DayreservationStruct rebuild(
          void Function(DayreservationStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DayreservationStructBuilder toBuilder() =>
      new DayreservationStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DayreservationStruct &&
        m01 == other.m01 &&
        m02 == other.m02 &&
        m03 == other.m03 &&
        reservations == other.reservations &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, m01.hashCode), m02.hashCode), m03.hashCode),
            reservations.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DayreservationStruct')
          ..add('m01', m01)
          ..add('m02', m02)
          ..add('m03', m03)
          ..add('reservations', reservations)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class DayreservationStructBuilder
    implements Builder<DayreservationStruct, DayreservationStructBuilder> {
  _$DayreservationStruct? _$v;

  ListBuilder<DateTime>? _m01;
  ListBuilder<DateTime> get m01 => _$this._m01 ??= new ListBuilder<DateTime>();
  set m01(ListBuilder<DateTime>? m01) => _$this._m01 = m01;

  ListBuilder<DateTime>? _m02;
  ListBuilder<DateTime> get m02 => _$this._m02 ??= new ListBuilder<DateTime>();
  set m02(ListBuilder<DateTime>? m02) => _$this._m02 = m02;

  ListBuilder<DateTime>? _m03;
  ListBuilder<DateTime> get m03 => _$this._m03 ??= new ListBuilder<DateTime>();
  set m03(ListBuilder<DateTime>? m03) => _$this._m03 = m03;

  ListBuilder<DateTime>? _reservations;
  ListBuilder<DateTime> get reservations =>
      _$this._reservations ??= new ListBuilder<DateTime>();
  set reservations(ListBuilder<DateTime>? reservations) =>
      _$this._reservations = reservations;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  DayreservationStructBuilder() {
    DayreservationStruct._initializeBuilder(this);
  }

  DayreservationStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _m01 = $v.m01?.toBuilder();
      _m02 = $v.m02?.toBuilder();
      _m03 = $v.m03?.toBuilder();
      _reservations = $v.reservations?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DayreservationStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DayreservationStruct;
  }

  @override
  void update(void Function(DayreservationStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DayreservationStruct build() => _build();

  _$DayreservationStruct _build() {
    _$DayreservationStruct _$result;
    try {
      _$result = _$v ??
          new _$DayreservationStruct._(
              m01: _m01?.build(),
              m02: _m02?.build(),
              m03: _m03?.build(),
              reservations: _reservations?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData,
                  r'DayreservationStruct',
                  'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'm01';
        _m01?.build();
        _$failedField = 'm02';
        _m02?.build();
        _$failedField = 'm03';
        _m03?.build();
        _$failedField = 'reservations';
        _reservations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DayreservationStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
