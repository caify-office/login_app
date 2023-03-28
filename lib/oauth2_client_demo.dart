// ignore_for_file: avoid_print

import 'package:oauth2_client/oauth2_client.dart';
import 'package:oauth2_client/oauth2_helper.dart';

class Oauth2ClientExample {
  Oauth2ClientExample();

  Future<void> fetchFiles() async {
    var hlp = OAuth2Helper(
      OAuth2Client(
        authorizeUrl: 'http://10.0.2.2:5001/connect/authorize',
        tokenUrl: 'http://10.0.2.2:5001/connect/token',
        redirectUri: 'http://10.0.2.2:5001/signin-oid',
        customUriScheme: 'com.implicit.app',
      ),
      grantType: OAuth2Helper.implicitGrant,
      clientId: 'flutter_app',
      clientSecret: 'client secret',
      scopes: ['profile'],
    );

    var resp = await hlp.get('http://10.0.2.2:5001');

    print(resp.body);
  }
}
