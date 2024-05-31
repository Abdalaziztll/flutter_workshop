import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_session/model/user_model.dart';
import 'package:riverpod_session/providers/connection_notifier.dart';
import 'package:riverpod_session/providers/counter_notifier.dart';
import 'package:riverpod_session/service/user_service.dart';

final nameProvider = Provider<String>(
  (ref) {
    return "Hello Message";
  },
);

final counterStreamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(
    const Duration(seconds: 2),
    (computationCount) => computationCount,
  );
});

final counterProvider = StateProvider<int>((ref) {
  return 0;
});
final serviceProvider = Provider((ref) => UserService());
final userProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.watch(serviceProvider).getUsers();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConnectionStatusPage(),
    );
  }
}
// ! First way to get provider value
// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var name = ref.watch(nameProvider);
//     return Scaffold(
//       body: Center(
//         child: Text(name),
//       ),
//     );
//   }
// }
// ! Second way to get provider value
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer(
              builder: (context, ref, child) {
                var name = ref.watch(nameProvider);
                return Text(name);
              },
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              var counter = ref.watch(counterProvider);
              return Text(counter.toString());
            },
          ),
          Consumer(
            builder: (context, ref, child) => ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: const Text("increase counter"),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              var counter = ref.watch(counterProviderWithStateNotifier);
              return Text(counter.toString());
            },
          ),
          Consumer(
            builder: (context, ref, child) => ElevatedButton(
              onPressed: () {
                // ref.read(counterProvider.notifier).state++;
                ref.read(counterProviderWithStateNotifier.notifier).increamnt();
              },
              child: const Text("increase counter"),
            ),
          ),
        ],
      ),
    );
  }
}

class UsersListPage extends ConsumerWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(userProvider);
    return Scaffold(
      body: user.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("${data[index].firstName} ${data[index].lastName}"),
                leading: Image.network(data[index].image),
                trailing: Text("${data[index].id}"),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class CounterWithStreamPage extends ConsumerWidget {
  const CounterWithStreamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterStreamProvider);
    return Scaffold(
        body: counter.when(
      data: (data) {
        return Center(
          child: Text(data.toString()),
        );
      },
      error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}

final connectionProvider = StateNotifierProvider((ref) => ConnectionNotifier());

class ConnectionStatusPage extends ConsumerWidget {
  const ConnectionStatusPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionStatus = ref.watch(connectionProvider);
    return Scaffold(
      body: connectionStatus == ConnectionStatus.online
          ? Container(
              color: Colors.green,
              child: const Center(
                child: Text("There is internet connection"),
              ),
            )
          : Container(
              color: Colors.red,
              child: const Center(
                child: Text("There is no internet connection"),
              ),
            ),
    );
  }
}
