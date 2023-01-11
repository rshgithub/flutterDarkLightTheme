import 'package:flutter/material.dart';
import 'package:ft_dark_light_ex/theme_provider.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? 'assets/images/light.png'
                  : 'assets/images/dark.png',
              key: Key(Theme.of(context).brightness.toString()),
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            top: 80,
            child: Align(
              alignment: Alignment.topCenter,
              child:
                  Consumer<ThemeProvider>(builder: (context, provider, child) {
                return
                    //   DropdownButton<String>(
                    //   value: provider.currentTheme,
                    //   items: [
                    //     //Light, dark, and system
                    //     DropdownMenuItem<String>(
                    //       value: 'light',
                    //       child: Text(
                    //         'Light',
                    //         style: Theme.of(context).textTheme.headline6,
                    //       ),
                    //     ),
                    //
                    //     DropdownMenuItem<String>(
                    //       value: 'dark',
                    //       child: Text(
                    //         'Dark',
                    //         style: Theme.of(context).textTheme.headline6,
                    //       ),
                    //     ),
                    //   ],
                    //   onChanged: (String? value) {
                    //     provider.changeTheme(value ?? 'light');
                    //   },
                    // );
                    // }
                    LiteRollingSwitch(
                  //initial value
                  value: provider.currentTheme == 'light' ? false : true,
                  textOn: 'light',
                  textOff: 'dark',
                  colorOn: Colors.yellowAccent.shade400,
                  colorOff: Colors.grey,
                  iconOn: Icons.lightbulb,
                  iconOff: Icons.lightbulb_outline,
                  textSize: 16.0,
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    print('Current State of SWITCH IS: $state');
                    provider.changeTheme(state ? 'light' : 'dark');
                  },
                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
