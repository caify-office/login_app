// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:openid_client/openid_client.dart';
// import 'openid_io.dart';

// const keycloakUri = 'http://localhost:5001';
// const scopes = ['profile'];

// Credential? credential;

// late final Client client;

// Future<Client> getClient() async {
//   var uri = Uri.parse(keycloakUri);
//   if (!kIsWeb && Platform.isAndroid) uri = uri.replace(host: '10.0.2.2');
//   const clientId = 'flutter_app';
//   const clientSecrect = 'client secret';

//   var issuer = await Issuer.discover(uri);
//   return Client(issuer, clientId, clientSecret: clientSecrect);
// }

// Future<void> main() async {
//   client = await getClient();
//   credential = await getRedirectResult(client, scopes: scopes);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'openid_client demo',
//       home: MyHomePage(title: 'openid_client Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   UserInfo? userInfo;

//   @override
//   void initState() {
//     if (credential != null) {
//       credential!.getUserInfo().then((userInfo) {
//         setState(() {
//           this.userInfo = userInfo;
//         });
//       });
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (userInfo != null) ...[
//               Text('Hello ${userInfo!.name}'),
//               Text(userInfo!.email ?? ''),
//               OutlinedButton(
//                   child: const Text('Logout'),
//                   onPressed: () async {
//                     setState(() {
//                       userInfo = null;
//                     });
//                   })
//             ],
//             if (userInfo == null)
//               OutlinedButton(
//                 child: const Text('Login'),
//                 onPressed: () async {
//                   var credential = await authenticate(client, scopes: scopes);
//                   var userInfo = await credential.getUserInfo();
//                   setState(
//                     () {
//                       this.userInfo = userInfo;
//                     },
//                   );
//                 },
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String authEndpoint = 'http://10.0.2.2:5001/connect/authorize';
  final String redirectUri = 'http://10.0.2.2:4000/signin-oidc';
  final String tokenUrl = 'http://10.0.2.2:5001/connect/token';
  final String clientId = 'flutter_app';
  final List<String> scopes = ['implicita'];

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OAuth2 Implicit Flow Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OAuth2 Implicit Flow Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text('Authorize'),
            onPressed: () async {
              // 创建OAuth2帮助器实例
              final oauth2 = OAuth2Helper(
                OAuth2Client(
                  authorizeUrl: authEndpoint,
                  redirectUri: redirectUri,
                  tokenUrl: tokenUrl,
                  customUriScheme: 'com.flutter.app',
                ),
                clientId: clientId,
                scopes: scopes,
                grantType: OAuth2Helper.implicitGrant,
              );

              // 启动授权流程
              final token = await oauth2.getToken();

              // 处理授权结果
              if (token?.httpStatusCode == 200) {
                final accessToken = token?.accessToken ?? '';
                print(accessToken);
                // 使用访问令牌调用API
                // final apiEndpoint = 'https://example.com/api';
                // final headers = {'Authorization': 'Bearer $accessToken'};
                // final response = await http.get(apiEndpoint, headers: headers);
                // // 处理API响应
                // print(response.body);
              } else {
                // 处理授权失败
                print('access failure');
                // print(token.errorDescription);
              }
            },
          ),
        ),
      ),
    );
  }
}
