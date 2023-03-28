// // ignore_for_file: avoid_print


// import 'package:oauth2/oauth2.dart' as oauth2;

// Future<void> main() async {
// // This URL is an endpoint that's provided by the authorization server. It's
// // usually included in the server's documentation of its OAuth2 API.
//   final authorizationEndpoint =
//       Uri.parse('http://localhost:5001/connect/token');

// // The OAuth2 specification expects a client's identifier and secret
// // to be sent when using the client credentials grant.
// //
// // Because the client credentials grant is not inherently associated with a user,
// // it is up to the server in question whether the returned token allows limited
// // API access.
// //
// // Either way, you must provide both a client identifier and a client secret:
//   const identifier = 'client_credentials';
//   const secret = 'client_secret';
//   const scopes = ['client_credential'];

// // Calling the top-level `clientCredentialsGrant` function will return a
// // [Client] instead.
//   var client = await oauth2.clientCredentialsGrant(
//     authorizationEndpoint,
//     identifier,
//     secret,
//     scopes: scopes,
//   );

// // With an authenticated client, you can make requests, and the `Bearer` token
// // returned by the server during the client credentials grant will be attached
// // to any request you make.
//   // var response = await client.read(Uri.parse('http://localhost:5196'));

// // You can save the client's credentials, which consists of an access token, and
// // potentially a refresh token and expiry date, to a file. This way, subsequent runs
// // do not need to reauthenticate, and you can avoid saving the client identifier and
// // secret.
//   print(client.credentials.toJson());
// }
