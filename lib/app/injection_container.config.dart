// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_to_do/data/local_data_source.dart' as _i3;
import 'package:my_to_do/features/home/cubit/home_cubit.dart' as _i5;
import 'package:my_to_do/repositories/local_repository.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.LocalDataSource>(() => _i3.LocalDataSource());
    gh.factory<_i4.LocalRepository>(
        () => _i4.LocalRepository(localDataSources: gh<_i3.LocalDataSource>()));
    gh.factory<_i5.HomeCubit>(
        () => _i5.HomeCubit(localRepository: gh<_i4.LocalRepository>()));
    return this;
  }
}
