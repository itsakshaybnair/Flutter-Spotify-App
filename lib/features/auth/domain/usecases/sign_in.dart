import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/data/models/signin_user_req.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class SigninUseCase implements UseCase<Either,SigninUserReq> {


  @override
  Future<Either> call({SigninUserReq ? params}) async {
    return sl<AuthRepository>().signin(params!);
  }

}
