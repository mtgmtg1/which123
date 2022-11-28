import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'post_struct.g.dart';

abstract class PostStruct implements Built<PostStruct, PostStructBuilder> {
  static Serializer<PostStruct> get serializer => _$postStructSerializer;

  String? get title;

  BuiltList<String>? get postcategory;

  bool? get answerR;

  String? get text;

  int? get goodNum;

  BuiltList<ReplySetsStruct> get reply;

  String? get postHead;

  String? get url;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PostStructBuilder builder) => builder
    ..title = ''
    ..postcategory = ListBuilder()
    ..answerR = false
    ..text = ''
    ..goodNum = 0
    ..reply = ListBuilder()
    ..postHead = ''
    ..url = ''
    ..firestoreUtilData = FirestoreUtilData();

  PostStruct._();
  factory PostStruct([void Function(PostStructBuilder) updates]) = _$PostStruct;
}

PostStruct createPostStruct({
  String? title,
  bool? answerR,
  String? text,
  int? goodNum,
  String? postHead,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostStruct(
      (p) => p
        ..title = title
        ..postcategory = null
        ..answerR = answerR
        ..text = text
        ..goodNum = goodNum
        ..reply = null
        ..postHead = postHead
        ..url = url
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PostStruct? updatePostStruct(
  PostStruct? post, {
  bool clearUnsetFields = true,
}) =>
    post != null
        ? (post.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPostStructData(
  Map<String, dynamic> firestoreData,
  PostStruct? post,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (post == null) {
    return;
  }
  if (post.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && post.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postData = getPostFirestoreData(post, forFieldValue);
  final nestedData = postData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = post.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPostFirestoreData(
  PostStruct? post, [
  bool forFieldValue = false,
]) {
  if (post == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(PostStruct.serializer, post);

  // Add any Firestore field values
  post.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostListFirestoreData(
  List<PostStruct>? posts,
) =>
    posts?.map((p) => getPostFirestoreData(p, true)).toList() ?? [];
