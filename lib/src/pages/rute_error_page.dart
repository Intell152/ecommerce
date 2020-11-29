import 'package:flutter/material.dart';

class FatalErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _centralImage(context),
    );
  }

  Widget _centralImage(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // return Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     color: Colors.white,
    //     child:
    return Center(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.22),
          Container(
            // padding: EdgeInsets.symmetric(vertical: size.height * 0.2),
            child: FadeInImage(
              placeholder: AssetImage('assets/img/jar-loading.gif'),
              image: NetworkImage(
                  'https://www.gestion.org/wp-content/uploads/2013/02/perro.jpg'),
              height: size.height * 0.5,
              width: size.width * 0.8,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'Ups!! Algo salio mal.',
            style: TextStyle(color: Colors.black, fontSize: 28.0),
          )
        ],
      ),
    );
  }
}
