part of 'player_bloc.dart';

@immutable
abstract class PlayerEvent {}

class OnSetCurrentTrack extends PlayerEvent{

  final Track currentTrack;

  OnSetCurrentTrack(this.currentTrack);

}


