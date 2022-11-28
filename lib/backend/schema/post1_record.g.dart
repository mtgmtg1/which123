// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post1_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Post1Record> _$post1RecordSerializer = new _$Post1RecordSerializer();

class _$Post1RecordSerializer implements StructuredSerializer<Post1Record> {
  @override
  final Iterable<Type> types = const [Post1Record, _$Post1Record];
  @override
  final String wireName = 'Post1Record';

  @override
  Iterable<Object?> serialize(Serializers serializers, Post1Record object,
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
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.postID;
    if (value != null) {
      result
        ..add('postID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postCategory;
    if (value != null) {
      result
        ..add('postCategory')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.createTime;
    if (value != null) {
      result
        ..add('createTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.view;
    if (value != null) {
      result
        ..add('view')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.whoansnormal;
    if (value != null) {
      result
        ..add('whoansnormal')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.whoanspro;
    if (value != null) {
      result
        ..add('whoanspro')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.whoansstudent;
    if (value != null) {
      result
        ..add('whoansstudent')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.whoanswer;
    if (value != null) {
      result
        ..add('whoanswer')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.goodnumperson;
    if (value != null) {
      result
        ..add('goodnumperson')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.answernum;
    if (value != null) {
      result
        ..add('answernum')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  Post1Record deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new Post1RecordBuilder();

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
        case 'postHead':
          result.postHead = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ref':
          result.ref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'postID':
          result.postID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'postCategory':
          result.postCategory.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'createTime':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'view':
          result.view = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'whoansnormal':
          result.whoansnormal = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'whoanspro':
          result.whoanspro = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'whoansstudent':
          result.whoansstudent = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'whoanswer':
          result.whoanswer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'goodnumperson':
          result.goodnumperson.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'answernum':
          result.answernum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$Post1Record extends Post1Record {
  @override
  final String? title;
  @override
  final bool? answerR;
  @override
  final String? text;
  @override
  final int? goodNum;
  @override
  final String? postHead;
  @override
  final String? url;
  @override
  final DocumentReference<Object?>? ref;
  @override
  final String? postID;
  @override
  final BuiltList<String>? postCategory;
  @override
  final DateTime? createTime;
  @override
  final int? view;
  @override
  final String? image;
  @override
  final bool? whoansnormal;
  @override
  final bool? whoanspro;
  @override
  final bool? whoansstudent;
  @override
  final String? whoanswer;
  @override
  final BuiltList<DocumentReference<Object?>>? goodnumperson;
  @override
  final int? answernum;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$Post1Record([void Function(Post1RecordBuilder)? updates]) =>
      (new Post1RecordBuilder()..update(updates))._build();

  _$Post1Record._(
      {this.title,
      this.answerR,
      this.text,
      this.goodNum,
      this.postHead,
      this.url,
      this.ref,
      this.postID,
      this.postCategory,
      this.createTime,
      this.view,
      this.image,
      this.whoansnormal,
      this.whoanspro,
      this.whoansstudent,
      this.whoanswer,
      this.goodnumperson,
      this.answernum,
      this.ffRef})
      : super._();

  @override
  Post1Record rebuild(void Function(Post1RecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  Post1RecordBuilder toBuilder() => new Post1RecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post1Record &&
        title == other.title &&
        answerR == other.answerR &&
        text == other.text &&
        goodNum == other.goodNum &&
        postHead == other.postHead &&
        url == other.url &&
        ref == other.ref &&
        postID == other.postID &&
        postCategory == other.postCategory &&
        createTime == other.createTime &&
        view == other.view &&
        image == other.image &&
        whoansnormal == other.whoansnormal &&
        whoanspro == other.whoanspro &&
        whoansstudent == other.whoansstudent &&
        whoanswer == other.whoanswer &&
        goodnumperson == other.goodnumperson &&
        answernum == other.answernum &&
        ffRef == other.ffRef;
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                0,
                                                                                title
                                                                                    .hashCode),
                                                                            answerR
                                                                                .hashCode),
                                                                        text
                                                                            .hashCode),
                                                                    goodNum
                                                                        .hashCode),
                                                                postHead
                                                                    .hashCode),
                                                            url.hashCode),
                                                        ref.hashCode),
                                                    postID.hashCode),
                                                postCategory.hashCode),
                                            createTime.hashCode),
                                        view.hashCode),
                                    image.hashCode),
                                whoansnormal.hashCode),
                            whoanspro.hashCode),
                        whoansstudent.hashCode),
                    whoanswer.hashCode),
                goodnumperson.hashCode),
            answernum.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Post1Record')
          ..add('title', title)
          ..add('answerR', answerR)
          ..add('text', text)
          ..add('goodNum', goodNum)
          ..add('postHead', postHead)
          ..add('url', url)
          ..add('ref', ref)
          ..add('postID', postID)
          ..add('postCategory', postCategory)
          ..add('createTime', createTime)
          ..add('view', view)
          ..add('image', image)
          ..add('whoansnormal', whoansnormal)
          ..add('whoanspro', whoanspro)
          ..add('whoansstudent', whoansstudent)
          ..add('whoanswer', whoanswer)
          ..add('goodnumperson', goodnumperson)
          ..add('answernum', answernum)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class Post1RecordBuilder implements Builder<Post1Record, Post1RecordBuilder> {
  _$Post1Record? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  bool? _answerR;
  bool? get answerR => _$this._answerR;
  set answerR(bool? answerR) => _$this._answerR = answerR;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  int? _goodNum;
  int? get goodNum => _$this._goodNum;
  set goodNum(int? goodNum) => _$this._goodNum = goodNum;

  String? _postHead;
  String? get postHead => _$this._postHead;
  set postHead(String? postHead) => _$this._postHead = postHead;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DocumentReference<Object?>? _ref;
  DocumentReference<Object?>? get ref => _$this._ref;
  set ref(DocumentReference<Object?>? ref) => _$this._ref = ref;

  String? _postID;
  String? get postID => _$this._postID;
  set postID(String? postID) => _$this._postID = postID;

  ListBuilder<String>? _postCategory;
  ListBuilder<String> get postCategory =>
      _$this._postCategory ??= new ListBuilder<String>();
  set postCategory(ListBuilder<String>? postCategory) =>
      _$this._postCategory = postCategory;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  int? _view;
  int? get view => _$this._view;
  set view(int? view) => _$this._view = view;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  bool? _whoansnormal;
  bool? get whoansnormal => _$this._whoansnormal;
  set whoansnormal(bool? whoansnormal) => _$this._whoansnormal = whoansnormal;

  bool? _whoanspro;
  bool? get whoanspro => _$this._whoanspro;
  set whoanspro(bool? whoanspro) => _$this._whoanspro = whoanspro;

  bool? _whoansstudent;
  bool? get whoansstudent => _$this._whoansstudent;
  set whoansstudent(bool? whoansstudent) =>
      _$this._whoansstudent = whoansstudent;

  String? _whoanswer;
  String? get whoanswer => _$this._whoanswer;
  set whoanswer(String? whoanswer) => _$this._whoanswer = whoanswer;

  ListBuilder<DocumentReference<Object?>>? _goodnumperson;
  ListBuilder<DocumentReference<Object?>> get goodnumperson =>
      _$this._goodnumperson ??= new ListBuilder<DocumentReference<Object?>>();
  set goodnumperson(ListBuilder<DocumentReference<Object?>>? goodnumperson) =>
      _$this._goodnumperson = goodnumperson;

  int? _answernum;
  int? get answernum => _$this._answernum;
  set answernum(int? answernum) => _$this._answernum = answernum;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  Post1RecordBuilder() {
    Post1Record._initializeBuilder(this);
  }

  Post1RecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _answerR = $v.answerR;
      _text = $v.text;
      _goodNum = $v.goodNum;
      _postHead = $v.postHead;
      _url = $v.url;
      _ref = $v.ref;
      _postID = $v.postID;
      _postCategory = $v.postCategory?.toBuilder();
      _createTime = $v.createTime;
      _view = $v.view;
      _image = $v.image;
      _whoansnormal = $v.whoansnormal;
      _whoanspro = $v.whoanspro;
      _whoansstudent = $v.whoansstudent;
      _whoanswer = $v.whoanswer;
      _goodnumperson = $v.goodnumperson?.toBuilder();
      _answernum = $v.answernum;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Post1Record other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Post1Record;
  }

  @override
  void update(void Function(Post1RecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Post1Record build() => _build();

  _$Post1Record _build() {
    _$Post1Record _$result;
    try {
      _$result = _$v ??
          new _$Post1Record._(
              title: title,
              answerR: answerR,
              text: text,
              goodNum: goodNum,
              postHead: postHead,
              url: url,
              ref: ref,
              postID: postID,
              postCategory: _postCategory?.build(),
              createTime: createTime,
              view: view,
              image: image,
              whoansnormal: whoansnormal,
              whoanspro: whoanspro,
              whoansstudent: whoansstudent,
              whoanswer: whoanswer,
              goodnumperson: _goodnumperson?.build(),
              answernum: answernum,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'postCategory';
        _postCategory?.build();

        _$failedField = 'goodnumperson';
        _goodnumperson?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Post1Record', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
