import 'package:flutter/material.dart';
import 'package:flutter_task/data/model/hive_model/cat_holder.dart';
import 'package:flutter_task/data/source/local/hive/hive_helper.dart';
import 'package:flutter_task/presenter/pages/main/bloc/main_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/utils/status.dart';
import 'package:flutter_task/utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final bloc = MainBloc();

  @override
  void initState() {
    bloc.add(MainLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Facts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, 'history');
          }, icon: const Icon(Icons.access_time))
        ],
        backgroundColor: Colors.amberAccent,
      ),
      body: BlocProvider.value(
        value: bloc,
        child: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if(state.status == Status.loading){
              return const Center(child: CircularProgressIndicator());
            }else if(state.status == Status.success) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network(state.img ?? "",
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('${state.fact?.text}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500), textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text(getCurrentFormattedDate(state.fact?.createdAt ?? ""), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        bloc.add(MainLoadEvent());
                      },
                      child: const Text('New Fact'))
                ],
              );
            }else {
              return Center(child: Text(state.message ?? "Something error!"));
            }
          },
        ),
      ),
    );
  }
}
