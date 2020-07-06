import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_webapp_demo/model/login_reques_model.dart';
import 'package:new_webapp_demo/model/parent_data_model.dart';
import 'package:new_webapp_demo/screens/students_screen.dart';
import 'package:new_webapp_demo/services/login_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedScreen extends StatefulWidget {
  @override
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  List<Widget> cards = List.generate(2, (i) => CustomCard());
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  SharedPreferences logindata;
  String loginid;
  @override
  void initState() {
    super.initState();
    initial();
    var initalizationSettingsAndriod =
        AndroidInitializationSettings('ic_launcher');

    var initlizationSettingIos = IOSInitializationSettings();

    var initalizationSettings = InitializationSettings(
        initalizationSettingsAndriod, initlizationSettingIos);
    flutterLocalNotificationsPlugin.initialize(initalizationSettings,
        onSelectNotification: onSelectNotificationData);
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  Future<void> onSelectNotificationData(String payload) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('This is notification'),
        content: Text('Payload data is $payload'),
      ),
    );
  }

// push notification pop up
  Future showNotificationWithoutSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        playSound: false, importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Post',
      'How to Show Notification in Flutter',
      platformChannelSpecifics,
      payload: 'No_Sound',
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Push Notifications!!'),
          actions: <Widget>[
            Stack(
              children: [
                IconButton(
                  onPressed: showNotificationWithoutSound,
                  icon: const Icon(Icons.notifications),
                  tooltip: 'Push Notification',
                ),
              ],
            ),
            IconButton(
              onPressed: _onBackPressed,
              icon: const Icon(Icons.power_settings_new),
              tooltip: 'LogOut',
            ),
          ],
        ),
        body: Container(
          child: ListView(
            children: cards,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            NetworkRequest networkrequest = NetworkRequest();
            LoginRequest request = LoginRequest();
            request.loginId = int.parse(logindata.getString('LoginId'));
            request.name = logindata.getString('Name');
            request.status = logindata.getString('Status');
            ParentModel modeldata =
                await networkrequest.getParentDetails(request.loginId);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDataDetails(
                    loginrequest: request,
                    parentModel: modeldata,
                  ),
                ));
          },
          tooltip: "Go to HomePage",
          child: Icon(
            Icons.home,
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () async {
                  logindata.setBool('login', true);
                  SystemNavigator.pop();
                },
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('images/schoologo.png'),
          Padding(
              padding: EdgeInsets.all(7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(Icons.thumb_up),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      'Like',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(Icons.comment),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text('Comments', style: TextStyle(fontSize: 18.0)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(Icons.share),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      'Share',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
