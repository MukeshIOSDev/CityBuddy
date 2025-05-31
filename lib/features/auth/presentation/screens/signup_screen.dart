import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emergencyContactController = TextEditingController();
  List<String> selectedInterests = [];
  List<String> selectedActivities = [];
  List<String> selectedAvailability = [];
  List<String> selectedLanguages = [];
  double preferredRadius = 5;
  File? profileImage;
  String gender = '';
  bool hostActivities = false;
  bool oneOnOneMeetups = false;
  bool publicEventsOnly = false;
  bool agreedToTerms = false;
  bool allowLocation = false;
  bool allowNotifications = false;

  Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          profileImage = File(pickedFile.path);
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset('assets/logo.png', height: 80),
                        const SizedBox(height: 8),
                        const Text(
                          "Let’s get you connected in your city",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Profile Picture
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: pickImage,
                        child: const Text("Upload Profile Picture"),
                      ),
                      const SizedBox(width: 10),
                      if (profileImage != null)
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: FileImage(profileImage!),
                        )
                    ],
                  ),

                  _buildInputField(_fullNameController, "Full Name"),
                  _buildInputField(_emailController, "Email Address"),
                  _buildInputField(_mobileController, "Mobile Number"),
                  _buildInputField(_passwordController, "Password", isPassword: true),
                  _buildInputField(_confirmPasswordController, "Confirm Password", isPassword: true),
                  _buildInputField(_dobController, "Date of Birth"),
                  _buildDropdownField("Gender", ['Male', 'Female', 'Non-Binary', 'Prefer not to say'], (val) => gender = val),
                  _buildInputField(_cityController, "Current City"),
                  _buildInputField(_bioController, "Short Bio"),

                  const SizedBox(height: 16),
                  const Text("Primary Interests"),
                  Wrap(
                    spacing: 8,
                    children: ["Cricket", "Football", "Trekking", "Reading"].map((interest) {
                      final selected = selectedInterests.contains(interest);
                      return FilterChip(
                        label: Text(interest),
                        selected: selected,
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              selectedInterests.add(interest);
                            } else {
                              selectedInterests.remove(interest);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),
                  const Text("Activity Type Preference"),
                  Wrap(
                    spacing: 8,
                    children: ["Play Sports", "Networking", "Explore City"].map((activity) {
                      final selected = selectedActivities.contains(activity);
                      return FilterChip(
                        label: Text(activity),
                        selected: selected,
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              selectedActivities.add(activity);
                            } else {
                              selectedActivities.remove(activity);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),
                  const Text("Availability"),
                  Wrap(
                    spacing: 8,
                    children: ["Weekends", "Evenings", "Flexible"].map((avail) {
                      final selected = selectedAvailability.contains(avail);
                      return FilterChip(
                        label: Text(avail),
                        selected: selected,
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              selectedAvailability.add(avail);
                            } else {
                              selectedAvailability.remove(avail);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),
                  const Text("Preferred Radius (km): ${5}"),
                  Slider(
                    value: preferredRadius,
                    min: 2,
                    max: 15,
                    onChanged: (value) {
                      setState(() {
                        preferredRadius = value;
                      });
                    },
                  ),

                  const SizedBox(height: 16),
                  const Text("Languages You Speak"),
                  Wrap(
                    spacing: 8,
                    children: ["English", "Hindi", "Marathi"].map((lang) {
                      final selected = selectedLanguages.contains(lang);
                      return FilterChip(
                        label: Text(lang),
                        selected: selected,
                        onSelected: (bool value) {
                          setState(() {
                            if (value) {
                              selectedLanguages.add(lang);
                            } else {
                              selectedLanguages.remove(lang);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 16),
                  const Text("Community Preferences"),
                  _buildSwitch("Open to Hosting Activities?", hostActivities, (val) => setState(() => hostActivities = val)),
                  _buildSwitch("Open to One-on-One Meetups?", oneOnOneMeetups, (val) => setState(() => oneOnOneMeetups = val)),
                  _buildSwitch("Join Public Events Only?", publicEventsOnly, (val) => setState(() => publicEventsOnly = val)),

                  _buildInputField(_emergencyContactController, "Emergency Contact"),

                  CheckboxListTile(
                    value: agreedToTerms,
                    title: const Text("I agree to Terms & Privacy"),
                    onChanged: (val) => setState(() => agreedToTerms = val ?? false),
                  ),
                  CheckboxListTile(
                    value: allowLocation,
                    title: const Text("Allow access to location"),
                    onChanged: (val) => setState(() => allowLocation = val ?? false),
                  ),
                  CheckboxListTile(
                    value: allowNotifications,
                    title: const Text("Allow notifications"),
                    onChanged: (val) => setState(() => allowNotifications = val ?? false),
                  ),

                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && agreedToTerms) {
                        // proceed with sign up
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2ECC71),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: const Text("Create My Account"),
                  ),

                  const SizedBox(height: 12),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Already have an account? Log In Instead"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2ECC71)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }

  Widget _buildDropdownField(String label, List<String> options, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        items: options.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (val) => onChanged(val!),
        validator: (value) => value == null ? 'Required' : null,
      ),
    );
  }

  Widget _buildSwitch(String title, bool value, Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Color(0xFF2ECC71),
    );
  }
}
