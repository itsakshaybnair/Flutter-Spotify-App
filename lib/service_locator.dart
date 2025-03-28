import 'package:get_it/get_it.dart';
import 'package:spotify_clone/features/auth/data/repository/auth_repo_impl.dart';
import 'package:spotify_clone/features/song/data/repository/song_repository_impl.dart';
import 'package:spotify_clone/features/auth/data/sources/auth_firebase_service.dart';
import 'package:spotify_clone/features/song/data/sources/song_firebase_service.dart';
import 'package:spotify_clone/features/auth/domain/repository/auth.dart';
import 'package:spotify_clone/features/song/domain/repository/song.dart';
import 'package:spotify_clone/features/auth/domain/usecases/get_user.dart';
import 'package:spotify_clone/features/auth/domain/usecases/sign_in.dart';
import 'package:spotify_clone/features/auth/domain/usecases/signup.dart';
import 'package:spotify_clone/features/song/domain/usecases/add_or_remove_favourite_songs.dart';
import 'package:spotify_clone/features/song/domain/usecases/get_favorite_songs.dart';
import 'package:spotify_clone/features/song/domain/usecases/get_new_songs.dart';
import 'package:spotify_clone/features/song/domain/usecases/get_play_list.dart';
import 'package:spotify_clone/features/song/domain/usecases/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
 
 
 sl..registerSingleton< AuthFirebaseService>(
  AuthFirebaseServiceImpl()
 )..

 registerSingleton<SongFirebaseService>(
  SongFirebaseServiceImpl()
 )..
 

 registerSingleton<AuthRepository>(
  AuthRepositoryImpl()
 )..

 registerSingleton<SongsRepository>(
  SongsRepositoryImpl()
 )



 ..registerSingleton(
  SignupUseCase()
 )..

 registerSingleton(
  SigninUseCase()
 )..

 registerSingleton<GetNewsSongsUseCase>(
  GetNewsSongsUseCase()
 );

 sl.registerSingleton<GetPlayListUseCase>(
  GetPlayListUseCase()
 );

 sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
  AddOrRemoveFavoriteSongUseCase()
 );

 sl.registerSingleton<IsFavoriteSongUseCase>(
  IsFavoriteSongUseCase()
 );

 sl.registerSingleton<GetUserUseCase>(
  GetUserUseCase()
 );

 sl.registerSingleton<GetFavoriteSongsUseCase>(
  GetFavoriteSongsUseCase()
 );
 
}
