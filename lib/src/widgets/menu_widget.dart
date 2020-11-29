import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              alignment: Alignment.center,
              child: Text('Logo de la Empresa',
                  style: TextStyle(color: Colors.white, fontSize: 26.0)),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/menu-img.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, 'home'),
            // onTap: () => Navigator.pushReplacementNamed(context, 'home'),
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag, color: Colors.blue),
            title: Text('Products'),
            onTap: () => Navigator.pushReplacementNamed(context, 'productos'),
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.blue),
            title: Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('Settings'),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, SettingsPage.routeName);
              // Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
          Container(
            padding: EdgeInsets.only(top: size.height * 0.51),
            child: ListTile(
              leading: Icon(Icons.logout, color: Colors.blue),
              title: Text('Log out'),
              onTap: () {
                // Navigator.pop(context);
                // Navigator.pushNamed(context, SettingsPage.routeName);
                // Navigator.pushReplacementNamed(context, SettingsPage.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}
