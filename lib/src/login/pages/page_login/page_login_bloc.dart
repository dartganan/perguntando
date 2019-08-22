import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:perguntando/src/repository/hasura_repository.dart';
import 'package:perguntando/src/shared/blocs/auth_bloc.dart';
import 'package:perguntando/src/shared/models/user_model.dart';
import 'package:perguntando/src/shared/models/user_state.dart';
import 'package:perguntando/src/shared/repositories/auth_repository.dart';

class PageLoginBloc extends BlocBase {
  final HasuraRepository _hasuraRepository;
  final AuthBloc _authBloc;
  final formKey = GlobalKey<FormState>();

  String email;
  String password;

  PageLoginBloc(this._authBloc, this._hasuraRepository);

  void onLogin() async {
    FormState _formState = formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      _authBloc.inUserState.add(Loading());
      AuthRepository authRepository = AuthRepository();
      try {
        var response = await authRepository.getToken(email, password);
        if ((response['token'] as String).isNotEmpty) {
          _authBloc.inToken.add(response['token']);
          final user = UserModel.fromJson(response['user']);
          _authBloc.inUser.add(user);
          _authBloc.inUserState.add(Authenticated());
        }
      } on DioError catch (e) {
        _authBloc.inUserState.add(Error(e));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
