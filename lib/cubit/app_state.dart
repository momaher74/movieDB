part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class GetTopRatedLoadingState extends AppState {}

class GetTopRatedSuccessState extends AppState {}

class GetTopRatedErrorState extends AppState {}

class GetTopTrendLoadingState extends AppState {}

class GetTopTrendSuccessState extends AppState {}

class GetTopTrendErrorState extends AppState {}

class GetDiscoverLoadingState extends AppState {}

class GetDiscoverSuccessState extends AppState {}

class GetDiscoverErrorState extends AppState {}

class GetCollectionsLoadingState extends AppState {}

class GetCollectionsSuccessState extends AppState {}

class GetCollectionsErrorState extends AppState {}

class SearchCollectionsLoadingState extends AppState {}

class SearchCollectionsSuccessState extends AppState {}

class SearchCollectionsErrorState extends AppState {}

class SearchMovieLoadingState extends AppState {}

class SearchMovieSuccessState extends AppState {}

class SearchMovieErrorState extends AppState {}
