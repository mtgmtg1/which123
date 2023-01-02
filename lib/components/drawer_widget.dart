import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
            child: InkWell(
              onTap: () async {
                context.pushNamed('Student_page');
              },
              child: Text(
                '대학생 상담사',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title2Family),
                    ),
              ),
            ),
          ),
          Divider(
            indent: 22,
            endIndent: 22,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
            child: InkWell(
              onTap: () async {
                context.pushNamed('pro_page');
              },
              child: Text(
                '전문 상담사',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title2Family),
                    ),
              ),
            ),
          ),
          Divider(
            indent: 22,
            endIndent: 22,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
            child: InkWell(
              onTap: () async {
                context.pushNamed('Community');
              },
              child: Text(
                '고민상담',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title2Family),
                    ),
              ),
            ),
          ),
          Divider(
            indent: 22,
            endIndent: 22,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
            child: InkWell(
              onTap: () async {
                context.pushNamed('Contents');
              },
              child: Text(
                '컨텐츠',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title2Family),
                    ),
              ),
            ),
          ),
          Divider(
            indent: 22,
            endIndent: 22,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
            child: InkWell(
              onTap: () async {
                context.pushNamed('wellbeinginfo');
              },
              child: Text(
                '복지기관',
                style: FlutterFlowTheme.of(context).title2.override(
                      fontFamily: FlutterFlowTheme.of(context).title2Family,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).title2Family),
                    ),
              ),
            ),
          ),
          Divider(
            indent: 22,
            endIndent: 22,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Container(
            width: double.infinity,
            color: Color(0x00000000),
            child: ExpandableNotifier(
              initialExpanded: false,
              child: ExpandablePanel(
                header: Text(
                  '회사 소개',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: FlutterFlowTheme.of(context).title2Family,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).title2Family),
                      ),
                ),
                collapsed: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Text(
                      '',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyText1Family,
                            color: Color(0x8A000000),
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyText1Family),
                          ),
                    ),
                  ),
                ),
                expanded: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          context.pushNamed('Company1');
                        },
                        child: Text(
                          '회사안내',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .subtitle1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .subtitle1Family,
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .subtitle1Family),
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed('Company3');
                        },
                        child: Text(
                          '비전',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed('Company2');
                        },
                        child: Text(
                          '협력기관',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed('Company4_Notice');
                        },
                        child: Text(
                          '소식',
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyText1Family,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyText1Family),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                theme: ExpandableThemeData(
                  tapHeaderToExpand: true,
                  tapBodyToExpand: false,
                  tapBodyToCollapse: false,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  hasIcon: true,
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1,
            indent: 22,
            endIndent: 22,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 11),
            child: InkWell(
              onTap: () async {
                context.pushNamed('MyPage');
              },
              child: Text(
                '마이페이지',
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).subtitle2Family),
                    ),
              ),
            ),
          ),
          if (valueOrDefault(currentUserDocument?.catergory, '') != '일반회원')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 11),
              child: AuthUserStreamWidget(
                builder: (context) => InkWell(
                  onTap: () async {
                    context.pushNamed('balanceHistory');
                  },
                  child: Text(
                    '결제 관리 페이지',
                    style: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).subtitle2Family,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).subtitle2Family),
                        ),
                  ),
                ),
              ),
            ),
          if (valueOrDefault(currentUserDocument?.catergory, '') != '일반회원')
            AuthUserStreamWidget(
              builder: (context) => InkWell(
                onTap: () async {
                  context.pushNamed('ManagerPage_Home');
                },
                child: Text(
                  '상담사용 페이지',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).subtitle2Family),
                      ),
                ),
              ),
            ),
          if (currentUserEmail == 'whichmoment@hoca.app')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
              child: InkWell(
                onTap: () async {
                  await launchURL(
                      'https://whichnewadmin-s9csg1.flutterflow.app/');
                },
                child: Text(
                  '관리자페이지',
                  style: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).subtitle2Family,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).subtitle2Family),
                      ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 66, 0, 0),
            child: InkWell(
              onTap: () async {
                GoRouter.of(context).prepareAuthEvent();
                await signOut();

                context.goNamedAuth('onboarding', mounted);
              },
              child: Text(
                '로그아웃',
                style: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).subtitle2Family),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
