import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:spotify/spotify.dart';

part 'player_event.dart';

part 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerState(Track())) {
    
    
    //Guarda la canción que se esta escuchando actualmente en la preview
    on<OnSetCurrentTrack>((event,emit) {
      emit(state.copyWith(currentTrack: event.currentTrack));
    });
  }
}
