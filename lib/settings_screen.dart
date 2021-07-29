import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  bool a = true;
  bool b = true;
  bool c = true;
  bool d = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SettingsList(
        sections: [
          SettingsSection(
            title: 'Basics',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Show More Data',
                leading: Icon(Icons.show_chart),
                switchValue: a,
                onToggle: (value) {
                  setState(() {
                    a = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Notifications',
            tiles: [
              SettingsTile.switchTile(
                title: 'New News Notification',
                leading: Icon(Icons.dehaze),
                switchValue: b,
                onToggle: (bool value) {
                  setState(() {
                    b = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Push Notifications',
                leading: Icon(Icons.circle_notifications),
                switchValue: c,
                onToggle: (bool value) {
                  setState(() {
                    setState(() {
                      c = value;
                    });
                  });
                },
              ),
              SettingsTile.switchTile(
                title: 'Notification Vibration',
                leading: Icon(Icons.vibration),
                switchValue: d,
                onToggle: (bool value) {
                  setState(() {
                    d = value;
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Contact US',
            tiles: [
              SettingsTile(title: 'Whatsapp Us', leading: Icon(Icons.message)),
              SettingsTile(title: 'Email Us', leading: Icon(Icons.email)),
              SettingsTile(title: 'See Website', leading: Icon(Icons.web)),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          ),
        ],
      ),
    );
  }
}
