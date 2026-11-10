import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../repositories/secure_storage_service.dart';
import '../repositories/user_repository.dart';
import '../repositories/user_repository_impl.dart';
import '../repositories/post_repository.dart';
import '../repositories/post_repository_impl.dart';

class DependencyInjector {
  DependencyInjector._();
  static final DependencyInjector instance = DependencyInjector._();

  late final ApiService apiService = ApiService();
  late final SecureStorageService storageService = SecureStorageService();
  late final UserRepository userRepository = UserRepositoryImpl(apiService: apiService);
  late final PostRepository postRepository = PostRepositoryImpl(apiService: apiService);
}

class DependencyScope extends InheritedWidget {
  final DependencyInjector injector;
  const DependencyScope({super.key, required this.injector, required super.child});

  static DependencyInjector of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DependencyScope>()!.injector;
  }
  @override
  bool updateShouldNotify(DependencyScope oldWidget) => injector != oldWidget.injector;
}