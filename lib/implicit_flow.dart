// import 'package:flutter/material.dart';
// import 'package:oauth2_client/oauth2_helper.dart';
// import 'package:oauth2_client/google_oauth2_client.dart';

// class ImplicitFlowScreen extends StatefulWidget {
//   @override
//   _ImplicitFlowScreenState createState() => _ImplicitFlowScreenState();
// }

// class _ImplicitFlowScreenState extends State<ImplicitFlowScreen> {
//   OAuth2Helper _oauth2Helper;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _oauth2Helper = GoogleOAuth2Client(
//       redirectUri: 'com.googleusercontent.apps.1234567890-abcdefg:/oauth2redirect',
//       customUriScheme: 'com.googleusercontent.apps.1234567890-abcdefg',
//       clientId: '1234567890-abcdefg.apps.googleusercontent.com',
//       scopes: ['email', 'profile'],
//       accessTokenUrl: 'https://accounts.google.com/o/oauth2/auth',
//       authorizationUrl: 'https://accounts.google.com/o/oauth2/auth',
//       tokenUrl: 'https://accounts.google.com/o/oauth2/token',
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Implicit Flow'),
//       ),
//       body: Center(
//         child: _isLoading
//             ? CircularProgressIndicator()
//             : ElevatedButton(
//                 onPressed: () async {
//                   setState(() {
//                     _isLoading = true;
//                   });
//                   await _oauth2Helper.getToken();
//                   setState(() {
//                     _isLoading = false;
//                   });
//                 },
//                 child: Text('Authorize'),
//               ),
//       ),
//     );
//   }
// }