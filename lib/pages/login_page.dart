import 'package:flutter/material.dart';

import 'package:bloc_pattern/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createBackground(size),
          _loginForm(size, context),
        ],
      ),
    );
  }

  Widget _loginForm(Size size, BuildContext context) {
    final bloc = Provider.of(
        context); //va a escalar el context asta encontrar la deficnicion del loginBloc

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: size.height * 0.1,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.assessment,
                  color: Colors.white,
                ),
                SizedBox(
                  width: double.infinity,
                ),
                Text(
                  'Bienvenido',
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 5.0),
                    spreadRadius: 3.0,
                  )
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 35.0,
                ),
                _createEmail(bloc),
                SizedBox(
                  height: 25.0,
                ),
                _createPassword(bloc),
                SizedBox(
                  height: 35.0,
                ),
                _createButton(size, bloc),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }

  Widget _createEmail(LoginBloc bloc) {
    return StreamBuilder<String>(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'example@mail.com',
              labelText: 'Email',
              errorText: (snapshot.hasError) ? snapshot.error : null,
              icon: Icon(
                Icons.alternate_email,
                color: Color.fromRGBO(63, 63, 156, 1.0),
              ),
            ),
            onChanged: bloc
                .changeEmail, //el primer parametre del onChange(value) => se envia al primer parametro de bloc.changeEmail(value)
          ),
        );
      },
    );
  }

  Widget _createPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: '**********',
                labelText: 'Password',
                icon: Icon(
                  Icons.lock,
                  color: Color.fromRGBO(63, 63, 156, 1.0),
                ),
                errorText: (snapshot.hasError) ? snapshot.error : null),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createButton(Size size, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidation,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          color: Color.fromRGBO(63, 63, 156, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            width: size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                ),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            ),
          ),
          onPressed: (snapshot.hasData) ? () => _login(context, bloc) : null,
        );
      },
    );
  }

  _login(BuildContext context, LoginBloc bloc) {
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _createBackground(Size size) {
    final gradient = Container(
      height: size.height * 0.6,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(100, 20),
            bottomRight: Radius.elliptical(100, 20)),
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 1178, 1.0),
          ],
        ),
      ),
    );

    final circle = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          top: 90,
          left: 30,
          child: circle,
        ),
        Positioned(
          top: 0,
          right: 10,
          child: circle,
        ),
      ],
    );
  }
}
