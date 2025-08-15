import 'package:flutter/material.dart';
import 'main.dart';

class EditProfileSheet extends StatefulWidget {
  final Profile profile;
  final Function(Profile) onSave;

  EditProfileSheet({required this.profile, required this.onSave});

  @override
  _EditProfileSheetState createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<EditProfileSheet> {
  late TextEditingController _nameController;
  late TextEditingController _jobTitleController;
  late TextEditingController _githubController;
  late TextEditingController _facebookController;
  late TextEditingController _twitterController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _jobTitleController = TextEditingController(text: widget.profile.jobTitle);
    _githubController = TextEditingController(text: widget.profile.githubUrl);
    _facebookController = TextEditingController(text: widget.profile.facebookUrl);
    _twitterController = TextEditingController(text: widget.profile.twitterUrl);
    _emailController = TextEditingController(text: widget.profile.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _jobTitleController.dispose();
    _githubController.dispose();
    _facebookController.dispose();
    _twitterController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _onSave() {
    final updatedProfile = Profile(
      name: _nameController.text,
      jobTitle: _jobTitleController.text,
      githubUrl: _githubController.text,
      facebookUrl: _facebookController.text,
      twitterUrl: _twitterController.text,
      email: _emailController.text,
    );
    widget.onSave(updatedProfile);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Edit Profile',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            _buildTextField(_nameController, 'Name'),
            _buildTextField(_jobTitleController, 'Job Title'),
            _buildTextField(_githubController, 'GitHub URL'),
            _buildTextField(_facebookController, 'Facebook URL'),
            _buildTextField(_twitterController, 'Twitter URL'),
            _buildTextField(_emailController, 'Email'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onSave,
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
