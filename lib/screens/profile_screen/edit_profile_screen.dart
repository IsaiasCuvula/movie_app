import 'package:flutter/material.dart';
import 'package:movie_app/utils/helpers.dart';
import 'package:movie_app/widgets/text_field_container.dart';
import 'package:provider/provider.dart';

import '../../models/user_model.dart';
import '../../providers/auth_provider.dart';
import '../../utils/constants.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key, required this.user}) : super(key: key);
  final UserModel user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late AuthProvider _authProvider;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _authProvider = Provider.of<AuthProvider>(context, listen: false);
    _nameController.text = widget.user.username;
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Your Profile')),
      body: SingleChildScrollView(
        padding: kPadding20,
        child: Column(
          children: [
            TextFieldContainer(
              child: TextField(
                style: const TextStyle(fontSize: 18.0),
                autocorrect: false,
                keyboardType: TextInputType.name,
                controller: _nameController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: 'Enter your name here',
                  hintStyle: TextStyle(fontSize: 16.0),
                  border: InputBorder.none,
                ),
              ),
            ),
            kVerticalSpace20,
            Consumer<AuthProvider>(
              builder: (ctx, provider, _) {
                final bool isLoading = provider.isLoading;
                return isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () {
                          _updateName(context);
                        },
                        child: const Center(
                          child: Text(
                            'Update',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  void _updateName(BuildContext context) async {
    if (_nameController.text.isNotEmpty) {
      final String name = _nameController.text.trim();
      await _authProvider.updateUsername(name).then((value) {
        _nameController.text = '';
        Helper.snackBar(
          'Username updated Successfully saved',
          context,
        );
        Navigator.pop(context);
        _authProvider.fetchCurrentUserInfo();
      }).catchError((error) {
        Helper.snackBar(error, context);
      });
    } else {
      const String alertTitle = 'Username cannot be empty!';
      const String alertContent =
          'Please try to add a name with at least 4 characters!';
      Helper.snackBar('$alertTitle\n$alertContent', context);
    }
  }
}
