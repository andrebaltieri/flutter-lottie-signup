import 'package:flutter/material.dart';
import 'package:fluttie/fluttie.dart';
import 'package:signup/widgets/form.widget.dart';
import 'package:signup/widgets/loading-button.widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  var busy = false;
  var done = false;
  FluttieAnimationController animationCtrl;

  @override
  initState() {
    super.initState();
    prepareAnimation();
  }

  @override
  dispose() {
    super.dispose();
    animationCtrl?.dispose();
  }

  prepareAnimation() async {
    var instance = Fluttie();

    var checkAnimation =
        await instance.loadAnimationFromAsset("assets/done.json");

    animationCtrl = await instance.prepareAnimation(
      checkAnimation,
      duration: const Duration(seconds: 2),
      repeatCount: const RepeatCount.dontRepeat(),
      repeatMode: RepeatMode.START_OVER,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            alignment: Alignment.center,
          ),
          FluttieAnimation(animationCtrl),
          !done
              ? SubmitForm(
                  busy: busy,
                  func: submit,
                )
              : Container(),
        ],
      ),
    );
  }

  Future<Function> submit() async {
    setState(() {
      busy = true;
    });

    Future.delayed(
      const Duration(seconds: 4),
      () => setState(
        () {
          done = true;
          animationCtrl.start();
        },
      ),
    );
  }
}
