import 'package:flutter/widgets.dart';
import 'package:petector_app/Screens/HomeScreen.dart';
import 'package:petector_app/Screens/LoadingScreen.dart';
import 'package:petector_app/Screens/ResultScreen.dart';
import 'package:provider/provider.dart';
import 'AppState.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: Petector(),

    ),
  );
}

class Petector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF1A1B41),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => HomeScreen(),
            );
          case "/result":
            return PageRouteBuilder(
                pageBuilder:(_, __, ___) => ResultScreen(), );
          case '/loading':
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoadingScreen(),
            );
          default:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => Center(
                child: Text(
                  '404 Not Found',
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
        }
      },
    );
  }
}
