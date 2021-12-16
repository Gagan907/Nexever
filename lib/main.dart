import 'package:flutter/material.dart';
import 'package:nexever_flutter_task/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'provider/task_provider.dart';
import 'package:nexever_flutter_task/utils/di_container.dart' as di;

main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<TaskProvider>()),
    
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      darkTheme: ThemeData.dark(
          
      ),
      home: const HomeScreen(),
    );
  }
}

