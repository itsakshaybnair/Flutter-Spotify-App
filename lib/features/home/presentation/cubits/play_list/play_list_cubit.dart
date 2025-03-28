import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify_clone/features/song/domain/entities/song.dart';
import 'package:spotify_clone/features/song/domain/usecases/get_play_list.dart';
import 'package:spotify_clone/service_locator.dart';

part 'play_list_state.dart';

class PlayListCubit extends Cubit<PlayListState> {

  PlayListCubit() : super(PlayListLoading());

  Future < void > getPlayList() async {
    var returnedSongs = await sl < GetPlayListUseCase > ().call();
    returnedSongs.fold(
      (l) {
        emit(PlayListLoadFailure());
      },
      (data) {
        emit(
          PlayListLoaded(songs: data)
        );
      }
    );
  }
  
  
}
