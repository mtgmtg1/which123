// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hire_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HireStruct> _$hireStructSerializer = new _$HireStructSerializer();

class _$HireStructSerializer implements StructuredSerializer<HireStruct> {
  @override
  final Iterable<Type> types = const [HireStruct, _$HireStruct];
  @override
  final String wireName = 'HireStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, HireStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'peoriodSet',
      serializers.serialize(object.peoriodSet,
          specifiedType: const FullType(PeoriodStruct)),
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  HireStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HireStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'peoriodSet':
          result.peoriodSet.replace(serializers.deserialize(value,
              specifiedType: const FullType(PeoriodStruct))! as PeoriodStruct);
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

class _$HireStruct extends HireStruct {
  @override
  final String? title;
  @override
  final String? text;
  @override
  final PeoriodStruct peoriodSet;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$HireStruct([void Function(HireStructBuilder)? updates]) =>
      (new HireStructBuilder()..update(updates))._build();

  _$HireStruct._(
      {this.title,
      this.text,
      required this.peoriodSet,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        peoriodSet, r'HireStruct', 'peoriodSet');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'HireStruct', 'firestoreUtilData');
  }

  @override
  HireStruct rebuild(void Function(HireStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HireStructBuilder toBuilder() => new HireStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HireStruct &&
        title == other.title &&
        text == other.text &&
        peoriodSet == other.peoriodSet &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), text.hashCode), peoriodSet.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HireStruct')
          ..add('title', title)
          ..add('text', text)
          ..add('peoriodSet', peoriodSet)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class HireStructBuilder implements Builder<HireStruct, HireStructBuilder> {
  _$HireStruct? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  PeoriodStructBuilder? _peoriodSet;
  PeoriodStructBuilder get peoriodSet =>
      _$this._peoriodSet ??= new PeoriodStructBuilder();
  set peoriodSet(PeoriodStructBuilder? peoriodSet) =>
      _$this._peoriodSet = peoriodSet;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  HireStructBuilder() {
    HireStruct._initializeBuilder(this);
  }

  HireStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _text = $v.text;
      _peoriodSet = $v.peoriodSet.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HireStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HireStruct;
  }

  @override
  void update(void Function(HireStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HireStruct build() => _build();

  _$HireStruct _build() {
    _$HireStruct _$result;
    try {
      _$result = _$v ??
          new _$HireStruct._(
              title: title,
              text: text,
              peoriodSet: peoriodSet.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'HireStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'peoriodSet';
        peoriodSet.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'HireStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
