import 'package:go_router/go_router.dart';
import 'package:products_app/features/00_intro_screens/presentation/onboarding_screen.dart';
import 'package:products_app/features/01_home_screens/domain/product_entity.dart';
import 'package:products_app/features/01_home_screens/presentation/product_details_screen/view/product_details_screen.dart';
import 'package:products_app/features/01_home_screens/presentation/product_screen/view/products_screen.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => OnboardingScreen()),
    // GoRoute(path: '/products', builder: (context, state) => ProductsScreen()),
    GoRoute(
      path: '/products',
      builder: (context, state) => const ProductsScreen(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) {
            final product = state.extra as ProductEntity;
            return ProductDetailsScreen(product: product);
          },
        ),
      ],
    ),
  ],
);
