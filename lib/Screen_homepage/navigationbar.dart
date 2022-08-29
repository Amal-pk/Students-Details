// import 'package:flutter/material.dart';
// import 'package:students/home/home_page.dart';
// import 'package:students/home/student_list/list_student_widget.dart';
// import 'package:students/Screen_homepage/search_screen.dart';
// import 'package:students/core/colors.dart';
// import 'package:students/db/db%20function/data_function.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _currentSelectedIndex = 0;
//   final _pages = [
//     AddDetails(),
//     ScreenSearch(),
//     const ListStudentWidget(),
//   ];
//   final List<String> appTitle = [
//     'Home',
//     'Search',
//     'Students Details',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: _pages[_currentSelectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentSelectedIndex,
//           backgroundColor: Colors.transparent,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.blueGrey,
//           elevation: 0,
//           type: BottomNavigationBarType.fixed,
//           onTap: (newindex) {
//             setState(() {
//               _currentSelectedIndex = newindex;
//               getAllStudents();
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//             BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//             BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List')
//           ]),
//     );
//   }
// }
