import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listenerrrr/models/collectionsmodel.dart';
import 'package:listenerrrr/models/discovermodel.dart';
import 'package:listenerrrr/models/searchcollection.dart';
import 'package:listenerrrr/models/searchmovie.dart';
import 'package:listenerrrr/models/searchperson.dart';
import 'package:listenerrrr/models/trendmodel.dart';
import 'package:listenerrrr/network/remote.dart';
import 'package:meta/meta.dart';

import '../models/topratedmodel.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  TopRatedModel? topRatedModel;

  void getTopRated() {
    emit(GetTopRatedLoadingState());
    DioHelper.getData(url: "movie/top_rated", query: {
      "api_key": "e7ab8828e10d222536f4db0486b578ac",
      "language": "en-US",
      "page": "1"
    }).then((value) {
      topRatedModel = TopRatedModel.fromJson(value.data);
      // print(imgPath+topRatedModel!.results[0].backdropPath.toString());
      emit(GetTopRatedSuccessState());
    }).catchError((error) {
      print("error");
      emit(GetTopRatedErrorState());
    });
  }

  TrendModel? trendModel;

  void getTrendRated() {
    emit(GetTopTrendLoadingState());
    DioHelper.getData(url: "trending/all/day", query: {
      "api_key": "e7ab8828e10d222536f4db0486b578ac",
    }).then((value) {
      trendModel = TrendModel.fromJson(value.data);
      // print(value.data);
      // print(trendModel!.results![2].title);
      emit(GetTopTrendSuccessState());
    }).catchError((error) {
      print("error" + error.toString());
      emit(GetTopTrendErrorState());
    });
  }

  DiscoverModel? discoverModel;

  void discover() {
    emit(GetDiscoverLoadingState());
    DioHelper.getData(url: "discover/movie", query: {
      "api_key": "e7ab8828e10d222536f4db0486b578ac",
      "language": "en-US",
      "sort_by": "popularity.desc",
      "include_adult": "true",
      "include_video": "false",
      "page": "1",
      "with_watch_monetization_types": "flatrate",
    }).then((value) {
      discoverModel = DiscoverModel.fromJson(value.data);

      emit(GetDiscoverSuccessState());
    }).catchError((error) {
      print("error" + error.toString());
      emit(GetDiscoverErrorState());
    });
  }

  CollectionsModel? collectionsModel;
  List searchResults = [];

  void getCollections() {
    emit(GetCollectionsLoadingState());
    DioHelper.getData(url: "collection/10", query: {
      "api_key": "e7ab8828e10d222536f4db0486b578ac",
      "language": "en-US",
    }).then((value) {
      collectionsModel = CollectionsModel.fromJson(value.data);

      emit(GetCollectionsSuccessState());
    }).catchError((error) {
      print("error" + error.toString());
      emit(GetCollectionsErrorState());
    });
  }

  SearchCollection? searchCollection;

  void searchForCollection({required String name}) {
    emit(SearchCollectionsLoadingState());
    DioHelper.getData(url: "collection/10", query: {
      "api_key": "e7ab8828e10d222536f4db0486b578ac",
      "language": "en-US",
      "query": name,
      "page": 1,
    }).then((value) {
      collectionsModel = CollectionsModel.fromJson(value.data);

      emit(SearchCollectionsSuccessState());
    }).catchError((error) {
      print("error" + error.toString());
      emit(SearchCollectionsErrorState());
    });
  }

  SearchMovie? searchMovie;

  void searchForMovie({required String name}) {
    emit(SearchMovieLoadingState());
    DioHelper.getData(url: "search/movie", query: {
      "api_key": "e7ab8828e10d222536f4db0486b578ac",
      "language": "en-US",
      "query": name,
      "page": "1",
      "include_adult": "false",
    }).then((value) {
      searchMovie = SearchMovie.fromJson(value.data);

      emit(SearchMovieSuccessState());
    }).catchError((error) {
      print("error" + error.toString());
      emit(SearchMovieErrorState());
    });
  }

  SearchPerson? searchPerson;

  void searchForPerson({required String name}) {
    emit(SearchMovieLoadingState());
    DioHelper.getData(url: "search/movie", query: {
      "api_key": "e7ab8828e10d222536f4db0486b578ac",
      "language": "en-US",
      "query": name,
      "page": "1",
      "include_adult": "false",
    }).then((value) {
      searchPerson = SearchPerson.fromJson(value.data);

      emit(SearchMovieSuccessState());
    }).catchError((error) {
      print("error" + error.toString());
      emit(SearchMovieErrorState());
    });
  }
}
