// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feel_set_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FeelSetStruct> _$feelSetStructSerializer =
    new _$FeelSetStructSerializer();

class _$FeelSetStructSerializer implements StructuredSerializer<FeelSetStruct> {
  @override
  final Iterable<Type> types = const [FeelSetStruct, _$FeelSetStruct];
  @override
  final String wireName = 'FeelSetStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, FeelSetStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.feelNum;
    if (value != null) {
      result
        ..add('feelNum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.feelDay;
    if (value != null) {
      result
        ..add('feelDay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  FeelSetStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FeelSetStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'feelNum':
          result.feelNum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'feelDay':
          result.feelDay = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$FeelSetStruct extends FeelSetStruct {
  @override
  final int? feelNum;
  @override
  final DateTime? feelDay;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$FeelSetStruct([void Function(FeelSetStructBuilder)? updates]) =>
      (new FeelSetStructBuilder()..update(updates))._build();

  _$FeelSetStruct._(
      {this.feelNum, this.feelDay, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'FeelSetStruct', 'firestoreUtilData');
  }

  @override
  FeelSetStruct rebuild(void Function(FeelSetStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FeelSetStructBuilder toBuilder() => new FeelSetStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FeelSetStruct &&
        feelNum == other.feelNum &&
        feelDay == other.feelDay &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, feelNum.hashCode), feelDay.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FeelSetStruct')
          ..add('feelNum', feelNum)
          ..add('feelDay', feelDay)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class FeelSetStructBuilder
    implements Builder<FeelSetStruct, FeelSetStructBuilder> {
  _$FeelSetStruct? _$v;

  int? _feelNum;
  int? get feelNum => _$this._feelNum;
  set feelNum(int? feelNum) => _$this._feelNum = feelNum;

  DateTime? _feelDay;
  DateTime? get feelDay => _$this._feelDay;
  set feelDay(DateTime? feelDay) => _$this._feelDay = feelDay;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  FeelSetStructBuilder() {
    FeelSetStruct._initializeBuilder(this);
  }

  FeelSetStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _feelNum = $v.feelNum;
      _feelDay = $v.feelDay;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FeelSetStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FeelSetStruct;
  }

  @override
  void update(void Function(FeelSetStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FeelSetStruct build() => _build();

  _$FeelSetStruct _build() {
    final _$result = _$v ??
        new _$FeelSetStruct._(
            feelNum: feelNum,
            feelDay: feelDay,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'FeelSetStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
