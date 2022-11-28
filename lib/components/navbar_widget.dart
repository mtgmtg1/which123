import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    Key? key,
    this.c1,
    this.c2,
    this.c3,
    this.c4,
    this.c5,
    this.c12,
    this.c45,
  }) : super(key: key);

  final Color? c1;
  final Color? c2;
  final Color? c3;
  final Color? c4;
  final Color? c5;
  final Color? c12;
  final Color? c45;

  @override
  _NavbarWidgetState createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'iconButtonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 50.ms,
          begin: 1,
          end: 1.2,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 50.ms,
          begin: 1,
          end: 1.2,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 50.ms,
          begin: 1,
          end: 1.2,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 50.ms,
          begin: 1,
          end: 1.2,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 50.ms,
          begin: 1,
          end: 1.2,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 50.ms,
          begin: 1,
          end: 1.2,
        ),
      ],
    ),
    'iconButtonOnActionTriggerAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 50.ms,
          begin: 1,
          end: 1.2,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 1),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        constraints: BoxConstraints(
          maxWidth: 555,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 12,
              color: Color(0x33000000),
              offset: Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.circular(40),
        ),
        alignment: AlignmentDirectional(0, 0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2,
              sigmaY: 2,
            ),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  color: Color(0xDBFFFFFF),
                  borderRadius: BorderRadius.circular(40),
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderWidth: 1,
                              buttonSize: 40,
                              icon: Icon(
                                Icons.person_search,
                                color: valueOrDefault<Color>(
                                  widget.c1,
                                  FlutterFlowTheme.of(context).secondaryText,
                                ),
                                size: 30,
                              ),
                              onPressed: () async {
                                if (animationsMap[
                                        'iconButtonOnActionTriggerAnimation1'] !=
                                    null) {
                                  await animationsMap[
                                          'iconButtonOnActionTriggerAnimation1']!
                                      .controller
                                      .forward(from: 0.0);
                                }

                                context.pushNamed('pro_page');
                              },
                            ).animateOnActionTrigger(
                              animationsMap[
                                  'iconButtonOnActionTriggerAnimation1']!,
                            ),
                          ),
                        ),
                        Expanded(
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.people_alt_outlined,
                              color: valueOrDefault<Color>(
                                widget.c12,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              size: 30,
                            ),
                            onPressed: () async {
                              if (animationsMap[
                                      'iconButtonOnActionTriggerAnimation1'] !=
                                  null) {
                                await animationsMap[
                                        'iconButtonOnActionTriggerAnimation1']!
                                    .controller
                                    .forward(from: 0.0);
                              }

                              context.pushNamed('Student_page');
                            },
                          ).animateOnActionTrigger(
                            animationsMap[
                                'iconButtonOnActionTriggerAnimation2']!,
                          ),
                        ),
                        Expanded(
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.comment_outlined,
                              color: valueOrDefault<Color>(
                                widget.c2,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              size: 30,
                            ),
                            onPressed: () async {
                              if (animationsMap[
                                      'iconButtonOnActionTriggerAnimation3'] !=
                                  null) {
                                await animationsMap[
                                        'iconButtonOnActionTriggerAnimation3']!
                                    .controller
                                    .forward(from: 0.0);
                              }

                              context.pushNamed('Community');
                            },
                          ).animateOnActionTrigger(
                            animationsMap[
                                'iconButtonOnActionTriggerAnimation3']!,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primaryColor,
                                  FlutterFlowTheme.of(context).main1
                                ],
                                stops: [0, 1],
                                begin: AlignmentDirectional(0.34, -1),
                                end: AlignmentDirectional(-0.34, 1),
                              ),
                              shape: BoxShape.circle,
                            ),
                            alignment: AlignmentDirectional(0, 0),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        buttonSize: 100,
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: valueOrDefault<Color>(
                                            widget.c3,
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          size: 35,
                                        ),
                                        onPressed: () async {
                                          if (animationsMap[
                                                  'iconButtonOnActionTriggerAnimation4'] !=
                                              null) {
                                            await animationsMap[
                                                    'iconButtonOnActionTriggerAnimation4']!
                                                .controller
                                                .forward(from: 0.0);
                                          }

                                          context.pushNamed('Home_page');
                                        },
                                      ).animateOnActionTrigger(
                                        animationsMap[
                                            'iconButtonOnActionTriggerAnimation4']!,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.accessible,
                              color: valueOrDefault<Color>(
                                widget.c4,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              size: 30,
                            ),
                            onPressed: () async {
                              if (animationsMap[
                                      'iconButtonOnActionTriggerAnimation5'] !=
                                  null) {
                                await animationsMap[
                                        'iconButtonOnActionTriggerAnimation5']!
                                    .controller
                                    .forward(from: 0.0);
                              }

                              context.pushNamed('wellbeinginfo');
                            },
                          ).animateOnActionTrigger(
                            animationsMap[
                                'iconButtonOnActionTriggerAnimation5']!,
                          ),
                        ),
                        Expanded(
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.connected_tv,
                              color: valueOrDefault<Color>(
                                widget.c45,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              size: 30,
                            ),
                            onPressed: () async {
                              if (animationsMap[
                                      'iconButtonOnActionTriggerAnimation5'] !=
                                  null) {
                                await animationsMap[
                                        'iconButtonOnActionTriggerAnimation5']!
                                    .controller
                                    .forward(from: 0.0);
                              }

                              context.pushNamed('Contents');
                            },
                          ).animateOnActionTrigger(
                            animationsMap[
                                'iconButtonOnActionTriggerAnimation6']!,
                          ),
                        ),
                        Expanded(
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderWidth: 1,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.location_history,
                              color: valueOrDefault<Color>(
                                widget.c5,
                                FlutterFlowTheme.of(context).secondaryText,
                              ),
                              size: 30,
                            ),
                            onPressed: () async {
                              if (animationsMap[
                                      'iconButtonOnActionTriggerAnimation7'] !=
                                  null) {
                                await animationsMap[
                                        'iconButtonOnActionTriggerAnimation7']!
                                    .controller
                                    .forward(from: 0.0);
                              }

                              context.pushNamed('MyPage');
                            },
                          ).animateOnActionTrigger(
                            animationsMap[
                                'iconButtonOnActionTriggerAnimation7']!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
