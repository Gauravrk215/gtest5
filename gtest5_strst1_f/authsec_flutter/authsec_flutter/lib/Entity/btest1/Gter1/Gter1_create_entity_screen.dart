// ignore_for_file: use_build_context_synchronously
import 'dart:convert';import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart'; 
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:intl/intl.dart';
 
import 'package:authsec_flutter/Entity/btest1/Gter1/Gter1_api_service.dart';
import 'package:authsec_flutter/providers/token_manager.dart';
import 'package:flutter/services.dart';


class CreateEntityScreen extends StatefulWidget {
  const CreateEntityScreen({super.key});

  @override
  _CreateEntityScreenState createState() => _CreateEntityScreenState();
}

class _CreateEntityScreenState extends State<CreateEntityScreen> {
  final ApiService apiService = ApiService();
final Map<String, dynamic> formData = {};
  final _formKey = GlobalKey<FormState>();
 @override
  void initState() {
    super.initState();
 } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Gter1')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
          children: [
 
  TextFormField(
                  decoration: const InputDecoration(labelText: 'name'),
                  onSaved: (value) => formData['name'] = value,
                ),
                const SizedBox(height: 16),
  Container(
              margin: const EdgeInsets.symmetric(vertical: 5), // Add margin
              child: ElevatedButton(
                onPressed: () async {
 if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save(); 
 
                        final token = await TokenManager.getToken();
                        try {
                          print("token is : $token");
                          print(formData);

 await apiService.createEntity(token!, formData); 
 
                    Navigator.pop(context);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: Text('Failed to create entity: $e'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } }
                },
                child: const SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: const Center(
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),), 
   );
  }
}