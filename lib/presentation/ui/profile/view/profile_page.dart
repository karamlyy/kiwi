import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/presentation/components/appbar/primary_app_bar.dart';
import 'package:kiwi/presentation/ui/profile/cubit/profile_cubit.dart';
import 'package:kiwi/presentation/ui/profile/provider/profile_provider.dart';
import 'package:kiwi/presentation/ui/profile/view/profile_body.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
        appBar: PrimaryAppBar(context, titleText: "Profile"),
        body: ChangeNotifierProvider(
          create: (_) => ProfileProvider(),
          child: const ProfileBody(),
        ),
      ),
    );
  }
}
