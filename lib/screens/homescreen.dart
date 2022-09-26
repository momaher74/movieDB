import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listenerrrr/component/widgets/topratedwidgets.dart';
import 'package:listenerrrr/component/widgets/trendwidget.dart';
import 'package:listenerrrr/cubit/app_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // var cubit = AppCubit.get(context);
    // var textTheme = Theme.of(context).textTheme;

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Movie DB",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TopRatedWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  TrendingWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
