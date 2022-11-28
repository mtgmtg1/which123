// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationRecord> _$notificationRecordSerializer =
    new _$NotificationRecordSerializer();

class _$NotificationRecordSerializer
    implements StructuredSerializer<NotificationRecord> {
  @override
  final Iterable<Type> types = const [NotificationRecord, _$NotificationRecord];
  @override
  final String wireName = 'NotificationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, NotificationRecord object,
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
    value = object.frompersonref;
    if (value != null) {
      result
        ..add('frompersonref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.frompostref;
    if (value != null) {
      result
        ..add('frompostref')
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
  NotificationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationRecordBuilder();

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
        case 'frompersonref':
          result.frompersonref = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'frompostref':
          result.frompostref = serializers.deserialize(value,
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

class _$NotificationRecord extends NotificationRecord {
  @override
  final String? postPhoto;
  @override
  final String? postTitle;
  @override
  final String? postDescription;
  @override
  final DateTime? timePosted;
  @override
  final int? numComments;
  @override
  final int? numVotes;
  @override
  final DocumentReference<Object?>? frompersonref;
  @override
  final DocumentReference<Object?>? frompostref;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotificationRecord(
          [void Function(NotificationRecordBuilder)? updates]) =>
      (new NotificationRecordBuilder()..update(updates))._build();

  _$NotificationRecord._(
      {this.postPhoto,
      this.postTitle,
      this.postDescription,
      this.timePosted,
      this.numComments,
      this.numVotes,
      this.frompersonref,
      this.frompostref,
      this.ffRef})
      : super._();

  @override
  NotificationRecord rebuild(
          void Function(NotificationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationRecordBuilder toBuilder() =>
      new NotificationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationRecord &&
        postPhoto == other.postPhoto &&
        postTitle == other.postTitle &&
        postDescription == other.postDescription &&
        timePosted == other.timePosted &&
        numComments == other.numComments &&
        numVotes == other.numVotes &&
        frompersonref == other.frompersonref &&
        frompostref == other.frompostref &&
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
                            timePosted.hashCode),
                        numComments.hashCode),
                    numVotes.hashCode),
                frompersonref.hashCode),
            frompostref.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationRecord')
          ..add('postPhoto', postPhoto)
          ..add('postTitle', postTitle)
          ..add('postDescription', postDescription)
          ..add('timePosted', timePosted)
          ..add('numComments', numComments)
          ..add('numVotes', numVotes)
          ..add('frompersonref', frompersonref)
          ..add('frompostref', frompostref)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotificationRecordBuilder
    implements Builder<NotificationRecord, NotificationRecordBuilder> {
  _$NotificationRecord? _$v;

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

  DateTime? _timePosted;
  DateTime? get timePosted => _$this._timePosted;
  set timePosted(DateTime? timePosted) => _$this._timePosted = timePosted;

  int? _numComments;
  int? get numComments => _$this._numComments;
  set numComments(int? numComments) => _$this._numComments = numComments;

  int? _numVotes;
  int? get numVotes => _$this._numVotes;
  set numVotes(int? numVotes) => _$this._numVotes = numVotes;

  DocumentReference<Object?>? _frompersonref;
  DocumentReference<Object?>? get frompersonref => _$this._frompersonref;
  set frompersonref(DocumentReference<Object?>? frompersonref) =>
      _$this._frompersonref = frompersonref;

  DocumentReference<Object?>? _frompostref;
  DocumentReference<Object?>? get frompostref => _$this._frompostref;
  set frompostref(DocumentReference<Object?>? frompostref) =>
      _$this._frompostref = frompostref;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotificationRecordBuilder() {
    NotificationRecord._initializeBuilder(this);
  }

  NotificationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _postPhoto = $v.postPhoto;
      _postTitle = $v.postTitle;
      _postDescription = $v.postDescription;
      _timePosted = $v.timePosted;
      _numComments = $v.numComments;
      _numVotes = $v.numVotes;
      _frompersonref = $v.frompersonref;
      _frompostref = $v.frompostref;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationRecord;
  }

  @override
  void update(void Function(NotificationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationRecord build() => _build();

  _$NotificationRecord _build() {
    final _$result = _$v ??
        new _$NotificationRecord._(
            postPhoto: postPhoto,
            postTitle: postTitle,
            postDescription: postDescription,
            timePosted: timePosted,
            numComments: numComments,
            numVotes: numVotes,
            frompersonref: frompersonref,
            frompostref: frompostref,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
