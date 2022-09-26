import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listenerrrr/component/constants/constant.dart';

import '../../cubit/app_cubit.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({
    Key? key,
    required this.profileImg,
    required this.coverImg,
    required this.date,
    required this.rate,
    required this.overview,
    required this.title,
    required this.adualt,
  }) : super(key: key);
  String coverImg;

  String date;
  String rate;
  bool adualt;

  String title;

  String overview;

  String profileImg;

  @override
  Widget build(BuildContext context) {
    // var cubit = AppCubit.get(context);
    var textTheme = Theme.of(context).textTheme;
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            title: Text(
              title,
              style: textTheme.titleLarge,
            ),
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    alignment: const Alignment(0, 1.8),
                    children: [
                      Image(
                        image: NetworkImage(imgPath + coverImg),
                        width: double.infinity,
                        height: 300,
                        // fit: BoxFit.cover,
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(imgPath + profileImg),
                        radius: 70,
                      ),
                    ],
                  ),
                  if (adualt == true)
                    Container(
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                        ),
                        child: const Text(
                          "adult",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ))
                ],
              ),
              const SizedBox(
                height: 75,
              ),
              Text(
                title,
                style: textTheme.titleLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                date,
                style: textTheme.subtitle1,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(rate),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Summary : ",
                      style: textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      overview,
                      style: textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
