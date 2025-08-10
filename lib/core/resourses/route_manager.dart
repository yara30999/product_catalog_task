import 'package:go_router/go_router.dart';
import 'package:products_app/features/00_intro_screens/presentation/onboarding_screen.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/products_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => OnboardingScreen()),
    GoRoute(path: '/products', builder: (context, state) => ProductsScreen()),
  ],
);
