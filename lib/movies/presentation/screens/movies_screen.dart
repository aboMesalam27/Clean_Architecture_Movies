import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:osama_elgendy_movies/movies/presentation/componants/now_playing_components.dart';
import 'package:osama_elgendy_movies/movies/presentation/componants/popular_components.dart';
import 'package:osama_elgendy_movies/movies/presentation/componants/top_rated_components.dart';
import 'package:osama_elgendy_movies/movies/presentation/controller/movie/movies_bloc.dart';
import '../../../core/services/services_loactor.dart';
import '../controller/movie/movies_events.dart';
import '../widgets/popular_head_line.dart';
import '../widgets/top_rated_head_line.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MoviesBloc>()
        ..add(GetNowPlayingMovieEvent())
        ..add(GetPopularMovieEvent())
        ..add(GetTopRatedMovieEvent()),
      child: Scaffold(
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              NowPlayingComponents(),
              PopularHeadLine(),
              PopularComponents(),
              TopRatedHeadLine(),
              TopRatedComponents(),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}




