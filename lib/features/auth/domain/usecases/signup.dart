import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
