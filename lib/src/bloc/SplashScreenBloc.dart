class SplashScreenBloc {

  void countDownTimer(int second, doneCallback()) {
    Future.delayed(Duration(seconds: second), () {
      doneCallback();
    });
  }
}