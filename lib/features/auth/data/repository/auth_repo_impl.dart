import 'package:dartz/dartz.dart';
import 'package:spotify_clone/features/auth/data/models/create_user_req.dart';
import 'package:spotify_clone/features/auth/data/sources/auth_firebase_service.dart';
import 'package:spotify_clone/features/auth/data/models/signin_user_req.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {

 

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
  
  @override
  Future<Either> getUser()async {
        return await sl<AuthFirebaseService>().getUser();

  }
  
 @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
     return await sl<AuthFirebaseService>().signIn(signinUserReq);
  }

  

  
}
