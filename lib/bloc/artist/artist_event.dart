part of 'artist_bloc.dart';

@immutable
abstract class ArtistEvent {}

class OnAddArtist extends ArtistEvent {
  final Artist artist;

  OnAddArtist(this.artist);
}

class OnAddTopTracks extends ArtistEvent {
  final List<Track> topTracks;

  OnAddTopTracks(this.topTracks);

}
