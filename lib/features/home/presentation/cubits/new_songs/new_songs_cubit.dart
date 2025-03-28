import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/features/song/domain/entities/song.dart';
import 'package:spotify_clone/features/song/domain/usecases/get_new_songs.dart';
import 'package:spotify_clone/service_locator.dart';

part 'new_songs_state.dart';

class NewSongsCubit extends Cubit<NewsSongsState> {
  NewSongsCubit() : super(NewsSongsLoading());








 Future < void > getNewsSongs() async {
    var returnedSongs = await sl < GetNewsSongsUseCase > ().call();
    returnedSongs.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (data) {
        emit(
          NewsSongsLoaded(songs: data)
        );
      }
    );
  }







}
