import 'package:go_router/go_router.dart';
import 'package:products_app/features/intro_screens/presentation/onboarding_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => OnboardingScreen())],
);
