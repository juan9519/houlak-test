import 'package:spotify/spotify.dart';

class SpotifySearch {
  static const String _client = '21fcdf03e2154b85b9ebe2f2cfd3e33c';
  static const String _secret = 'b1f125b2070840d29d4db4b4e9d63ba4';
  static SpotifyApiCredentials credentials = SpotifyApiCredentials(_client, _secret);
  SpotifyApi spotify = SpotifyApi(credentials);



  ///Busca artistas y los devuelve ordenados por popularidad
  Future<List<Artist>> searchArtist(String lookingFor) async {


    List<Artist> lista = <Artist>[];

    var search = await spotify.search
        .get(lookingFor, types: <SearchType>[SearchType.artist])
        .first(15)
        .catchError((err) => print((err as SpotifyException).message));
    if (search != null) {
      search.forEach((pages) {
        pages.items!.forEach((item) {
          if (item is Artist) {
            lista.add(item);
          }
        });
      });
    }

    ///Ordena de mayor a menor popularidad
    lista.sort((a,b) => b.popularity!.compareTo(a.popularity!));
    return lista;
  }



}
