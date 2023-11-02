import 'package:app_maybe/config/theme/app_theme.dart';
import 'package:app_maybe/presentation/providers/chat_provider.dart';
import 'package:app_maybe/presentation/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Random Yes/No App',
        theme: AppTheme(selectedColor: 5).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
