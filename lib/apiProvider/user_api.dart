import 'dart:convert';
import 'package:http/http.dart' as http;

import '../first_option/data_json/json_convert_photos.dart';
import '../first_option/data_json/json_convert_users.dart';

// рекомендации документации использовать изолят
class UserProvider {
  Future<List<User>> fetchUsers(http.Client client) async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    return parseUsers(response.body);
  }

  List<User> parseUsers(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  Future<List<Photos>> fetchPhotos(http.Client client) async {
    var response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1/photos'));
    return parsePhotos(response.body);
  }

  List<Photos> parsePhotos(String responseBody) {
    final parsed =
        (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();
    return parsed.map<Photos>((json) => Photos.fromJson(json)).toList();
  }
}







// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.title);
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }

//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
