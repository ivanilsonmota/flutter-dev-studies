// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerStore, Store {
  final _$postListAtom = Atom(name: '_HomeControllerStore.postList');

  @override
  List<PostModel> get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(List<PostModel> value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  final _$currentIndexAtom = Atom(name: '_HomeControllerStore.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$refreshAsyncAction = AsyncAction('_HomeControllerStore.refresh');

  @override
  Future<Null> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$_HomeControllerStoreActionController =
      ActionController(name: '_HomeControllerStore');

  @override
  dynamic getData() {
    final _$actionInfo = _$_HomeControllerStoreActionController.startAction(
        name: '_HomeControllerStore.getData');
    try {
      return super.getData();
    } finally {
      _$_HomeControllerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postList: ${postList},
currentIndex: ${currentIndex}
    ''';
  }
}
