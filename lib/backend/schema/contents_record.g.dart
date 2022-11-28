// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contents_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContentsRecord> _$contentsRecordSerializer =
    new _$ContentsRecordSerializer();

class _$ContentsRecordSerializer
    implements StructuredSerializer<ContentsRecord> {
  @override
  final Iterable<Type> types = const [ContentsRecord, _$ContentsRecord];
  @override
  final String wireName = 'ContentsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ContentsRecord object,
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
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postTime;
    if (value != null) {
      result
        ..add('postTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.newUrl;
    if (value != null) {
      result
        ..add('newUrl')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.catergory;
    if (value != null) {
      result
        ..add('catergory')
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
  ContentsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContentsRecordBuilder();

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
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postTime':
          result.postTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'newUrl':
          result.newUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'catergory':
          result.catergory = serializers.deserialize(value,
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

class _$ContentsRecord extends ContentsRecord {
  @override
  final String? title;
  @override
  final String? text;
  @override
  final String? image;
  @override
  final DateTime? postTime;
  @override
  final String? newUrl;
  @override
  final String? catergory;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ContentsRecord([void Function(ContentsRecordBuilder)? updates]) =>
      (new ContentsRecordBuilder()..update(updates))._build();

  _$ContentsRecord._(
      {this.title,
      this.text,
      this.image,
      this.postTime,
      this.newUrl,
      this.catergory,
      this.ffRef})
      : super._();

  @override
  ContentsRecord rebuild(void Function(ContentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContentsRecordBuilder toBuilder() =>
      new ContentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContentsRecord &&
        title == other.title &&
        text == other.text &&
        image == other.image &&
        postTime == other.postTime &&
        newUrl == other.newUrl &&
        catergory == other.catergory &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, title.hashCode), text.hashCode),
                        image.hashCode),
                    postTime.hashCode),
                newUrl.hashCode),
            catergory.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContentsRecord')
          ..add('title', title)
          ..add('text', text)
          ..add('image', image)
          ..add('postTime', postTime)
          ..add('newUrl', newUrl)
          ..add('catergory', catergory)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ContentsRecordBuilder
    implements Builder<ContentsRecord, ContentsRecordBuilder> {
  _$ContentsRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  DateTime? _postTime;
  DateTime? get postTime => _$this._postTime;
  set postTime(DateTime? postTime) => _$this._postTime = postTime;

  String? _newUrl;
  String? get newUrl => _$this._newUrl;
  set newUrl(String? newUrl) => _$this._newUrl = newUrl;

  String? _catergory;
  String? get catergory => _$this._catergory;
  set catergory(String? catergory) => _$this._catergory = catergory;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ContentsRecordBuilder() {
    ContentsRecord._initializeBuilder(this);
  }

  ContentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _text = $v.text;
      _image = $v.image;
      _postTime = $v.postTime;
      _newUrl = $v.newUrl;
      _catergory = $v.catergory;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContentsRecord;
  }

  @override
  void update(void Function(ContentsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContentsRecord build() => _build();

  _$ContentsRecord _build() {
    final _$result = _$v ??
        new _$ContentsRecord._(
            title: title,
            text: text,
            image: image,
            postTime: postTime,
            newUrl: newUrl,
            catergory: catergory,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
