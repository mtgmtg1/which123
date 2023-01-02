import '../backend/backend.dart';
import '../components/drawer_widget.dart';
import '../components/footer_widget.dart';
import '../components/menu_widget.dart';
import '../components/navbar_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class Company4NoticeWidget extends StatefulWidget {
  const Company4NoticeWidget({Key? key}) : super(key: key);

  @override
  _Company4NoticeWidgetState createState() => _Company4NoticeWidgetState();
}

class _Company4NoticeWidgetState extends State<Company4NoticeWidget> {
  List<Post1Record> simpleSearchResults = [];
  TextEditingController? textController;
  String? dropDownValue;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
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
    _unfocusNode.dispose();
    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        elevation: 16,
        child: DrawerWidget(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        '회사소식',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).title3Family,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).title3Family),
                            ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          constraints: BoxConstraints(
                            maxWidth: 999,
                          ),
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 11, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.33,
                                    height: 50,
                                    constraints: BoxConstraints(
                                      maxWidth: 333,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: FlutterFlowDropDown<String>(
                                      options: [
                                        '전체 글',
                                        '제목',
                                        '작성자',
                                        '공지',
                                        '뉴스',
                                        '채용 공고'
                                      ],
                                      onChanged: (val) =>
                                          setState(() => dropDownValue = val),
                                      width: MediaQuery.of(context).size.width *
                                          0.33,
                                      height: 44,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2,
                                      hintText: '전체 글',
                                      fillColor: Colors.white,
                                      elevation: 2,
                                      borderColor: Color(0xFF8DDDFF),
                                      borderWidth: 2,
                                      borderRadius: 10,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12, 4, 12, 4),
                                      hidesUnderline: true,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(11),
                                  child: Container(
                                    width: 222,
                                    height: 50,
                                    constraints: BoxConstraints(
                                      maxWidth: 444,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor3,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3, 3, 3, 3),
                                        child: TextFormField(
                                          controller: textController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'textController',
                                            Duration(milliseconds: 500),
                                            () async {
                                              await queryPost1RecordOnce()
                                                  .then(
                                                    (records) =>
                                                        simpleSearchResults =
                                                            TextSearch(
                                                      records
                                                          .map(
                                                            (record) =>
                                                                TextSearchItem(
                                                                    record, [
                                                              record.title!,
                                                              record.whoanswer!,
                                                              record.text!
                                                            ]),
                                                          )
                                                          .toList(),
                                                    )
                                                                .search(
                                                                    textController!
                                                                        .text)
                                                                .map((r) =>
                                                                    r.object)
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
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                            suffixIcon: textController!
                                                    .text.isNotEmpty
                                                ? InkWell(
                                                    onTap: () async {
                                                      textController?.clear();
                                                      await queryPost1RecordOnce()
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
                                                                              .title!,
                                                                          record
                                                                              .whoanswer!,
                                                                          record
                                                                              .text!
                                                                        ]),
                                                                  )
                                                                  .toList(),
                                                            )
                                                                    .search(
                                                                        textController!
                                                                            .text)
                                                                    .map((r) =>
                                                                        r.object)
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
                                              .bodyText1,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: FutureBuilder<List<NoticeRecord>>(
                            future: queryNoticeRecordOnce(
                              queryBuilder: (noticeRecord) => noticeRecord
                                  .orderBy('Time', descending: true),
                            ),
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
                              List<NoticeRecord> containerNoticeRecordList =
                                  snapshot.data!;
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                constraints: BoxConstraints(
                                  maxWidth: 999,
                                ),
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 11, 0, 11),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          maxWidth: 999,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(3, 3, 3, 3),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 4,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 70,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 1222,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEAF5FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 5, 0),
                                                          child: Container(
                                                            width: 60,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 111,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0, 0),
                                                              child: Text(
                                                                '글번호',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 2,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFBBBBBB),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.67,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 777,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: Text(
                                                              '제목',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle2,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFBBBBBB),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 60,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 111,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
                                                                phone: false,
                                                                tablet: false,
                                                                tabletLandscape:
                                                                    false,
                                                              ))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1,
                                                                            0,
                                                                            1,
                                                                            0),
                                                                    child: Text(
                                                                      '작성일',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              Expanded(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Text(
                                                                    '조회수',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyText1Family,
                                                                          fontSize:
                                                                              10,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(3, 3, 3, 3),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  constraints: BoxConstraints(
                                                    maxWidth: 1222,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (simpleSearchResults
                                                              .length ==
                                                          null)
                                                        StreamBuilder<
                                                            List<NoticeRecord>>(
                                                          stream:
                                                              queryNoticeRecord(),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50,
                                                                  height: 50,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<NoticeRecord>
                                                                columnNoticeRecordList =
                                                                snapshot.data!;
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                  columnNoticeRecordList
                                                                      .length,
                                                                  (columnIndex) {
                                                                final columnNoticeRecord =
                                                                    columnNoticeRecordList[
                                                                        columnIndex];
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation: 4,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    height: 70,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          999,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEAF5FF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              1,
                                                                              1,
                                                                              1,
                                                                              1),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                0,
                                                                                5,
                                                                                0),
                                                                            child:
                                                                                Container(
                                                                              width: 60,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: 111,
                                                                              ),
                                                                              decoration: BoxDecoration(),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: Text(
                                                                                  columnIndex.toString(),
                                                                                  style: FlutterFlowTheme.of(context).subtitle2,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                2,
                                                                            height:
                                                                                30,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFBBBBBB),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.67,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 777,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Text(
                                                                                columnNoticeRecord.title!,
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).subtitle2,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            height:
                                                                                30,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0xFFBBBBBB),
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                60,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 111,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (responsiveVisibility(
                                                                                  context: context,
                                                                                  phone: false,
                                                                                  tablet: false,
                                                                                  tabletLandscape: false,
                                                                                ))
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0, 0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                      child: Text(
                                                                                        dateTimeFormat(
                                                                                          'Md',
                                                                                          columnNoticeRecord.time!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0, 0),
                                                                                    child: Text(
                                                                                      '조회수${columnNoticeRecord.view?.toString()}',
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                            fontSize: 10,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
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
                                                          final searchlist =
                                                              simpleSearchResults
                                                                  .toList();
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                searchlist
                                                                    .length,
                                                                (searchlistIndex) {
                                                              final searchlistItem =
                                                                  searchlist[
                                                                      searchlistIndex];
                                                              return Material(
                                                                color: Colors
                                                                    .transparent,
                                                                elevation: 4,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  height: 70,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        1222,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFFEAF5FF),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1,
                                                                            1,
                                                                            1,
                                                                            1),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.11,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 80,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0, 0),
                                                                              child: Text(
                                                                                searchlistIndex.toString(),
                                                                                style: FlutterFlowTheme.of(context).subtitle2,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              2,
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFBBBBBB),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.67,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                777,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0, 0),
                                                                            child:
                                                                                Text(
                                                                              searchlistItem.title!,
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).subtitle2,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          height:
                                                                              30,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xFFBBBBBB),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.11,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                80,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                                tablet: false,
                                                                                tabletLandscape: false,
                                                                              ))
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0, 0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                                                                                    child: Text(
                                                                                      dateTimeFormat(
                                                                                        'yMd',
                                                                                        searchlistItem.createTime!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0, 0),
                                                                                child: Text(
                                                                                  '조회수${searchlistItem.view?.toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
                                                                                        fontSize: 10,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyText1Family),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 22, 0, 111),
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
                      c45: FlutterFlowTheme.of(context).secondaryText,
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
