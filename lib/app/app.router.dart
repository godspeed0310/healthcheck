// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i9;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:healthcheck/models/appointment.dart' as _i7;
import 'package:healthcheck/models/medical_test.dart' as _i8;
import 'package:healthcheck/views/appointment_history_view.dart' as _i5;
import 'package:healthcheck/views/details_view.dart' as _i4;
import 'package:healthcheck/views/home_view.dart' as _i2;
import 'package:healthcheck/views/transaction_success.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;

class Routes {
  static const homeView = '/';

  static const transactionSuccessView = '/transaction-success-view';

  static const detailsView = '/details-view';

  static const appointmentHistoryView = '/appointment-history-view';

  static const all = <String>{
    homeView,
    transactionSuccessView,
    detailsView,
    appointmentHistoryView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.transactionSuccessView,
      page: _i3.TransactionSuccessView,
    ),
    _i1.RouteDef(
      Routes.detailsView,
      page: _i4.DetailsView,
    ),
    _i1.RouteDef(
      Routes.appointmentHistoryView,
      page: _i5.AppointmentHistoryView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.TransactionSuccessView: (data) {
      final args = data.getArgs<TransactionSuccessViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.TransactionSuccessView(
            key: args.key, appointment: args.appointment),
        settings: data,
      );
    },
    _i4.DetailsView: (data) {
      final args = data.getArgs<DetailsViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.DetailsView(
            key: args.key,
            test: args.test,
            isPackage: args.isPackage,
            onAddToCart: args.onAddToCart,
            cartListenable: args.cartListenable),
        settings: data,
      );
    },
    _i5.AppointmentHistoryView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.AppointmentHistoryView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class TransactionSuccessViewArguments {
  const TransactionSuccessViewArguments({
    this.key,
    required this.appointment,
  });

  final _i6.Key? key;

  final _i7.Appointment appointment;

  @override
  String toString() {
    return '{"key": "$key", "appointment": "$appointment"}';
  }

  @override
  bool operator ==(covariant TransactionSuccessViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.appointment == appointment;
  }

  @override
  int get hashCode {
    return key.hashCode ^ appointment.hashCode;
  }
}

class DetailsViewArguments {
  const DetailsViewArguments({
    this.key,
    required this.test,
    this.isPackage = false,
    this.onAddToCart,
    required this.cartListenable,
  });

  final _i6.Key? key;

  final _i8.MedicalTest test;

  final bool isPackage;

  final void Function()? onAddToCart;

  final _i9.ValueListenable<dynamic> cartListenable;

  @override
  String toString() {
    return '{"key": "$key", "test": "$test", "isPackage": "$isPackage", "onAddToCart": "$onAddToCart", "cartListenable": "$cartListenable"}';
  }

  @override
  bool operator ==(covariant DetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.test == test &&
        other.isPackage == isPackage &&
        other.onAddToCart == onAddToCart &&
        other.cartListenable == cartListenable;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        test.hashCode ^
        isPackage.hashCode ^
        onAddToCart.hashCode ^
        cartListenable.hashCode;
  }
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTransactionSuccessView({
    _i6.Key? key,
    required _i7.Appointment appointment,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transactionSuccessView,
        arguments:
            TransactionSuccessViewArguments(key: key, appointment: appointment),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailsView({
    _i6.Key? key,
    required _i8.MedicalTest test,
    bool isPackage = false,
    void Function()? onAddToCart,
    required _i9.ValueListenable<dynamic> cartListenable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailsView,
        arguments: DetailsViewArguments(
            key: key,
            test: test,
            isPackage: isPackage,
            onAddToCart: onAddToCart,
            cartListenable: cartListenable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAppointmentHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.appointmentHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTransactionSuccessView({
    _i6.Key? key,
    required _i7.Appointment appointment,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transactionSuccessView,
        arguments:
            TransactionSuccessViewArguments(key: key, appointment: appointment),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailsView({
    _i6.Key? key,
    required _i8.MedicalTest test,
    bool isPackage = false,
    void Function()? onAddToCart,
    required _i9.ValueListenable<dynamic> cartListenable,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.detailsView,
        arguments: DetailsViewArguments(
            key: key,
            test: test,
            isPackage: isPackage,
            onAddToCart: onAddToCart,
            cartListenable: cartListenable),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAppointmentHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.appointmentHistoryView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
