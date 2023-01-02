import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _postref = (await secureStorage.getString('ff_postref'))?.ref ?? _postref;
    _imageref = await secureStorage.getString('ff_imageref') ?? _imageref;
    _priceref =
        (await secureStorage.getString('ff_priceref'))?.ref ?? _priceref;
    _personref =
        (await secureStorage.getString('ff_personref'))?.ref ?? _personref;
    _mypersonref =
        (await secureStorage.getString('ff_mypersonref'))?.ref ?? _mypersonref;
    _yourpersonref = (await secureStorage.getString('ff_yourpersonref'))?.ref ??
        _yourpersonref;
    _feeldaycate =
        await secureStorage.getString('ff_feeldaycate') ?? _feeldaycate;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _postref;
  DocumentReference? get postref => _postref;
  set postref(DocumentReference? _value) {
    _postref = _value;
    _value != null
        ? secureStorage.setString('ff_postref', _value.path)
        : secureStorage.remove('ff_postref');
  }

  void deletePostref() {
    secureStorage.delete(key: 'ff_postref');
  }

  String _imageref = '';
  String get imageref => _imageref;
  set imageref(String _value) {
    _imageref = _value;
    secureStorage.setString('ff_imageref', _value);
  }

  void deleteImageref() {
    secureStorage.delete(key: 'ff_imageref');
  }

  DocumentReference? _priceref;
  DocumentReference? get priceref => _priceref;
  set priceref(DocumentReference? _value) {
    _priceref = _value;
    _value != null
        ? secureStorage.setString('ff_priceref', _value.path)
        : secureStorage.remove('ff_priceref');
  }

  void deletePriceref() {
    secureStorage.delete(key: 'ff_priceref');
  }

  DocumentReference? _personref;
  DocumentReference? get personref => _personref;
  set personref(DocumentReference? _value) {
    _personref = _value;
    _value != null
        ? secureStorage.setString('ff_personref', _value.path)
        : secureStorage.remove('ff_personref');
  }

  void deletePersonref() {
    secureStorage.delete(key: 'ff_personref');
  }

  DocumentReference? _mypersonref;
  DocumentReference? get mypersonref => _mypersonref;
  set mypersonref(DocumentReference? _value) {
    _mypersonref = _value;
    _value != null
        ? secureStorage.setString('ff_mypersonref', _value.path)
        : secureStorage.remove('ff_mypersonref');
  }

  void deleteMypersonref() {
    secureStorage.delete(key: 'ff_mypersonref');
  }

  DocumentReference? _yourpersonref;
  DocumentReference? get yourpersonref => _yourpersonref;
  set yourpersonref(DocumentReference? _value) {
    _yourpersonref = _value;
    _value != null
        ? secureStorage.setString('ff_yourpersonref', _value.path)
        : secureStorage.remove('ff_yourpersonref');
  }

  void deleteYourpersonref() {
    secureStorage.delete(key: 'ff_yourpersonref');
  }

  bool _searchdone = false;
  bool get searchdone => _searchdone;
  set searchdone(bool _value) {
    _searchdone = _value;
  }

  bool _selectedfeel = false;
  bool get selectedfeel => _selectedfeel;
  set selectedfeel(bool _value) {
    _selectedfeel = _value;
  }

  String _feeldaycate = '일별';
  String get feeldaycate => _feeldaycate;
  set feeldaycate(String _value) {
    _feeldaycate = _value;
    secureStorage.setString('ff_feeldaycate', _value);
  }

  void deleteFeeldaycate() {
    secureStorage.delete(key: 'ff_feeldaycate');
  }

  String _reservemonthday = '11/12';
  String get reservemonthday => _reservemonthday;
  set reservemonthday(String _value) {
    _reservemonthday = _value;
  }

  String _reservehour = '1';
  String get reservehour => _reservehour;
  set reservehour(String _value) {
    _reservehour = _value;
  }

  int _price = 30000;
  int get price => _price;
  set price(int _value) {
    _price = _value;
  }

  String _feelmonthdaynumber = '11/12';
  String get feelmonthdaynumber => _feelmonthdaynumber;
  set feelmonthdaynumber(String _value) {
    _feelmonthdaynumber = _value;
  }

  int _selectednum = 5;
  int get selectednum => _selectednum;
  set selectednum(int _value) {
    _selectednum = _value;
  }

  bool _piechart = false;
  bool get piechart => _piechart;
  set piechart(bool _value) {
    _piechart = _value;
  }

  DateTime? _reserveCalendar =
      DateTime.fromMillisecondsSinceEpoch(1669770120000);
  DateTime? get reserveCalendar => _reserveCalendar;
  set reserveCalendar(DateTime? _value) {
    _reserveCalendar = _value;
  }

  DocumentReference? _reserveProref;
  DocumentReference? get reserveProref => _reserveProref;
  set reserveProref(DocumentReference? _value) {
    _reserveProref = _value;
  }

  DocumentReference? _reservePersonref;
  DocumentReference? get reservePersonref => _reservePersonref;
  set reservePersonref(DocumentReference? _value) {
    _reservePersonref = _value;
  }

  DateTime? _feelSelectcalendar =
      DateTime.fromMillisecondsSinceEpoch(1669772100000);
  DateTime? get feelSelectcalendar => _feelSelectcalendar;
  set feelSelectcalendar(DateTime? _value) {
    _feelSelectcalendar = _value;
  }

  String _calendarSelectDayString = '11/12';
  String get calendarSelectDayString => _calendarSelectDayString;
  set calendarSelectDayString(String _value) {
    _calendarSelectDayString = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
