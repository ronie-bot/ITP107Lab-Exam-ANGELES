import 'package:flutter/material.dart';

// ============================================================
// ITP107 - Lab Exam: Flutter Sign-Up Screen
// ============================================================

void main() {
  runApp(const SignUpApp());
}

class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITP107 Sign Up',
      theme: ThemeData(
        primaryColor: const Color(0xFF4C5FD5),
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF4F6FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4C5FD5),
        ),
      ),
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controllers for the text fields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Used to show a small on-screen hint of the last gesture (optional UX touch)
  String _lastGestureMessage = 'Tap, double-tap, or long-press the button below';

  // ---------------- Gesture Handlers ----------------

  void _handleSingleTap() {
    // Requirement: Single Tap -> print "Hello World!"
    debugPrint('Hello World!');
    setState(() => _lastGestureMessage = 'Single Tap detected: "Hello World!"');
  }

  void _handleDoubleTap() {
    // Requirement: Double Tap -> print course code + description
    debugPrint('----------------------------------------');
    debugPrint('Course Code : ITP107');
    debugPrint('Description : Application Development and Emerging '
        'Technologies - a hands-on course covering the design and '
        'development of mobile applications using modern frameworks '
        'such as Flutter.');
    debugPrint('----------------------------------------');
    setState(() => _lastGestureMessage =
        'Double Tap detected: Course info printed to console');
  }

  void _handleLongPress() {
    const String fullName = 'Aron Ortega Angeles';
    debugPrint('Full Name: $fullName');
    setState(() =>
        _lastGestureMessage = 'Long Press detected: Full name printed to console');
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF4C5FD5), Color(0xFFF4F6FB)],
                stops: [0.0, 0.35],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ---------- Logo / Image widget ----------
                const CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.school_rounded,
                    size: 46,
                    color: Color(0xFF4C5FD5),
                  ),
                ),
                const SizedBox(height: 16),

                // ---------- Title / Subtitle (Text widgets) ----------
                const Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'ITP107 - Application Development Lab Exam',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 24),

                // ---------- Card containing the sign-up form ----------
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _buildTextField(
                          controller: _fullNameController,
                          label: 'Full Name',
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 14),
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email Address',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 14),
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          icon: Icons.lock_outline,
                          obscureText: true,
                        ),
                        const SizedBox(height: 14),
                        _buildTextField(
                          controller: _confirmPasswordController,
                          label: 'Confirm Password',
                          icon: Icons.lock_outline,
                          obscureText: true,
                        ),
                        const SizedBox(height: 22),

                        // ---------- Standard Sign Up button ----------
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4C5FD5),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              debugPrint('Sign Up button pressed. '
                                  'Name: ${_fullNameController.text}, '
                                  'Email: ${_emailController.text}');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // ---------- GestureDetector Section ----------
                const Text(
                  'Gesture Test Area',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: _handleSingleTap,
                  onDoubleTap: _handleDoubleTap,
                  onLongPress: _handleLongPress,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Click Me',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C5FD5),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),
                Text(
                  _lastGestureMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF4C5FD5)),
        filled: true,
        fillColor: const Color(0xFFF4F6FB),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
