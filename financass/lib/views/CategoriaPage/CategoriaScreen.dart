import 'package:financass/config/Rotas.dart';
import 'package:financass/controllers/CategoriaController.dart';
import 'package:financass/models/CategoriaModel.dart';
import 'package:flutter/material.dart';

class CategoriaScreen extends StatefulWidget {
  const CategoriaScreen({super.key});

  @override
  State<CategoriaScreen> createState() => _CategoriaScreenState();
}

class _CategoriaScreenState extends State<CategoriaScreen> {
  List<Categoria> listaCategoria = [];
  bool _isloading = false;

  void initState() {
    super.initState();
    _isloading = true;
    getCategoriaFromApi();
  }

  void getCategoriaFromApi() async {
    var value = await getCategoria(ip: AppRoutes.Ipservidor);
    setState(() {
      listaCategoria = value;
    });
    _isloading = false;
  }

  var appBar = AppBar(
    backgroundColor: Color.fromARGB(255, 27, 75, 72),
    title: Text(
      'Categorias',
      style: TextStyle(color: Colors.white),
    ),
    centerTitle: true,
  );

  @override
  Widget build(BuildContext context) {
    var maxsizeUtil = (MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      appBar: appBar,
    );
  }
}
