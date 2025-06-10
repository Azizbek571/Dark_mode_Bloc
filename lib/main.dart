import 'package:dark_mode_bloc/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit()..setInitialTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.themeData,
          home: const MyHomePage());
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text("Theme Demo")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme(!isDarkMode);
          },
          child: Text(
           isDarkMode ?           "Light Theme": "Dark Theme", style: TextStyle(
            color: isDarkMode ?  Colors.white: Colors.black )),
        ),
      ),
    );
  }
}
