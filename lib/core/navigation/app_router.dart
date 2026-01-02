import 'package:flutter/material.dart';
import 'package:flutter_modular_architecture/core/di/di.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/auth_screen.dart';
import 'package:flutter_modular_architecture/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_modular_architecture/src/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_modular_architecture/src/home/presentation/home_screen.dart';

/// Enhanced route generator with better error handling and type safety
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // Guard against null route names
  final routeName = settings.name;
  if (routeName == null) return _buildErrorRoute('Route name is null');

  // Route factory pattern for cleaner code
  try {
    return _buildRoute(routeName, settings.arguments);
  } catch (e) {
    debugPrint('Error generating route for $routeName: $e');
    return _buildErrorRoute('Failed to build route: $routeName');
  }
}

/// Centralized route building logic
Route<dynamic> _buildRoute(String routeName, Object? args) {
  switch (routeName) {
    case AuthScreen.routeName:
      return _createRoute(AuthScreen(getIt<AuthBloc>()));
    case HomeScreen.routeName:
      return _createRoute(HomeScreen(getIt<HomeBloc>()));

    default:
      return _buildErrorRoute('Unknown route: $routeName');
  }
}

/// Helper method to create MaterialPageRoute with consistent configuration
MaterialPageRoute<T> _createRoute<T>(
  Widget page, {
  RouteSettings? settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
}) {
  return MaterialPageRoute<T>(
    builder: (_) => page,
    settings: settings,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
  );
}

/// Error route with visual feedback
Route<dynamic> _buildErrorRoute(String message) {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Error'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Try to navigate back or to home
                },
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
