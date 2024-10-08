enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'L.I.A.M [DEV]';
      case Flavor.prod:
        return 'L.I.A.M';
      default:
        return 'title';
    }
  }

}
