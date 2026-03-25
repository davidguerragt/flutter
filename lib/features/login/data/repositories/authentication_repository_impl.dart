import 'package:maquetacion/features/login/data/data_sources/remote_authentication_data_source.dart';
import 'package:maquetacion/features/login/data/models/user_password_model.dart';
import 'package:maquetacion/features/login/domain/entities/user.dart';
import 'package:maquetacion/features/login/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final RemoteAuthenticationDataSource _remoteAuthenticationDataSource;

  AuthenticationRepositoryImpl({
    RemoteAuthenticationDataSource? remoteAuthenticationDataSource,
  }) : _remoteAuthenticationDataSource =
           remoteAuthenticationDataSource ?? RemoteAuthenticationDataSource();

  @override
  Future<String> getAccessToken() {
    // TODO: implement getAccessToken
    throw UnimplementedError();
  }

  @override
  Future<String> getUserEmail() {
    // TODO: implement getUserEmail
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> registerWithEmailAndPassword(String email, String password) {
    // TODO: implement registerWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<User> singInWithEmailAndPassword(String email, String password) async {
    final UserPasswordModel userPasswordModel = UserPasswordModel(
      email: email,
      password: password,
    );

    final userModel = await _remoteAuthenticationDataSource
        .singInWithEmailAndPassword(userPasswordModel);
    return User.fromModel(userModel);
  }
}
