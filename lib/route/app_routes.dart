part of 'app_pages.dart';

abstract class RouteNames {
  RouteNames._();
  static const bottomNavigationWidget = _Paths.bottomNavigationWidget;
  static const onboardView = _Paths.onboardView;
  static const dashboardView = _Paths.dashboardView;
  static const loginView = _Paths.loginView;
  static const libraryView = _Paths.libraryView;
  static const registerView = _Paths.registerView;
  static const otpView = _Paths.otpView;
  static const categoryView = _Paths.categoryView;
  static const profileView = _Paths.profileView;
  static const examQuestionPlayView = _Paths.examQuestionPlayView;
  static const webApp = _Paths.webApp;
}

abstract class _Paths {
  _Paths._();
  static const bottomNavigationWidget = '/bottom_navigation_widget';
  static const onboardView = '/onboard_view';
  static const dashboardView = '/dashboard_view';
  static const loginView = '/login_view';
  static const registerView = '/register_view';
  static const otpView = '/otp_view';
  static const libraryView = '/library_view';
  static const categoryView = '/category_view';
  static const profileView = '/profile_view';
  static const examQuestionPlayView = '/exam_question_play_view';
  static const webApp = '/web_app';
}