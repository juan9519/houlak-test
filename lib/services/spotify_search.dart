import 'package:http/http.dart' as http;
import 'package:spotify/spotify.dart';

class SpotifySearch {
  static const String _client = '21fcdf03e2154b85b9ebe2f2cfd3e33c';
  static const String _secret = 'b1f125b2070840d29d4db4b4e9d63ba4';
  static SpotifyApiCredentials _credentials =
      SpotifyApiCredentials(_client, _secret);
  static SpotifyApi _spotify = SpotifyApi(_credentials);

  ///Busca artistas y los devuelve ordenados por popularidad
  Future<List<Artist>> searchArtist(String lookingFor, int quantity) async {
    List<Artist> lista = <Artist>[];

    var search = await _spotify.search
        .get(lookingFor, types: <SearchType>[SearchType.artist])
        .first(quantity)
        .catchError((err) => print((err as SpotifyException).message));
    search.forEach((pages) {
      pages.items!.forEach((item) {
        if (item is Artist) {
          lista.add(item);
        }
      });
    });

    ///Ordena de mayor a menor popularidad
    lista.sort((a, b) => b.popularity!.compareTo(a.popularity!));
    return lista;
  }

  ///Dado un id busca y devuelve un artista
  static Future<Artist> artistDetail(String lookingFor) async {
    var artist = await _spotify.artists
        .get(lookingFor)
        .catchError((err) => print((err as SpotifyException).message));

    //No debería retornar null, checkear cuando se usa por las dudas
    return artist;
  }

  ///Dado un id de artista busca las top tracks
  static Future<List<Track>> topTracks(String lookingFor) async {
    List<Track> tracks = [];

    var searchTracks = await _spotify.artists.getTopTracks(lookingFor, 'UY');

    for (var track in searchTracks) {
      tracks.add(track);
    }


    return tracks;
  }
}
