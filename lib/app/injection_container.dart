import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_to_do/app/injection_container.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init();
}
