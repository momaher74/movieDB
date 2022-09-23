import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listenerrrr/component/widgets/viewalltrendwidget.dart';

import '../../cubit/app_cubit.dart';
import '../constants/constant.dart';

class TrendingWidget extends StatelessWidget {
  const TrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    var textTheme = Theme.of(context).textTheme;
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {

      },
      builder: (context , state){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Trending Now",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Spacer(),
                TextButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AllTrendingWidget()));
                }, child: const Text("view all",style: TextStyle(color: Colors.blue , fontSize: 18) ,))
              ],
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
              condition: cubit.trendModel != null,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      var trendItem = cubit.trendModel!.results![index];
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
                                      imgPath + trendItem.posterPath.toString(),
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
                                          trendItem.voteAverage.toString().substring(0,3),
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
                                  trendItem.title.toString(),
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
                    itemCount: cubit.trendModel!.results!.length,
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
