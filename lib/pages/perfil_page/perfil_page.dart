import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receta_cocina/services/Firebase/firebase_service.dart';
import 'package:receta_cocina/services/Firebase/sign_in_email.dart';
import 'package:receta_cocina/utils/size_desing.dart';
import 'package:receta_cocina/widget/custom_perfil.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final firestore = FirebaseFirestore.instance;
  dynamic data;
  String? email = "";
  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    final user = FirebaseServices.auth.currentUser!;
    var snapshot = await firestore.collection("user").doc(user.uid).get();
    data = snapshot.data();
    setState(() {
      email = data['email'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);
    final auth = Provider.of<SingInEmail>(context);
    return CustomPerfil(
      size: size,
      auth: auth,
      email: email!,
    );
  }
}
