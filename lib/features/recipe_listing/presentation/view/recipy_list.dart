// import 'package:flutter/material.dart';

// class RecipeList extends StatefulWidget {
//   @override
//   _RecipeListState createState() => _RecipeListState();
// }

// class _RecipeListState extends State<RecipeList> {
//   final List<Map<String, String>> recipes = List.generate(20, (index) {
//     return {
//       'name': 'Recipe ${index + 1}',
//       'description': 'This is the description for recipe ${index + 1}.',
//     };
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recipe List'),
//       ),
//       body: ListView.builder(
//         itemCount: recipes.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Image.network(
//               'https://via.placeholder.com/150',
//               width: 50,
//               height: 50,
//               fit: BoxFit.cover,
//             ),
//             title: Text(recipes[index]['name']!),
//             subtitle: Text(recipes[index]['description']!),
//           );
//         },
//       ),
//     );
//   }
// }
