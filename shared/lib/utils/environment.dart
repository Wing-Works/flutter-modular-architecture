import 'package:injectable/injectable.dart';

enum Flavor { uat, cug, prod }

@singleton
class Environment {
  Environment() : _flavor = Flavor.uat;
  Flavor _flavor;
  Flavor get flavor => _flavor;

  void setFlavor(Flavor flavor) {
    _flavor = flavor;
  }
}
