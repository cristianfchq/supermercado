import 'dart:io';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supermercado_flutter/core/models/ventasModel.dart';
import 'package:supermercado_flutter/core/viewmodels/CRUDModelVentas.dart';
import 'package:supermercado_flutter/ui/views/ventas/pdf_viewer.dart';
import 'package:supermercado_flutter/ui/widgets/ventasCard.dart';
import 'package:provider/provider.dart';
import 'package:permission/permission.dart';
//import 'package:simple_permissions/simple_permissions.dart';

class ReadVentas extends StatefulWidget {
  @override
  _ReadVentasState createState() => _ReadVentasState();
}

class _ReadVentasState extends State<ReadVentas> {
  List<Ventas> products;
  bool a0 = false, a1 = false, a2 = false, a3 = false, a4 = false, a5 = false, a6 = false, a7 = false, a8 = false;
  bool i0 = false, i1 = false, i2 = false, i3 = false, i4 = false, i5 = false, i6 = false;
  PermissionName permissionName = PermissionName.Storage;
  String message = '';
  var message2;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<CRUDModelVentas>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addVentas');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff2c363f),
      ),
      appBar: AppBar(
        title: Text('Ventas'),
        backgroundColor: Color(0xff2c363f),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
            ),
            onPressed: () {
//              Permission.openSettings();
//              getSinglePermissionStatus(context);
              _getPermissionsStatus();
              print("message2 ===>>> "+message2);
//              if (message2.toString()=="PermissionName.Storage: PermissionStatus.notAgain") {
                Permission.openSettings();
//              }
//              if (message2.toString()=="PermissionName.Storage: PermissionStatus.allow") {
                _generatePdfAndView(context);
//              }
              print("--------------------------------");
              print("permission is " + message2);

            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        child: StreamBuilder(
            stream: productProvider.fetchProductsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                products = snapshot.data.documents
                    .map((doc) => Ventas.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      VentasCard(itemDetails: products[index]),
                );
              } else {
                return Text('Cargando');
              }
            }),
      ),
    );
  }

  _generatePdfAndView(context) async {
//    PermissionName permissionName = PermissionName.Storage;
//
//    var permissions = await Permission.getPermissionsStatus([PermissionName.Storage]);
//
//    var permissionNames = await Permission.requestPermissions([PermissionName.Storage]);

//    Permission.openSettings;
//
//    print(permissionName);
//    print(permissions);
//    print(permissionNames);



//    List<Ventas> data = await _databaseService.list().first;



    final pdfLib.Document pdf = pdfLib.Document(deflate: zlib.encode);

    pdf.addPage(
      pdfLib.MultiPage(
        build: (context) => [
//          pdfLib.Paragraph(
//            text:
//                'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//          ),
//          pdfLib.Paragraph(
//            text:
//                'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//          ),
          pdfLib.Table.fromTextArray(
            context: context,
            data: <List<String>>[
              <String>['CodVenta', 'NomProducto', 'Cantidad', 'Precio', 'Total'],
              ...products.map((item) => [
                    item.codigo,
                    item.producto,
                    item.cantidad.toString(),
                    item.precioUnitario.toString(),
                    item.total.toString()
                  ])
            ],
          ),
        ],
      ),
    );

    //final dir = (await getApplicationDocumentsDirectory()).path;
    //final dir = (await getTemporaryDirectory());
    final dir = (await getExternalStorageDirectory()).path;
    final String path = '$dir/reporte.pdf';
    final File file = File(path);
    print(dir);
    print(path);
    print(file);
    await file.writeAsBytes(pdf.save());
//    file.writeAsBytesSync(bytes)



//    final Email email = Email(
//      body: 'Email body',
//      subject: 'Email subject',
//      recipients: ['cristian.fchq@example.com'],
//      cc: ['cristian.fchq@example.com'],
//      bcc: ['cristian.fchq@example.com'],
//      attachmentPath: path,
//    );
//
//    await FlutterEmailSender.send(email);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PdfViewerPage(path: path),
      ),
    );
  }


  _getSinglePermissionStatus(context) async {
    var permissionStatus = await Permission.getSinglePermissionStatus(permissionName);
    setState(() {
      message = permissionStatus.toString();
    });
  }

  _getPermissionsStatus() async {
    List<PermissionName> permissionNames = [];

    if(a8==false) permissionNames.add(PermissionName.Storage);

//    if(i6) permissionNames.add(PermissionName.Storage);
    message = '';
    List<Permissions> permissions = await Permission.getPermissionsStatus(permissionNames);
    permissions.forEach((permission) {
      message += '${permission.permissionName}: ${permission.permissionStatus}\n';
      print("---------------");
      print(message);
    });
    setState(() {
      message2 = message;
    });
  }
}
