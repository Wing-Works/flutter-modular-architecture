import 'package:injectable/injectable.dart';

enum Flavor { uat, cug, prod }

@singleton
class Environment {
  Flavor _flavor;

  Environment() : _flavor = Flavor.uat;
  Flavor get flavor => _flavor;

  void setFlavor(Flavor flavor) {
    _flavor = flavor;
  }
}
