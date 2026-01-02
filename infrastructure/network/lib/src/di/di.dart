import 'package:injectable/injectable.dart';

@InjectableInit.microPackage(ignoreUnregisteredTypesInPackages: ['database'])
void initMicroPackage() {}
