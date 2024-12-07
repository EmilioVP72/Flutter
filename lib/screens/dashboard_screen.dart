import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:tap_2/settings/global_values.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TAP Ago-Dic 2024', 
          style: TextStyle(fontFamily: 'halo'),
        ),
      ),
      drawer: myDrawer(context),
    );
  }

  Widget myDrawer(context){
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('Challenge_images/cortana.png'),
            ),
            accountName: Text('Emilio Francisco Vazquez Perez'), 
            accountEmail: Text('emilio.vazpe@gmail.com')
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, '/challenge');
            },
            title: const Text('Practica 1'),
            subtitle: const Text('Challenge'),
            leading: const Icon(Icons.code),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/movies'),
            title: const Text('Popular Movies'),
            subtitle: const Text('Test API'),
            leading: const Icon(Icons.movie),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: (){
              Navigator.pop(context);
              Navigator.pop(context);
            },
            title: const Text('Salir'),
            leading: const Icon(Icons.exit_to_app),
            trailing: const Icon(Icons.chevron_right),
          ),
          DayNightSwitcher(
            isDarkModeEnabled: GlobalValues.banThemeDark.value, 
            onStateChanged: (isDarkModeEnabled) {
              GlobalValues.banThemeDark.value = isDarkModeEnabled;
              
            },
          )

        ],
      ),
    );
  }
}