import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:perguntando/src/shared/models/user_model.dart';
import 'package:perguntando/src/shared/models/user_state.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BlocBase {
  final _userController = BehaviorSubject<UserModel>();
  final _tokenController = BehaviorSubject<String>();
  final _userStateController = BehaviorSubject<AuthState>.seeded(NotAuthenticated());
  StreamSubscription tokenSub;

  AuthBloc() {
    tokenSub = _tokenController.listen((token) {
      if (token.isEmpty) {
        _userStateController.add(NotAuthenticated());
      } else {
        _userStateController.add(Authenticated());
      }
    });
  }
  Observable<AuthState> get outUserState => _userStateController.stream;
  Sink<AuthState> get inUserState => _userStateController.sink;

  Observable<String> get outToken => _tokenController.stream;
  Sink<String> get inToken => _tokenController.sink;
  Observable<UserModel> get outUser => _userController.stream;
  Sink<UserModel> get inUser => _userController.sink;
  UserModel get userControleValue => _userController.value;

  @override
  void dispose() {
    tokenSub.cancel();
    _userStateController.close();
    _tokenController.close();
    _userController.close();
    super.dispose();
  }
}
