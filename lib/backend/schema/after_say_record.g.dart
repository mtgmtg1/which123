// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'after_say_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AfterSayRecord> _$afterSayRecordSerializer =
    new _$AfterSayRecordSerializer();

class _$AfterSayRecordSerializer
    implements StructuredSerializer<AfterSayRecord> {
  @override
  final Iterable<Type> types = const [AfterSayRecord, _$AfterSayRecord];
  @override
  final String wireName = 'AfterSayRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AfterSayRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.goodNum;
    if (value != null) {
      result
        ..add('goodNum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.personRef;
    if (value != null) {
      result
        ..add('personRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  AfterSayRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AfterSayRecordBuilder();

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
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'goodNum':
          result.goodNum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'personRef':
          result.personRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$AfterSayRecord extends AfterSayRecord {
  @override
  final String? title;
  @override
  final String? text;
  @override
  final DateTime? time;
  @override
  final int? goodNum;
  @override
  final DocumentReference<Object?>? personRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AfterSayRecord([void Function(AfterSayRecordBuilder)? updates]) =>
      (new AfterSayRecordBuilder()..update(updates))._build();

  _$AfterSayRecord._(
      {this.title,
      this.text,
      this.time,
      this.goodNum,
      this.personRef,
      this.ffRef})
      : super._();

  @override
  AfterSayRecord rebuild(void Function(AfterSayRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AfterSayRecordBuilder toBuilder() =>
      new AfterSayRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AfterSayRecord &&
        title == other.title &&
        text == other.text &&
        time == other.time &&
        goodNum == other.goodNum &&
        personRef == other.personRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, title.hashCode), text.hashCode), time.hashCode),
                goodNum.hashCode),
            personRef.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AfterSayRecord')
          ..add('title', title)
          ..add('text', text)
          ..add('time', time)
          ..add('goodNum', goodNum)
          ..add('personRef', personRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AfterSayRecordBuilder
    implements Builder<AfterSayRecord, AfterSayRecordBuilder> {
  _$AfterSayRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  int? _goodNum;
  int? get goodNum => _$this._goodNum;
  set goodNum(int? goodNum) => _$this._goodNum = goodNum;

  DocumentReference<Object?>? _personRef;
  DocumentReference<Object?>? get personRef => _$this._personRef;
  set personRef(DocumentReference<Object?>? personRef) =>
      _$this._personRef = personRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AfterSayRecordBuilder() {
    AfterSayRecord._initializeBuilder(this);
  }

  AfterSayRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _text = $v.text;
      _time = $v.time;
      _goodNum = $v.goodNum;
      _personRef = $v.personRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AfterSayRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AfterSayRecord;
  }

  @override
  void update(void Function(AfterSayRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AfterSayRecord build() => _build();

  _$AfterSayRecord _build() {
    final _$result = _$v ??
        new _$AfterSayRecord._(
            title: title,
            text: text,
            time: time,
            goodNum: goodNum,
            personRef: personRef,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
