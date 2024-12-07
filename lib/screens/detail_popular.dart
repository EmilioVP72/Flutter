import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tap_2/models/popular_model.dart';
import 'package:tap_2/network/api_popular.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailPopular extends StatefulWidget {
  const DetailPopular({super.key});

  @override
  State<DetailPopular> createState() => _DetailPopularState();
}

class _DetailPopularState extends State<DetailPopular> {
  YoutubePlayerController? _youtubeController;
  String? trailerUrl;
  String? videoKey;
  bool isVideoAvailable = false;
  List<Map<String, dynamic>> actors = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final popular = ModalRoute.of(context)!.settings.arguments as PopularModel;

    ApiPopular().getActors(popular.id).then((actorList) {
      setState(() {
        actors = actorList;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final popular = ModalRoute.of(context)!.settings.arguments as PopularModel;

    double rating = (popular.voteAverage / 2).clamp(0, 5);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${popular.posterPath}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.4),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        popular.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          shadows: [
                            Shadow(
                              offset: Offset(2, 2),
                              blurRadius: 4.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      RatingBarIndicator(
                        rating: rating,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 25.0,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Calificación: ${popular.voteAverage} / 10',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        popular.overview,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          fontFamily: 'Roboto', 
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FutureBuilder(
                        future: ApiPopular().getTrailer(popular.id),
                        builder: (context, snapshot) {
                          if (snapshot.hasData){
                            _youtubeController = YoutubePlayerController.fromVideoId(videoId: snapshot.data!, autoPlay: false);
                            return YoutubePlayer(
                            controller: _youtubeController!,
                            aspectRatio: 16/9,
                          );
                          }else{
                            if (snapshot.hasError) {
                              return const Center( child: Text("Error vacio"),
                              ) ;
                              
                            }else{
                              return const Center( child: Text("En ejecucion"),
                              );
                          }
                        }
                        }
                      ),
                    ),
                  ),
                  
                  
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Reparto:",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                actors.isNotEmpty
                    ? SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: actors.length,
                          itemBuilder: (context, index) {
                            final actor = actors[index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: actor['profilePath'] !=
                                            null
                                        ? NetworkImage(
                                            'https://image.tmdb.org/t/p/w500/${actor['profilePath']}')
                                        : const AssetImage(
                                                'assets/default_actor.png')
                                            as ImageProvider,
                                  ),
                                  const SizedBox(height: 5),
                                  Container(
                                    color: Colors.black.withOpacity(0.5),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        actor['name'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const Center(
                        child: Text(
                          "Cargando actores...",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
