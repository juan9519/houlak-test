part of 'artist_bloc.dart';

@immutable
class ArtistState {
  final Artist artist;
  final List<Track> topTracks;

  ArtistState( {required this.artist, required this.topTracks});


  ArtistState copyWith({
    Artist? artist,
    List<Track>? topTracks
  }) =>
      ArtistState(
          artist: artist ?? this.artist,
          topTracks: topTracks ?? this.topTracks
      );

}
