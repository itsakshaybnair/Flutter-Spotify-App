import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/usecase/usecase.dart';
import 'package:spotify_clone/features/song/domain/repository/song.dart';
import 'package:spotify_clone/service_locator.dart';

class GetPlayListUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await sl<SongsRepository>().getPlayList();
  }
}
