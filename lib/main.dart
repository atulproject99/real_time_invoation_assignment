import 'package:flutter/material.dart';

import 'common/extensions/size_extension.dart';
import 'common/keys/app_keys.dart';
import 'common/theme/app_theme.dart';
import 'modules/add_employee/presentation/cubit/add_employee_cubit.dart';
import 'modules/add_employee/data/helper/db_helper.dart';
import 'modules/edit_employee/presentation/cubit/get_employee_details_cubit.dart';
import 'modules/homepage/presentation/cubit/delete_employee_cubit.dart';
import 'modules/homepage/presentation/cubit/get_employees_cubit.dart';
import 'modules/edit_employee/presentation/cubit/update_employee_cubit.dart';
import 'modules/homepage/presentation/views/home_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize database
  DatabaseHelper.instance.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Sizes.updateSize(MediaQuery.sizeOf(context));

    /// Initialize All Cubits
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AddEmployeeCubit()),
        BlocProvider(create: (_) => GetAllEmployeeCubit()),
        BlocProvider(create: (_) => DeleteEmployeeCubit()),
        BlocProvider(create: (_) => UpdateEmployeeCubit()),
        BlocProvider(create: (_) => GetEmployeeDetailsCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Assignment',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        navigatorKey: AppKeys.navigatorKey,
        scaffoldMessengerKey: AppKeys.scaffoldMessengerKey,
        themeMode: ThemeMode.light,
        builder: (context, widget) {
          return ScrollConfiguration(
            behavior: const _ScrollBehaviorModified(),
            child: widget!,
          );
        },
        home: const HomePageView(),
      ),
    );
  }
}

class _ScrollBehaviorModified extends ScrollBehavior {
  ///Defines scroll behavior for whole app!
  const _ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(
      parent: AlwaysScrollableScrollPhysics(),
    );
  }
}
