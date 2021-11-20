part of 'player_bloc.dart';


class PlayerState {

  final Track currentTrack;
  PlayerState(this.currentTrack);

  PlayerState copyWith({required Track currentTrack}) =>
      PlayerState( currentTrack);
}
