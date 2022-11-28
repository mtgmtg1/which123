import '../backend/backend.dart';
import '../components/drawer_widget.dart';
import '../components/footer_widget.dart';
import '../components/menu_widget.dart';
import '../components/navbar_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class ContentsWidget extends StatefulWidget {
  const ContentsWidget({Key? key}) : super(key: key);

  @override
  _ContentsWidgetState createState() => _ContentsWidgetState();
}

class _ContentsWidgetState extends State<ContentsWidget> {
  List<ContentsRecord> simpleSearchResults = [];
  TextEditingController? textController;
  String? dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().searchdone = false);
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        elevation: 16,
        child: DrawerWidget(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.18,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryColor,
                          FlutterFlowTheme.of(context).secondaryColor
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                '컨텐츠',
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .title3Family,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .title3Family),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      constraints: BoxConstraints(
                        maxWidth: 999,
                      ),
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: 666,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 10, 15, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FlutterFlowDropDown<String>(
                                        options: ['전체', '글', '영상'],
                                        onChanged: (val) =>
                                            setState(() => dropDownValue = val),
                                        width: 100,
                                        height: 40,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2,
                                        hintText: '전체',
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Color(0xFF8DDDFF),
                                        borderWidth: 2,
                                        borderRadius: 10,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: textController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'textController',
                                            Duration(milliseconds: 500),
                                            () async {
                                              await queryContentsRecordOnce()
                                                  .then(
                                                    (records) =>
                                                        simpleSearchResults =
                                                            TextSearch(
                                                      records
                                                          .map(
                                                            (record) =>
                                                                TextSearchItem(
                                                                    record, [
                                                              record.text!,
                                                              record.title!,
                                                              record.catergory!
                                                            ]),
                                                          )
                                                          .toList(),
                                                    )
                                                                .search(
                                                                    textController!
                                                                        .text)
                                                                .map((r) =>
                                                                    r.object)
                                                                .take(33)
                                                                .toList(),
                                                  )
                                                  .onError((_, __) =>
                                                      simpleSearchResults = [])
                                                  .whenComplete(
                                                      () => setState(() {}));
                                            },
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '검색어를 입력해 주세요',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF707070),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0xFF707070),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 16, 0, 0),
                                            suffixIcon: textController!
                                                    .text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      textController?.clear();
                                                      await queryContentsRecordOnce()
                                                          .then(
                                                            (records) => simpleSearchResults =
                                                                TextSearch(
                                                              records
                                                                  .map(
                                                                    (record) =>
                                                                        TextSearchItem(
                                                                            record,
                                                                            [
                                                                          record
                                                                              .text!,
                                                                          record
                                                                              .title!,
                                                                          record
                                                                              .catergory!
                                                                        ]),
                                                                  )
                                                                  .toList(),
                                                            )
                                                                    .search(
                                                                        textController!
                                                                            .text)
                                                                    .map((r) =>
                                                                        r.object)
                                                                    .take(33)
                                                                    .toList(),
                                                          )
                                                          .onError((_, __) =>
                                                              simpleSearchResults =
                                                                  [])
                                                          .whenComplete(() =>
                                                              setState(() {}));

                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.clear,
                                                      color: Color(0xFF757575),
                                                      size: 22,
                                                    ),
                                                  )
                                                : null,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (simpleSearchResults.length >= 1)
                                StreamBuilder<List<ContentsRecord>>(
                                  stream: queryContentsRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ContentsRecord>
                                        columnContentsRecordList =
                                        snapshot.data!;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnContentsRecordList.length,
                                          (columnIndex) {
                                        final columnContentsRecord =
                                            columnContentsRecordList[
                                                columnIndex];
                                        return Visibility(
                                          visible: () {
                                            if (columnContentsRecord
                                                    .catergory ==
                                                dropDownValue) {
                                              return true;
                                            } else if (dropDownValue == '전체') {
                                              return true;
                                            } else {
                                              return true;
                                            }
                                          }(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 5, 5, 5),
                                            child: InkWell(
                                              onTap: () async {
                                                context.pushNamed('Contents');
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 4,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1222,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        columnContentsRecord
                                                            .image!,
                                                      ).image,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 5,
                                                        color:
                                                            Color(0x230E151B),
                                                        offset: Offset(2, 2),
                                                        spreadRadius: 2,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            if (dateTimeFormat(
                                                                  'Md',
                                                                  columnContentsRecord
                                                                      .postTime,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ) ==
                                                                dateTimeFormat(
                                                                  'Md',
                                                                  getCurrentTimestamp,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ))
                                                              Container(
                                                                width: 144,
                                                                height: 32,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0x9961DEFF),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            16),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            16),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child: Text(
                                                                  'NEW Contents',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                      ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                        ClipRRect(
                                                          child: BackdropFilter(
                                                            filter: ImageFilter
                                                                .blur(
                                                              sigmaX: 4,
                                                              sigmaY: 5,
                                                            ),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x988DC4FF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          16),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          16),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0),
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            11,
                                                                            5,
                                                                            5,
                                                                            5),
                                                                child:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        columnContentsRecord
                                                                            .title!,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title2
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Colors.white,
                                                                              fontSize: 28,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title2Family),
                                                                            ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                8,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              columnContentsRecord.text!,
                                                                              style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xCBFFFFFF),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5,
                                                                                12,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat(
                                                                                'yMd',
                                                                                columnContentsRecord.postTime!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: Color(0xFF39D2C0),
                                                                                    fontSize: 14,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            5),
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'postview',
                                                                              queryParams: {
                                                                                'contentsref': serializeParam(
                                                                                  columnContentsRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            '참여방법 자세히 보기  >',
                                                                            style: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: Color(0xCBFFFFFF),
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FontStyle.italic,
                                                                                  decoration: TextDecoration.underline,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              Builder(
                                builder: (context) {
                                  final searchdone =
                                      simpleSearchResults.toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(searchdone.length,
                                        (searchdoneIndex) {
                                      final searchdoneItem =
                                          searchdone[searchdoneIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3, 3, 3, 3),
                                        child: InkWell(
                                          onTap: () async {
                                            context.pushNamed('Contents');
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 4,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    searchdoneItem.image!,
                                                  ).image,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5,
                                                    color: Color(0x230E151B),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (dateTimeFormat(
                                                              'Md',
                                                              searchdoneItem
                                                                  .postTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ) ==
                                                            dateTimeFormat(
                                                              'Md',
                                                              getCurrentTimestamp,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ))
                                                          Container(
                                                            width: 144,
                                                            height: 32,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x9961DEFF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            16),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        16),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Text(
                                                              'NEW Contents',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyText1Family),
                                                                  ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    ClipRRect(
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                          sigmaX: 4,
                                                          sigmaY: 5,
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x988DC4FF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(16),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          16),
                                                              topLeft: Radius
                                                                  .circular(0),
                                                              topRight: Radius
                                                                  .circular(0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        11,
                                                                        5,
                                                                        5,
                                                                        5),
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    searchdoneItem
                                                                        .title!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              28,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).title2Family),
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          searchdoneItem
                                                                              .text!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xCBFFFFFF),
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FontStyle.italic,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            12,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                            'yMd',
                                                                            searchdoneItem.postTime!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText2
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF39D2C0),
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText2Family),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            5),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'postview',
                                                                          queryParams:
                                                                              {
                                                                            'contentsref':
                                                                                serializeParam(
                                                                              searchdoneItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        '참여방법 자세히 보기  >',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xCBFFFFFF),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FontStyle.italic,
                                                                              decoration: TextDecoration.underline,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 111),
                    child: FooterWidget(),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: MenuWidget(
                drawer: () async {},
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Container(
                  height: 75,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: !(isWeb
                            ? MediaQuery.of(context).viewInsets.bottom > 0
                            : _isKeyboardVisible) &&
                        responsiveVisibility(
                          context: context,
                          desktop: false,
                        ),
                    child: NavbarWidget(
                      c1: FlutterFlowTheme.of(context).secondaryText,
                      c2: FlutterFlowTheme.of(context).secondaryText,
                      c3: FlutterFlowTheme.of(context).primaryBackground,
                      c4: FlutterFlowTheme.of(context).secondaryText,
                      c5: FlutterFlowTheme.of(context).secondaryText,
                      c12: FlutterFlowTheme.of(context).secondaryText,
                      c45: FlutterFlowTheme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
