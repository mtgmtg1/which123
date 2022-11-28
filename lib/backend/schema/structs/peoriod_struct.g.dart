// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peoriod_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PeoriodStruct> _$peoriodStructSerializer =
    new _$PeoriodStructSerializer();

class _$PeoriodStructSerializer implements StructuredSerializer<PeoriodStruct> {
  @override
  final Iterable<Type> types = const [PeoriodStruct, _$PeoriodStruct];
  @override
  final String wireName = 'PeoriodStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PeoriodStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.peoriod;
    if (value != null) {
      result
        ..add('peoriod')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    return result;
  }

  @override
  PeoriodStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PeoriodStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'peoriod':
          result.peoriod.replace(serializers.deserialize(value,
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

class _$PeoriodStruct extends PeoriodStruct {
  @override
  final BuiltList<DateTime>? peoriod;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PeoriodStruct([void Function(PeoriodStructBuilder)? updates]) =>
      (new PeoriodStructBuilder()..update(updates))._build();

  _$PeoriodStruct._({this.peoriod, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PeoriodStruct', 'firestoreUtilData');
  }

  @override
  PeoriodStruct rebuild(void Function(PeoriodStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PeoriodStructBuilder toBuilder() => new PeoriodStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PeoriodStruct &&
        peoriod == other.peoriod &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, peoriod.hashCode), firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PeoriodStruct')
          ..add('peoriod', peoriod)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PeoriodStructBuilder
    implements Builder<PeoriodStruct, PeoriodStructBuilder> {
  _$PeoriodStruct? _$v;

  ListBuilder<DateTime>? _peoriod;
  ListBuilder<DateTime> get peoriod =>
      _$this._peoriod ??= new ListBuilder<DateTime>();
  set peoriod(ListBuilder<DateTime>? peoriod) => _$this._peoriod = peoriod;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PeoriodStructBuilder() {
    PeoriodStruct._initializeBuilder(this);
  }

  PeoriodStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _peoriod = $v.peoriod?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PeoriodStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PeoriodStruct;
  }

  @override
  void update(void Function(PeoriodStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PeoriodStruct build() => _build();

  _$PeoriodStruct _build() {
    _$PeoriodStruct _$result;
    try {
      _$result = _$v ??
          new _$PeoriodStruct._(
              peoriod: _peoriod?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'PeoriodStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'peoriod';
        _peoriod?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PeoriodStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
