enum AppRouteEnum {
  homeView,
  menuDetailView,
  menuFavoriteView
}

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch(this){
      case AppRouteEnum.homeView:
        return "/home_view";
      case AppRouteEnum.menuDetailView:
        return "/menu_detail_view";
      case AppRouteEnum.menuFavoriteView:
        return "/menu_favorite_view";
      default:
        return "/hom_view";
    }
  }
}