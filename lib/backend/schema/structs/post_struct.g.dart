// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostStruct> _$postStructSerializer = new _$PostStructSerializer();

class _$PostStructSerializer implements StructuredSerializer<PostStruct> {
  @override
  final Iterable<Type> types = const [PostStruct, _$PostStruct];
  @override
  final String wireName = 'PostStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'reply',
      serializers.serialize(object.reply,
          specifiedType: const FullType(
              BuiltList, const [const FullType(ReplySetsStruct)])),
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
    value = object.postcategory;
    if (value != null) {
      result
        ..add('postcategory')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.answerR;
    if (value != null) {
      result
        ..add('answerR')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.goodNum;
    if (value != null) {
      result
        ..add('goodNum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.postHead;
    if (value != null) {
      result
        ..add('postHead')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PostStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostStructBuilder();

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
        case 'postcategory':
          result.postcategory.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'answerR':
          result.answerR = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'goodNum':
          result.goodNum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'reply':
          result.reply.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ReplySetsStruct)]))!
              as BuiltList<Object?>);
          break;
        case 'postHead':
          result.postHead = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
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

class _$PostStruct extends PostStruct {
  @override
  final String? title;
  @override
  final BuiltList<String>? postcategory;
  @override
  final bool? answerR;
  @override
  final String? text;
  @override
  final int? goodNum;
  @override
  final BuiltList<ReplySetsStruct> reply;
  @override
  final String? postHead;
  @override
  final String? url;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PostStruct([void Function(PostStructBuilder)? updates]) =>
      (new PostStructBuilder()..update(updates))._build();

  _$PostStruct._(
      {this.title,
      this.postcategory,
      this.answerR,
      this.text,
      this.goodNum,
      required this.reply,
      this.postHead,
      this.url,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(reply, r'PostStruct', 'reply');
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PostStruct', 'firestoreUtilData');
  }

  @override
  PostStruct rebuild(void Function(PostStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostStructBuilder toBuilder() => new PostStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostStruct &&
        title == other.title &&
        postcategory == other.postcategory &&
        answerR == other.answerR &&
        text == other.text &&
        goodNum == other.goodNum &&
        reply == other.reply &&
        postHead == other.postHead &&
        url == other.url &&
        firestoreUtilData == other.firestoreUtilData;
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
                                $jc($jc(0, title.hashCode),
                                    postcategory.hashCode),
                                answerR.hashCode),
                            text.hashCode),
                        goodNum.hashCode),
                    reply.hashCode),
                postHead.hashCode),
            url.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostStruct')
          ..add('title', title)
          ..add('postcategory', postcategory)
          ..add('answerR', answerR)
          ..add('text', text)
          ..add('goodNum', goodNum)
          ..add('reply', reply)
          ..add('postHead', postHead)
          ..add('url', url)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PostStructBuilder implements Builder<PostStruct, PostStructBuilder> {
  _$PostStruct? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  ListBuilder<String>? _postcategory;
  ListBuilder<String> get postcategory =>
      _$this._postcategory ??= new ListBuilder<String>();
  set postcategory(ListBuilder<String>? postcategory) =>
      _$this._postcategory = postcategory;

  bool? _answerR;
  bool? get answerR => _$this._answerR;
  set answerR(bool? answerR) => _$this._answerR = answerR;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  int? _goodNum;
  int? get goodNum => _$this._goodNum;
  set goodNum(int? goodNum) => _$this._goodNum = goodNum;

  ListBuilder<ReplySetsStruct>? _reply;
  ListBuilder<ReplySetsStruct> get reply =>
      _$this._reply ??= new ListBuilder<ReplySetsStruct>();
  set reply(ListBuilder<ReplySetsStruct>? reply) => _$this._reply = reply;

  String? _postHead;
  String? get postHead => _$this._postHead;
  set postHead(String? postHead) => _$this._postHead = postHead;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PostStructBuilder() {
    PostStruct._initializeBuilder(this);
  }

  PostStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _postcategory = $v.postcategory?.toBuilder();
      _answerR = $v.answerR;
      _text = $v.text;
      _goodNum = $v.goodNum;
      _reply = $v.reply.toBuilder();
      _postHead = $v.postHead;
      _url = $v.url;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostStruct;
  }

  @override
  void update(void Function(PostStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostStruct build() => _build();

  _$PostStruct _build() {
    _$PostStruct _$result;
    try {
      _$result = _$v ??
          new _$PostStruct._(
              title: title,
              postcategory: _postcategory?.build(),
              answerR: answerR,
              text: text,
              goodNum: goodNum,
              reply: reply.build(),
              postHead: postHead,
              url: url,
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'PostStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'postcategory';
        _postcategory?.build();

        _$failedField = 'reply';
        reply.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
