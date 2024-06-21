import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe/core/common/my_snackbar.dart';
import 'package:recipe/features/home/presentation/viewmodel/home_viewmodel.dart';


class DashboardView extends ConsumerStatefulWidget {
  const DashboardView({super.key});

  @override
  ConsumerState<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends ConsumerState<DashboardView> {
  late bool isDark;
  @override
  void initState() {
    // isDark = ref.read(isDarkThemeProvider);
    isDark = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var batchState = ref.watch(batchViewmodelProvider);
    // var courseState = ref.watch(courseViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard View'),
        actions: [
          IconButton(
            onPressed: () {
              // ref.read(batchViewModelProvider.notifier).getBatches();
              // ref.read(courseViewModelProvider.notifier).getCourses();
              showMySnackBar(message: 'Refressing...');
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              ref.read(homeViewModelProvider.notifier).logout();
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          Switch(
              value: isDark,
              onChanged: (value) {
                setState(() {
                  isDark = value;
                  // ref.read(isDarkThemeProvider.notifier).updateTheme(value);
                });
              }),
        ],
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Column(
      //     children: [
      //       const Align(
      //         alignment: Alignment.centerLeft,
      //         child: Text(
      //           'Batches',
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       // Flexible(
      //       //   child: BatchWidget(ref: ref, batchList: batchState.lstBatches),
      //       // ),
      //       const Align(
      //         alignment: Alignment.centerLeft,
      //         child: Text(
      //           'Courses',
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //       // Flexible(
      //       //   child: CourseWidget(courseList: courseState.lstCourses),
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
