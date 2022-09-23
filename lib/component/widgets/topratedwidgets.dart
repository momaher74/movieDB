import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/app_cubit.dart';
import '../constants/constant.dart';

class TopRatedWidget extends StatelessWidget {
  const TopRatedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    var textTheme = Theme.of(context).textTheme;
    return BlocConsumer<AppCubit,AppState>(listener: (BuildContext context, state) {  }, builder: (BuildContext context, Object? state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "Top Rating ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          ConditionalBuilder(
            fallback: (BuildContext context) => const Center(
              child: LinearProgressIndicator(
                color: Colors.black,
                backgroundColor: Colors.grey,
              ),
            ),
            condition: cubit.topRatedModel != null,
            builder: (BuildContext context) {
              return SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    var topRatedItem = cubit.topRatedModel!.results[index];
                    return SizedBox(
                      width: 200,
                      height: 300,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    imgPath + topRatedItem.posterPath.toString(),
                                  ),
                                  width: 200,
                                  height: 220,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  margin: const EdgeInsets.all(5),
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text(
                                        topRatedItem.voteAverage.toString(),
                                        style: textTheme.subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Expanded(
                              child: Text(
                                topRatedItem.title,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.topRatedModel!.results.length,
                ),
              );
            },
          ),
        ],
      ) ;
    },

    );
  }
}
