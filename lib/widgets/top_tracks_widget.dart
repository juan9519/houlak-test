import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houlak/bloc/artist/artist_bloc.dart';
import 'package:houlak/bloc/player/player_bloc.dart';
import 'package:houlak/widgets/category_container_widget.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/spotify.dart' show Track;

class TopTracks extends StatefulWidget {
  final BuildContext context;

  const TopTracks({required this.context});

  @override
  State<TopTracks> createState() => _TopTracksState();
}

class _TopTracksState extends State<TopTracks> {
  var _player = AudioPlayer();

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArtistBloc, ArtistState>(
      builder: (context, state) {
        List<Track> topList = state.topTracks;

        return topList.isEmpty
            ? const Center(
                child: Text("No se encontraron las canciones más escuchadas"))
            : Column(
                children: [
                  const CategoryContainer(title: "Canciones más escuchadas"),
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: topList.length > 5 ? 5 : topList.length ,
                    itemBuilder: (BuildContext context, int index) {
                      final track = topList[index];
                      return TopTrackElement(track: track, player: _player);
                    },
                  ),
                ],
              );
      },
    );
  }
}

class TopTrackElement extends StatelessWidget {
  const TopTrackElement({required this.track, required this.player});

  final Track track;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
              leading: Image.network(track.album!.images!.first.url!),
              title: Text(track.name!)),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, top: 10),
          alignment: Alignment.centerLeft,
          child: playPreviewButton(context),
        )
      ],
    );
  }

  Container playPreviewButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25)),
      child: IconButton(
        icon: const Icon(Icons.play_arrow),
        color: Colors.white,
        onPressed: () {
          PlayerBloc pBloc = BlocProvider.of<PlayerBloc>(context);
          pBloc.add(OnSetCurrentTrack(track));

          track.previewUrl == null
              ? ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("No hay preview disponible")))
              : playPreview(context, track, player);
        },
      ),
    );
  }

  playPreview(BuildContext context, Track track, AudioPlayer player) async {
    final _url = track.previewUrl;
    PlayerBloc pBloc = BlocProvider.of<PlayerBloc>(context);

    if (pBloc.state.currentTrack == track && player.playing) {
      await player.stop();
    } else {
      await player.stop();
      await player.setUrl(_url!);

      await player.play();
    }
  }
}
