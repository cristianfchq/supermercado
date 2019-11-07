import 'package:flutter/material.dart';
import 'package:supermercado_flutter/core/models/clienteModel.dart';
import 'package:supermercado_flutter/ui/views/cliente/clienteDetails.dart';

class ClienteCard extends StatelessWidget {
  final Cliente itemDetails;

  ClienteCard({@required this.itemDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ClienteDetails(product: itemDetails)));
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          color: Color(0xffe6e1c5),
          elevation: 8,
          child: Container(
            // height: MediaQuery
            //     .of(context)
            //     .size
            //     .height * 0.18,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Cliente:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "${itemDetails.nombreCliente} ${itemDetails.apellidoCliente}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Cedula:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "${itemDetails.cedula}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
