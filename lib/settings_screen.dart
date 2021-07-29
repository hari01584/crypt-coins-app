import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var value = true;

    return SettingsList(
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
                switchValue: true,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Notifications',
            tiles: [
              SettingsTile.switchTile(
                title: 'New News Notification',
                leading: Icon(Icons.dehaze),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Push Notifications',
                leading: Icon(Icons.circle_notifications),
                switchValue: true,
                onToggle: (bool value) {},
              ),
              SettingsTile.switchTile(
                title: 'Notification Vibration',
                leading: Icon(Icons.vibration),
                switchValue: value,
                onToggle: (bool value) { value=false; },
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
      );
  }
}
