import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/cubit/favorite_button/favorite_button_state.dart';
import 'package:spotify_clone/features/song/domain/usecases/add_or_remove_favourite_songs.dart';
import 'package:spotify_clone/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {

  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteButtonUpdated(String songId) async {
    
    var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
      params: songId
    );
    result.fold(
      (l){},
      (isFavorite){
        emit(
          FavoriteButtonUpdated(
            isFavorite: isFavorite
          )
        );
      },
    );
  }
}