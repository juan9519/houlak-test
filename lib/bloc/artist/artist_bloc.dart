import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:spotify/spotify.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  ArtistBloc() : super(ArtistState(artist: Artist(),topTracks: [])) {

    on<OnAddArtist>((event, emit) {
      emit(state.copyWith(artist: event.artist));
    });

    on<OnAddTopTracks>((event, emit) {
      emit(state.copyWith(topTracks: event.topTracks));
    });
  }
}
