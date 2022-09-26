import 'package:flutter/material.dart';

String imgPath = "http://image.tmdb.org/t/p/w500";

String apiKey = "e7ab8828e10d222536f4db0486b578ac";

String accessToken =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlN2FiODgyOGUxMGQyMjI1MzZmNGRiMDQ4NmI1NzhhYyIsInN1YiI6IjYxNTFlMWVjMTQwYmFkMDAyNTNmYzE5ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lk-grw5_yDEuogVI-AF4m2gRYy12jL4V2rYeP-K5v3M";

String imgUrl =
    "https://img.freepik.com/premium-vector/mosque-logo-template-islamic-concept-design-creative-symbol_487414-2194.jpg";

void push({required BuildContext context, required Widget screen}) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => screen),
  );
}
