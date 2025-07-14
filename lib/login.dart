import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _perlihat = true;
  bool _isCheck = false;

  String? selectedBahasa = 'ID';

  List <Map<dynamic, dynamic>> bahasa = <Map<dynamic, dynamic>>[
    <dynamic, dynamic>{
      'id' : 'ID',
      'title' : 'Bahasa Indonesia',
    },<dynamic, dynamic>{
      'id' : 'EN',
      'title' : 'English',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halaman Login'
        ),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Login',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              'Selamat Datang Di Aplikasi Saya'
            ),
            DropdownButton<String>(
              value: selectedBahasa,
              items: bahasa.map<DropdownMenuItem<String>>((Map<dynamic, dynamic>data){
                return DropdownMenuItem<String>(
                  value: data['id'],
                  child: Text(data['title']) );
              }).toList(), onChanged: (value){
                setState(() {
                  selectedBahasa = value;
                });
              } ,
              ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField( //input email
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: '@gmail.com',
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField( //input password
                controller: _passwordController,
                obscureText: _perlihat ? true : false,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon: InkWell(
                    onTap: (){
                      setState(() {
                        _perlihat = !_perlihat;
                      });
                    },
                    child: Icon( _perlihat 
                    ? Icons.visibility_off 
                    : Icons.visibility_outlined
                    )
                    ),
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 5),
            TextButton(
              child: Text('lupa Password'),
              onPressed: (){},
            ),
            FilledButton(
              onPressed: _isCheck == true ?(){} : null, 
              child: Text('Login')),


            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Belum Punya Akun ?'),
                TextButton(onPressed: (){
                  // Navigator.pushNamed(context, /register);
                }, 
                child: Text('Daftar'),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(value: _isCheck, onChanged: (bool?value){
                  setState(() {
                    _isCheck = !_isCheck;
                  });
                },
                ),
                Expanded(
                  child: 
                  Text('Dengan Login dan mendaftar anda telah menyutuji kebijakan privasi dan term of condition')
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}