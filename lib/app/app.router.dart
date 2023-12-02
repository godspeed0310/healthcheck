// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:healthcheck/views/home_view.dart' as _i2;
import 'package:healthcheck/views/transaction_success.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const homeView = '/';

  static const transactionSuccessView = '/transaction-success-view';

  static const all = <String>{
    homeView,
    transactionSuccessView,
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
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.TransactionSuccessView: (data) {
      final args = data.getArgs<TransactionSuccessViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.TransactionSuccessView(
            key: args.key, appointmentDate: args.appointmentDate),
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
    required this.appointmentDate,
  });

  final _i4.Key? key;

  final DateTime appointmentDate;

  @override
  String toString() {
    return '{"key": "$key", "appointmentDate": "$appointmentDate"}';
  }

  @override
  bool operator ==(covariant TransactionSuccessViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.appointmentDate == appointmentDate;
  }

  @override
  int get hashCode {
    return key.hashCode ^ appointmentDate.hashCode;
  }
}

extension NavigatorStateExtension on _i5.NavigationService {
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
    _i4.Key? key,
    required DateTime appointmentDate,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.transactionSuccessView,
        arguments: TransactionSuccessViewArguments(
            key: key, appointmentDate: appointmentDate),
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
    _i4.Key? key,
    required DateTime appointmentDate,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.transactionSuccessView,
        arguments: TransactionSuccessViewArguments(
            key: key, appointmentDate: appointmentDate),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
