// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'which_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WhichRecord> _$whichRecordSerializer = new _$WhichRecordSerializer();

class _$WhichRecordSerializer implements StructuredSerializer<WhichRecord> {
  @override
  final Iterable<Type> types = const [WhichRecord, _$WhichRecord];
  @override
  final String wireName = 'WhichRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, WhichRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.add;
    if (value != null) {
      result
        ..add('add')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rUteacher;
    if (value != null) {
      result
        ..add('rUteacher')
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
  WhichRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WhichRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'add':
          result.add = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rUteacher':
          result.rUteacher = serializers.deserialize(value,
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

class _$WhichRecord extends WhichRecord {
  @override
  final String? add;
  @override
  final String? rUteacher;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WhichRecord([void Function(WhichRecordBuilder)? updates]) =>
      (new WhichRecordBuilder()..update(updates))._build();

  _$WhichRecord._({this.add, this.rUteacher, this.ffRef}) : super._();

  @override
  WhichRecord rebuild(void Function(WhichRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WhichRecordBuilder toBuilder() => new WhichRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WhichRecord &&
        add == other.add &&
        rUteacher == other.rUteacher &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, add.hashCode), rUteacher.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WhichRecord')
          ..add('add', add)
          ..add('rUteacher', rUteacher)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WhichRecordBuilder implements Builder<WhichRecord, WhichRecordBuilder> {
  _$WhichRecord? _$v;

  String? _add;
  String? get add => _$this._add;
  set add(String? add) => _$this._add = add;

  String? _rUteacher;
  String? get rUteacher => _$this._rUteacher;
  set rUteacher(String? rUteacher) => _$this._rUteacher = rUteacher;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WhichRecordBuilder() {
    WhichRecord._initializeBuilder(this);
  }

  WhichRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _add = $v.add;
      _rUteacher = $v.rUteacher;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WhichRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WhichRecord;
  }

  @override
  void update(void Function(WhichRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WhichRecord build() => _build();

  _$WhichRecord _build() {
    final _$result = _$v ??
        new _$WhichRecord._(add: add, rUteacher: rUteacher, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
