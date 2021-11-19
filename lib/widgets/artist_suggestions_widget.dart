import 'package:flutter/material.dart';
import 'package:houlak/widgets/no_results_widget.dart';
import 'package:spotify/spotify.dart' show Artist;



///Retorna una listview con la info de los artistas (si encuentra)
class ArtistSuggestion extends StatelessWidget {
  final List<Artist> artists;

  ArtistSuggestion(this.artists);

  @override
  Widget build(BuildContext context) {
    if (artists.isEmpty) {
      return NoResults();
    } else {
      return ListView.builder(
        itemCount: artists.length,
        itemBuilder: (BuildContext context, int index) {
          Artist art = artists[index];
          return ListTile(
            leading: Container(
              height: 50,
              width: 50,
               child: art.images!.isNotEmpty ? Image.network(art.images!.first.url!) : Container()
            ),
            title: Text(art.name!),
            onTap: () => artistaSeleccionado(art.id!),
          );
        },
      );
    }
  }


  void artistaSeleccionado (String idArtist){
    //pasar la info del artista al bloc y cargarla en la siguiente pantalla

  }
}
