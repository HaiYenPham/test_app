import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

import '../../service/connectivity_service.dart';

class AppStatus {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool isEmpty;
  final bool isLoadingMore;

  AppStatus._({
    this.isEmpty = false,
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.isLoadingMore = false,
  });

  factory AppStatus.loading() {
    return AppStatus._(isLoading: true);
  }

  factory AppStatus.loadingMore() {
    return AppStatus._(isSuccess: true, isLoadingMore: true);
  }

  factory AppStatus.success() {
    return AppStatus._(isSuccess: true);
  }

  factory AppStatus.error() {
    return AppStatus._(
      isError: true,
    );
  }

  factory AppStatus.empty() {
    return AppStatus._(isEmpty: true);
  }
}

abstract class BaseControllerList<T> extends GetxController
    with AppListMixin<T> {
  var hasInternet = true.obs;
  final connectService = Get.find<ConnectivityService>();

  @override
  void onInit() {
    super.onInit();
    _value = [];
    hasInternet(connectService.networkConnected());
    connectService.networkStatus.listen((value) {
      hasInternet(value);
    });
  }

  @override
  void onClose() {
    super.onClose();
    hasInternet.close();
  }
}

mixin AppListMixin<T> on ListNotifierMixin {
  var _value = List<T>.empty();
  AppStatus? _status;

  bool _isNullOrEmpty(dynamic val) {
    if (val == null) return true;
    var result = false;
    if (val is Iterable) {
      result = val.isEmpty;
    } else if (val is String) {
      result = val.isEmpty;
    } else if (val is Map) {
      result = val.isEmpty;
    }
    return result;
  }

  void _fillEmptyStatus() {
    _status =
        _isNullOrEmpty(_value) ? AppStatus.loading() : AppStatus.success();
  }

  AppStatus get status {
    notifyChildrens();
    return _status ??= _status = AppStatus.loading();
  }

  List<T> get value {
    notifyChildrens();
    return _value;
  }

  @protected
  set value(List<T> newValue) {
    if (_value == newValue) return;
    _value = newValue;
    refresh();
  }

  @protected
  void change(List<T> newState, {AppStatus? status}) {
    var _canUpdate = false;
    if (status != null) {
      _status = status;
      _canUpdate = true;
    }
    if (newState != _value) {
      _value = newState;
      _canUpdate = true;
    }
    if (_canUpdate) {
      refresh();
    }
  }

  void clear() {
    _value = [];
    refresh();
  }

  void removeAt(int index) {
    _value.removeAt(index);
    _status = AppStatus.success();
    refresh();
  }

  void append(List<T> val) {
    _value.addAll(val);
    _status = AppStatus.success();
    refresh();
  }

  void clearAndAppend(List<T> val) {
    _value.clear();
    _value.addAll(val);
    _status = AppStatus.success();
    refresh();
  }

  void setStatus(AppStatus status) {
    _status = status;
    refresh();
  }

  Widget appListX(NotifierBuilder<List<T>> widget,
      {Widget Function()? onError,
      Widget Function()? onEmpty,
      Widget Function()? onLoading,
      void Function()? onRetry}) {
    return SimpleBuilder(builder: (_) {
      if (status.isLoading) {
        return onLoading != null ? onLoading() : Text('Loading');
      } else if (status.isError) {
        // if (status.errorType == ApiErrorType.forceNoResult) {
        //   return onForceEmpty != null
        //       ? onForceEmpty()
        //       : const Center(child: Text('No data found'));
        // }
        return onError != null ? onError() : const Center(child: Text('Error'));
      } else if (status.isEmpty) {
        return onEmpty != null
            ? onEmpty()
            : const Center(child: Text('No data found'));
      }
      return widget(value);
    });
  }
}

mixin AppObjectMixin<T> on ListNotifierMixin {
  T? _value;
  AppStatus? _status;

  bool _isNullOrEmpty(dynamic val) {
    if (val == null) return true;
    var result = false;
    if (val is Iterable) {
      result = val.isEmpty;
    } else if (val is String) {
      result = val.isEmpty;
    } else if (val is Map) {
      result = val.isEmpty;
    }
    return result;
  }

  void _fillEmptyStatus() {
    _status =
        _isNullOrEmpty(_value) ? AppStatus.loading() : AppStatus.success();
  }

  AppStatus get status {
    notifyChildrens();
    return _status ??= _status = AppStatus.loading();
  }

  T? get state => value;

  @protected
  T? get value {
    notifyChildrens();
    return _value;
  }

  @protected
  set value(T? newValue) {
    if (_value == newValue) return;
    // if (newValue == null) {
    //   _status = AppStatus.empty();
    // }
    _value = newValue;
    refresh();
  }

  @protected
  void change(T? newState, {AppStatus? status}) {
    var _canUpdate = false;
    if (status != null) {
      _status = status;
      _canUpdate = true;
    }
    if (newState != _value) {
      _value = newState;
      // if (newState == null && status == null){
      //   _status == AppStatus.empty();
      // }
      _canUpdate = true;
    }
    if (_canUpdate) {
      refresh();
    }
  }

  void setStatus(AppStatus status) {
    _status = status;
    refresh();
  }

  Widget appObjectX(NotifierBuilder<T?> widget,
      {Widget Function()? onError,
      Widget Function()? onEmpty,
      Widget Function()? onLoading,
      Function? onRetry}) {
    return SimpleBuilder(builder: (_) {
      if (status.isLoading) {
        return onLoading != null ? onLoading() : const Text('Loading');
      } else if (status.isError) {
        return onError != null ? onError() : const Center(child: Text('Error'));
      } else if (status.isEmpty) {
        return onEmpty != null
            ? onEmpty()
            : const Center(child: Text('No data found'));
      }
      return widget(value);
    });
  }
}

abstract class BaseControllerObject<T> extends GetxController
    with AppObjectMixin<T> {
  var hasInternet = true.obs;
  final connectService = Get.find<ConnectivityService>();

  @override
  void onInit() {
    super.onInit();
    connectService.networkStatus.listen((value) {
      hasInternet(value);
    });
  }

  @override
  void onClose() {
    super.onClose();
    hasInternet.close();
  }
}
