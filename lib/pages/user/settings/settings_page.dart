import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/constant/constant.dart';
import 'package:learning_app/common/logs/logger.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/common/widgets/common_widget.dart';
import 'package:learning_app/global/global.dart';
import 'package:learning_app/pages/user/settings/bloc/settings_bloc.dart';
import 'package:learning_app/pages/user/settings/widgets/settings_widget.dart';

import 'bloc/settings_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void logout() {
    //remove user data
    Global.storageService
        .remove(AppConstant.STORAGE_USER_PROFILE_KEY)
        .whenComplete(() {
      logger.wtf("logged out!!");
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSettingsAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  buildIconButton(
                    "Log out",
                    icon: Icons.logout,
                    iconColor: Colors.black,
                    onTap: () {
                      buildShowDialog(
                        context,
                        onLogout: logout,
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
