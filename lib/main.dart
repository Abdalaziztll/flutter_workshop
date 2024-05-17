import 'package:clean_serive_layer/bloc/project_management_bloc.dart';
import 'package:clean_serive_layer/core/data/project_service/project_serivce.dart';
import 'package:clean_serive_layer/core/model/error_handler/base_model.dart';
import 'package:clean_serive_layer/core/model/reesponse/projrect_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const DummyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProjectManagementBloc()..add(GetAllProject()),
        child: Builder(builder: (context) {
          return Scaffold(
            body: BlocBuilder<ProjectManagementBloc, ProjectManagementState>(
              builder: (context, state) {
                if (state is SuccessFetchProject) {
                  return ListView.builder(
                    itemCount: state.listOfProject.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.listOfProject[index].name),
                    ),
                  );
                } else if (state is OfflineState) {
                  return Center(
                    child: Text(state.Messge),
                  );
                } else if (state is ErrorState) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          );
        }),
      ),
    );
  }
}

class DummyApp extends StatelessWidget {
  const DummyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ReallyDummyAppo(),
    );
  }
}

class ReallyDummyAppo extends StatelessWidget {
  ReallyDummyAppo({
    super.key,
  });

  ValueNotifier<ListOf<ProjectResponseModel>> project =
      ValueNotifier(ListOf(project: []));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Expanded(
                flex: 1,
                child: ElevatedButton(
                    onPressed: () async {
                      ResutlModel result = await ProjectServiceImp().getProject();
                      if (result is ListOf<ProjectResponseModel>) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Success To Fetch data"),
                          backgroundColor: Colors.green,
                        ));
                
                        project.value = result;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(" not Success To Fetch data"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    child: Text('Hello Dummy')),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: project,
              builder: (context, value, child) {
                return Expanded(
                  flex: 10,
                  child: ListView.builder(
                    itemCount: value.project.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(value.project[index].name),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
