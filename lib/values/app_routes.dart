enum AppRoutes {
  splash,
  homeTab,
  home,
}

extension AppRoutesX on AppRoutes {
  String get routers {
    return "/$name";
  }
}
