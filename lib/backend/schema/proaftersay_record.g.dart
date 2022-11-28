// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proaftersay_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProaftersayRecord> _$proaftersayRecordSerializer =
    new _$ProaftersayRecordSerializer();

class _$ProaftersayRecordSerializer
    implements StructuredSerializer<ProaftersayRecord> {
  @override
  final Iterable<Type> types = const [ProaftersayRecord, _$ProaftersayRecord];
  @override
  final String wireName = 'ProaftersayRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProaftersayRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.postPhoto;
    if (value != null) {
      result
        ..add('post_photo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postTitle;
    if (value != null) {
      result
        ..add('post_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postDescription;
    if (value != null) {
      result
        ..add('post_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postUser;
    if (value != null) {
      result
        ..add('post_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.timePosted;
    if (value != null) {
      result
        ..add('time_posted')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.numComments;
    if (value != null) {
      result
        ..add('num_comments')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.numVotes;
    if (value != null) {
      result
        ..add('num_votes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.goodnum;
    if (value != null) {
      result
        ..add('goodnum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  ProaftersayRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProaftersayRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'post_photo':
          result.postPhoto = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_title':
          result.postTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_description':
          result.postDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'post_user':
          result.postUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'time_posted':
          result.timePosted = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'num_comments':
          result.numComments = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'num_votes':
          result.numVotes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'goodnum':
          result.goodnum = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$ProaftersayRecord extends ProaftersayRecord {
  @override
  final String? postPhoto;
  @override
  final String? postTitle;
  @override
  final String? postDescription;
  @override
  final DocumentReference<Object?>? postUser;
  @override
  final DateTime? timePosted;
  @override
  final int? numComments;
  @override
  final int? numVotes;
  @override
  final double? goodnum;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProaftersayRecord(
          [void Function(ProaftersayRecordBuilder)? updates]) =>
      (new ProaftersayRecordBuilder()..update(updates))._build();

  _$ProaftersayRecord._(
      {this.postPhoto,
      this.postTitle,
      this.postDescription,
      this.postUser,
      this.timePosted,
      this.numComments,
      this.numVotes,
      this.goodnum,
      this.ffRef})
      : super._();

  @override
  ProaftersayRecord rebuild(void Function(ProaftersayRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProaftersayRecordBuilder toBuilder() =>
      new ProaftersayRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProaftersayRecord &&
        postPhoto == other.postPhoto &&
        postTitle == other.postTitle &&
        postDescription == other.postDescription &&
        postUser == other.postUser &&
        timePosted == other.timePosted &&
        numComments == other.numComments &&
        numVotes == other.numVotes &&
        goodnum == other.goodnum &&
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
                                $jc($jc(0, postPhoto.hashCode),
                                    postTitle.hashCode),
                                postDescription.hashCode),
                            postUser.hashCode),
                        timePosted.hashCode),
                    numComments.hashCode),
                numVotes.hashCode),
            goodnum.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProaftersayRecord')
          ..add('postPhoto', postPhoto)
          ..add('postTitle', postTitle)
          ..add('postDescription', postDescription)
          ..add('postUser', postUser)
          ..add('timePosted', timePosted)
          ..add('numComments', numComments)
          ..add('numVotes', numVotes)
          ..add('goodnum', goodnum)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProaftersayRecordBuilder
    implements Builder<ProaftersayRecord, ProaftersayRecordBuilder> {
  _$ProaftersayRecord? _$v;

  String? _postPhoto;
  String? get postPhoto => _$this._postPhoto;
  set postPhoto(String? postPhoto) => _$this._postPhoto = postPhoto;

  String? _postTitle;
  String? get postTitle => _$this._postTitle;
  set postTitle(String? postTitle) => _$this._postTitle = postTitle;

  String? _postDescription;
  String? get postDescription => _$this._postDescription;
  set postDescription(String? postDescription) =>
      _$this._postDescription = postDescription;

  DocumentReference<Object?>? _postUser;
  DocumentReference<Object?>? get postUser => _$this._postUser;
  set postUser(DocumentReference<Object?>? postUser) =>
      _$this._postUser = postUser;

  DateTime? _timePosted;
  DateTime? get timePosted => _$this._timePosted;
  set timePosted(DateTime? timePosted) => _$this._timePosted = timePosted;

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  int? _numVotes;
  int? get numVotes => _$this._numVotes;
  set numVotes(int? numVotes) => _$this._numVotes = numVotes;

  double? _goodnum;
  double? get goodnum => _$this._goodnum;
  set goodnum(double? goodnum) => _$this._goodnum = goodnum;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProaftersayRecordBuilder() {
    ProaftersayRecord._initializeBuilder(this);
  }

  ProaftersayRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postPhoto = $v.postPhoto;
      _postTitle = $v.postTitle;
      _postDescription = $v.postDescription;
      _postUser = $v.postUser;
      _timePosted = $v.timePosted;
      _numComments = $v.numComments;
      _numVotes = $v.numVotes;
      _goodnum = $v.goodnum;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProaftersayRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProaftersayRecord;
  }

  @override
  void update(void Function(ProaftersayRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProaftersayRecord build() => _build();

  _$ProaftersayRecord _build() {
    final _$result = _$v ??
        new _$ProaftersayRecord._(
            postPhoto: postPhoto,
            postTitle: postTitle,
            postDescription: postDescription,
            postUser: postUser,
            timePosted: timePosted,
            numComments: numComments,
            numVotes: numVotes,
            goodnum: goodnum,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
