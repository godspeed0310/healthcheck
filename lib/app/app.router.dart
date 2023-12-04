// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i10;
import 'package:flutter/material.dart' as _i7;
import 'package:stacked/stacked.dart' as _i6;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../models/appointment.dart' as _i8;
import '../models/medical_test.dart' as _i9;
import '../views/appointment_history_view.dart' as _i4;
import '../views/details_view.dart' as _i3;
import '../views/home/home_view.dart' as _i1;
import '../views/transaction_success.dart' as _i2;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i5.StackedService.navigatorKey);

class StackedRouterWeb extends _i6.RootStackRouter {
  StackedRouterWeb({_i7.GlobalKey<_i7.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    TransactionSuccessViewRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionSuccessViewArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i2.TransactionSuccessView(
          key: args.key,
          appointment: args.appointment,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsViewArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.DetailsView(
          key: args.key,
          test: args.test,
          isPackage: args.isPackage,
          onAddToCart: args.onAddToCart,
          cartListenable: args.cartListenable,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AppointmentHistoryViewRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.AppointmentHistoryView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          TransactionSuccessViewRoute.name,
          path: '/transaction-success-view',
        ),
        _i6.RouteConfig(
          DetailsViewRoute.name,
          path: '/details-view',
        ),
        _i6.RouteConfig(
          AppointmentHistoryViewRoute.name,
          path: '/appointment-history-view',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i6.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.TransactionSuccessView]
class TransactionSuccessViewRoute
    extends _i6.PageRouteInfo<TransactionSuccessViewArgs> {
  TransactionSuccessViewRoute({
    _i7.Key? key,
    required _i8.Appointment appointment,
  }) : super(
          TransactionSuccessViewRoute.name,
          path: '/transaction-success-view',
          args: TransactionSuccessViewArgs(
            key: key,
            appointment: appointment,
          ),
        );

  static const String name = 'TransactionSuccessView';
}

class TransactionSuccessViewArgs {
  const TransactionSuccessViewArgs({
    this.key,
    required this.appointment,
  });

  final _i7.Key? key;

  final _i8.Appointment appointment;

  @override
  String toString() {
    return 'TransactionSuccessViewArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [_i3.DetailsView]
class DetailsViewRoute extends _i6.PageRouteInfo<DetailsViewArgs> {
  DetailsViewRoute({
    _i7.Key? key,
    required _i9.MedicalTest test,
    bool isPackage = false,
    void Function()? onAddToCart,
    required _i10.ValueListenable<dynamic> cartListenable,
  }) : super(
          DetailsViewRoute.name,
          path: '/details-view',
          args: DetailsViewArgs(
            key: key,
            test: test,
            isPackage: isPackage,
            onAddToCart: onAddToCart,
            cartListenable: cartListenable,
          ),
        );

  static const String name = 'DetailsView';
}

class DetailsViewArgs {
  const DetailsViewArgs({
    this.key,
    required this.test,
    this.isPackage = false,
    this.onAddToCart,
    required this.cartListenable,
  });

  final _i7.Key? key;

  final _i9.MedicalTest test;

  final bool isPackage;

  final void Function()? onAddToCart;

  final _i10.ValueListenable<dynamic> cartListenable;

  @override
  String toString() {
    return 'DetailsViewArgs{key: $key, test: $test, isPackage: $isPackage, onAddToCart: $onAddToCart, cartListenable: $cartListenable}';
  }
}

/// generated route for
/// [_i4.AppointmentHistoryView]
class AppointmentHistoryViewRoute extends _i6.PageRouteInfo<void> {
  const AppointmentHistoryViewRoute()
      : super(
          AppointmentHistoryViewRoute.name,
          path: '/appointment-history-view',
        );

  static const String name = 'AppointmentHistoryView';
}

extension RouterStateExtension on _i5.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToTransactionSuccessView({
    _i7.Key? key,
    required _i8.Appointment appointment,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      TransactionSuccessViewRoute(
        key: key,
        appointment: appointment,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDetailsView({
    _i7.Key? key,
    required _i9.MedicalTest test,
    bool isPackage = false,
    void Function()? onAddToCart,
    required _i10.ValueListenable<dynamic> cartListenable,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      DetailsViewRoute(
        key: key,
        test: test,
        isPackage: isPackage,
        onAddToCart: onAddToCart,
        cartListenable: cartListenable,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAppointmentHistoryView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AppointmentHistoryViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithTransactionSuccessView({
    _i7.Key? key,
    required _i8.Appointment appointment,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      TransactionSuccessViewRoute(
        key: key,
        appointment: appointment,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDetailsView({
    _i7.Key? key,
    required _i9.MedicalTest test,
    bool isPackage = false,
    void Function()? onAddToCart,
    required _i10.ValueListenable<dynamic> cartListenable,
    void Function(_i6.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      DetailsViewRoute(
        key: key,
        test: test,
        isPackage: isPackage,
        onAddToCart: onAddToCart,
        cartListenable: cartListenable,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAppointmentHistoryView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AppointmentHistoryViewRoute(),
      onFailure: onFailure,
    );
  }
}
