import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_application/bloc_observer.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForCard/NotesCardCubit/notes_card_cubit.dart';
import 'package:notes_application/cubits/NoteForHomePage/NotesCubit/notes_cubit.dart';
import 'package:notes_application/firebase_options.dart';
import 'package:notes_application/models/container_item_model.dart';
import 'package:notes_application/views/home_page.dart';
import 'package:notes_application/views/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_application/views/registeration_page.dart';
import 'package:notes_application/views/splash_screen.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(ContainerItemModelAdapter());
  await Hive.openBox<ContainerItemModel>(NoteBox1);
  await Hive.openBox<ContainerItemModel>(NoteBox2);
  Bloc.observer = MyBlocObserver();

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});
  @override
  Widget build(BuildContext conetxt) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (conetxt) => NotesCubit()),
        BlocProvider(create: (conetxt) => NotesCardCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: black,
            fontFamily: 'Lufga',
            brightness: Brightness.dark),
        home: const SplashView(),
        routes: {
          'LoginPage': (context) {
            return const LoginPage();
          },
          'RegisterPage': (conetxt) {
            return const RegisterPage();
          },
          'HomePage': (context) => const HomePage(),
        },
      ),
    );
  }
}



// TODO: build your note application 
