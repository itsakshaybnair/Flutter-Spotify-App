import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth.dart';
import 'package:spotify_clone/service_locator.dart';

class GetUserUseCase implements UseCase<Either,dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getUser();
  }

}
