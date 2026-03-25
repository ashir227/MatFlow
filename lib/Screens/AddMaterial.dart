import 'package:flutter/material.dart';
import 'package:matflow/Core/theme/colors.dart';

class AddMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A3D7C), // AppBar wala blue color
      body: Stack(
        children: [
          // 1. Custom Header (Title and Back Button)
          SafeArea(
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      "Add Material",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // Balance for centering title
                ],
              ),
            ),
          ),

          // 2. White Rounded Form (The Overlap)
          Positioned(
            top: 110, // Header ke niche se start hoga
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                  topRight: Radius.circular(70),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel("Material Name"),
                    _buildTextField("Material Name"),
                    const SizedBox(height: 20),

                    _buildLabel("Unit"),
                    _buildDropdownField(),
                    const SizedBox(height: 20),

                    _buildLabel("Per Piece Consumption"),
                    _buildTextField("Per Piece Consumption"),
                    const SizedBox(height: 20),

                    _buildLabel("Initial Stock"),
                    _buildTextField("1000"),
                    const SizedBox(height: 20),

                    _buildLabel("Minimum Threshold"),
                    _buildTextField("100"),
                    const SizedBox(height: 40),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF00796B,
                          ), // Teal color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for Labels
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  // Helper widget for TextFields
  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }

  // Helper for Dropdown
  Widget _buildDropdownField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: const Text("Unit"),
          isExpanded: true,
          items: ["Kg", "Meter", "Liter"].map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }
}
