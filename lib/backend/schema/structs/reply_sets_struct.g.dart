// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply_sets_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReplySetsStruct> _$replySetsStructSerializer =
    new _$ReplySetsStructSerializer();

class _$ReplySetsStructSerializer
    implements StructuredSerializer<ReplySetsStruct> {
  @override
  final Iterable<Type> types = const [ReplySetsStruct, _$ReplySetsStruct];
  @override
  final String wireName = 'ReplySetsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReplySetsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.replyText;
    if (value != null) {
      result
        ..add('replyText')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.replyId;
    if (value != null) {
      result
        ..add('replyId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ReplySetsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReplySetsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'replyText':
          result.replyText.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'replyId':
          result.replyId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$ReplySetsStruct extends ReplySetsStruct {
  @override
  final BuiltList<String>? replyText;
  @override
  final String? replyId;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ReplySetsStruct([void Function(ReplySetsStructBuilder)? updates]) =>
      (new ReplySetsStructBuilder()..update(updates))._build();

  _$ReplySetsStruct._(
      {this.replyText, this.replyId, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ReplySetsStruct', 'firestoreUtilData');
  }

  @override
  ReplySetsStruct rebuild(void Function(ReplySetsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplySetsStructBuilder toBuilder() =>
      new ReplySetsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplySetsStruct &&
        replyText == other.replyText &&
        replyId == other.replyId &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, replyText.hashCode), replyId.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReplySetsStruct')
          ..add('replyText', replyText)
          ..add('replyId', replyId)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ReplySetsStructBuilder
    implements Builder<ReplySetsStruct, ReplySetsStructBuilder> {
  _$ReplySetsStruct? _$v;

  ListBuilder<String>? _replyText;
  ListBuilder<String> get replyText =>
      _$this._replyText ??= new ListBuilder<String>();
  set replyText(ListBuilder<String>? replyText) =>
      _$this._replyText = replyText;

  String? _replyId;
  String? get replyId => _$this._replyId;
  set replyId(String? replyId) => _$this._replyId = replyId;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ReplySetsStructBuilder() {
    ReplySetsStruct._initializeBuilder(this);
  }

  ReplySetsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _replyText = $v.replyText?.toBuilder();
      _replyId = $v.replyId;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplySetsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReplySetsStruct;
  }

  @override
  void update(void Function(ReplySetsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReplySetsStruct build() => _build();

  _$ReplySetsStruct _build() {
    _$ReplySetsStruct _$result;
    try {
      _$result = _$v ??
          new _$ReplySetsStruct._(
              replyText: _replyText?.build(),
              replyId: replyId,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'ReplySetsStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'replyText';
        _replyText?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReplySetsStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
