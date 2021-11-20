import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:houlak/bloc/artist/artist_bloc.dart';
import 'package:houlak/widgets/category_container_widget.dart';
import 'package:houlak/widgets/top_tracks_widget.dart';
import 'package:spotify/spotify.dart' show Artist, Track;

class ArtistDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<ArtistBloc, ArtistState>(
        builder: (context, state) {
          Artist artist = state.artist;
          List<String> genresList = state.artist.genres!;

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 220,
                leading: GoBack(),
                flexibleSpace: Center(
                  child: Center(
                    child: FlexibleSpaceBar(
                        title: artist.name == null
                            ? const Text("Artista")
                            : Text(artist.name!),
                        background: artist.images!.isNotEmpty
                            ? PresentationImage(artist: artist)
                            : Container()),
                  ),
                ),
                backgroundColor: Colors.black,
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([

                  Genres(genresList: genresList),

                  TopTracks(context: context),
                ]),
              )
            ],
          );
        },
      ),
    );
  }
}

///Boton para volver, un poco personalizado para que se vea con cualquier fondo
class GoBack extends StatelessWidget {
  const GoBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25)),
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.popAndPushNamed(context, '/home'),
      ),
    );
  }
}

///Imagen de la sliverappbar
class PresentationImage extends StatelessWidget {
  const PresentationImage({
    Key? key,
    required this.artist,
  }) : super(key: key);

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(fit: StackFit.expand, children: [
        Image.network(artist.images!.first.url!, fit: BoxFit.cover),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [Colors.black87, Colors.transparent]),
          ),
        ),
      ]),
    );
  }
}

class Genres extends StatelessWidget {
  final List<String> genresList;

  Genres({required this.genresList});

  @override
  Widget build(BuildContext context) {
    return genresList.isEmpty
        ? const CategoryContainer(title: "Géneros musicales no disponibles")
        : Column(
            children: [
              const CategoryContainer(title: "Géneros musicales"),
              CarouselSlider.builder(
                options: CarouselOptions(
                    height: 70, viewportFraction: 0.4, autoPlay: true),
                itemCount: genresList.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Card(
                  child: Center(
                    child: Text(genresList[itemIndex].toUpperCase()),
                  ),
                ),
              ),
            ],
          );
  }
}
