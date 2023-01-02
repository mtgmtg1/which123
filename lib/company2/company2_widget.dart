import '../backend/backend.dart';
import '../components/drawer_widget.dart';
import '../components/footer_widget.dart';
import '../components/menu_widget.dart';
import '../components/navbar_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Company2Widget extends StatefulWidget {
  const Company2Widget({Key? key}) : super(key: key);

  @override
  _Company2WidgetState createState() => _Company2WidgetState();
}

class _Company2WidgetState extends State<Company2Widget> {
  Completer<List<CompanyRecord>>? _firestoreRequestCompleter;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      drawer: Drawer(
        elevation: 16,
        child: DrawerWidget(),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
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
                      '협력기관 안내',
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).title3Family,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).title3Family),
                          ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  desktop: false,
                ))
                  StreamBuilder<List<CompanyRecord>>(
                    stream: queryCompanyRecord(
                      queryBuilder: (companyRecord) => companyRecord
                          .where('officecatergory', isEqualTo: '협력기관'),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      List<CompanyRecord> columnCompanyRecordList =
                          snapshot.data!;
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(
                              columnCompanyRecordList.length, (columnIndex) {
                            final columnCompanyRecord =
                                columnCompanyRecordList[columnIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 2,
                                      color: Color(0x59000000),
                                      offset: Offset(2, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 5, 15, 0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 330,
                                            decoration: BoxDecoration(),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      height: 260,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            columnCompanyRecord
                                                                .logo,
                                                            'https://biz.chosun.com/resizer/kgNnmBEDMa66hWqC9gouyVDkcdo=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/BVYQ6E247BFJJJBLY7UM6ZAO7I.jpg',
                                                          ),
                                                          width: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 20, 0, 0),
                                                    child: Text(
                                                      columnCompanyRecord
                                                          .officename!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .subtitle1,
                                                    ),
                                                  ),
                                                  Text(
                                                    columnCompanyRecord
                                                        .introduce!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .subtitle2,
                                                  ),
                                                  Divider(
                                                    height: 24,
                                                    thickness: 1,
                                                    color: Color(0xFFDBE2E7),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 20, 20, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await launchURL(
                                                  columnCompanyRecord
                                                      .homepage!);
                                            },
                                            text: '홈페이지',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40,
                                              color: Color(0xFF8DDDFF),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 20, 20, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'companyview',
                                                queryParams: {
                                                  'companyref': serializeParam(
                                                    columnCompanyRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'companyref':
                                                      columnCompanyRecord,
                                                },
                                              );
                                            },
                                            text: '정보 더보기',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 40,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2Family,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2Family),
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      );
                    },
                  ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: Visibility(
                    visible: responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 15),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed('Company1');
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.14,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: Color(0xFFD5F6FF),
                                              width: 3,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              '회사안내',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 18,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 15),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed('Company2');
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.14,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8DDDFF),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              '협력기관',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 15),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed('Company3');
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.14,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                              color: Color(0xFFD5F6FF),
                                              width: 3,
                                            ),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              '비전',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        fontSize: 18,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      context.pushNamed('Company4_Notice');
                                    },
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.14,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                            color: Color(0xFFD5F6FF),
                                            width: 3,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Text(
                                            '회사소식',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1Family,
                                                  fontSize: 18,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 80),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            decoration: BoxDecoration(),
                            child: Visibility(
                              visible: responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 50, 0, 10),
                                        child: Text(
                                          '협력 기관',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1Family,
                                                fontSize: 30,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText1Family),
                                              ),
                                        ),
                                      ),
                                      FutureBuilder<List<CompanyRecord>>(
                                        future: (_firestoreRequestCompleter ??=
                                                Completer<List<CompanyRecord>>()
                                                  ..complete(
                                                      queryCompanyRecordOnce()))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
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
                                          List<CompanyRecord>
                                              columnCompanyRecordList =
                                              snapshot.data!;
                                          return RefreshIndicator(
                                            onRefresh: () async {
                                              setState(() =>
                                                  _firestoreRequestCompleter =
                                                      null);
                                              await waitForFirestoreRequestCompleter();
                                            },
                                            child: SingleChildScrollView(
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnCompanyRecordList
                                                        .length, (columnIndex) {
                                                  final columnCompanyRecord =
                                                      columnCompanyRecordList[
                                                          columnIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                11, 11, 11, 11),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.77,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 777,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 2,
                                                            color: Color(
                                                                0x59000000),
                                                            offset:
                                                                Offset(2, 2),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.28,
                                                            height: 288,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 333,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              image:
                                                                  DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    columnCompanyRecord
                                                                        .logo,
                                                                    'https://play-lh.googleusercontent.com/38AGKCqmbjZ9OuWx4YjssAz3Y0DTWbiM5HB0ove1pNBq_o9mtWfGszjZNxZdwt_vgHo=w480-h960-rw',
                                                                  ),
                                                                ).image,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.33,
                                                            constraints:
                                                                BoxConstraints(
                                                              maxWidth: 355,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          5,
                                                                          5,
                                                                          5),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              15,
                                                                              5,
                                                                              15,
                                                                              0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    '기관명: ',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    columnCompanyRecord.officename!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    '연락처: ',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    columnCompanyRecord.phone!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    '종류:    ',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    columnCompanyRecord.officecatergory!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    '위치:    ',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                  Text(
                                                                                    columnCompanyRecord.place!,
                                                                                    style: FlutterFlowTheme.of(context).bodyText1,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Divider(
                                                                                height: 24,
                                                                                thickness: 1,
                                                                                color: Color(0xFFDBE2E7),
                                                                              ),
                                                                              Container(
                                                                                width: MediaQuery.of(context).size.width,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: SingleChildScrollView(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: MediaQuery.of(context).size.width,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: SingleChildScrollView(
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                                child: Text(
                                                                                                  '기관 소개',
                                                                                                  style: FlutterFlowTheme.of(context).title3,
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                                                                                                child: Text(
                                                                                                  columnCompanyRecord.introduce!,
                                                                                                  style: FlutterFlowTheme.of(context).subtitle2,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
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
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                11,
                                                                                11,
                                                                                11,
                                                                                11),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                await launchURL(columnCompanyRecord.homepage!);
                                                                              },
                                                                              text: '기관홈페이지 바로가기 ',
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 50,
                                                                                color: Color(0xFF8DDDFF),
                                                                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                      color: Colors.white,
                                                                                      fontSize: 16,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                    ),
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                11,
                                                                                11,
                                                                                11,
                                                                                11),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  'companyview',
                                                                                  queryParams: {
                                                                                    'companyref': serializeParam(
                                                                                      columnCompanyRecord,
                                                                                      ParamType.Document,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    'companyref': columnCompanyRecord,
                                                                                  },
                                                                                );
                                                                              },
                                                                              text: '기관정보 더보기 ',
                                                                              options: FFButtonOptions(
                                                                                width: double.infinity,
                                                                                height: 50,
                                                                                color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                                                                                      color: Colors.white,
                                                                                      fontSize: 16,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).subtitle2Family),
                                                                                    ),
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8),
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
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              ),
                                            ),
                                          );
                                        },
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 77),
                  child: FooterWidget(),
                ),
              ],
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
                    visible: responsiveVisibility(
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

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
