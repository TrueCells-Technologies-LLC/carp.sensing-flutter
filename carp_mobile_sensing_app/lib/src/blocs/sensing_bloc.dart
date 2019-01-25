part of mobile_sensing_app;

class SensingBloc {
  /// Is sensing running, i.e. has the study executor been resumed?
  bool get isRunning => (sensing.controller != null) ? sensing.controller.executor.state == ProbeState.resumed : false;

  /// Get the study for this app.
  StudyModel get study => sensing.study != null ? StudyModel(sensing.study) : null;

  /// Get a list of running probes
  Iterable<ProbeModel> get runningProbes => sensing.runningProbes.map((probe) => ProbeModel(probe));

  void init() async {}

  void start() async {
    sensing.start();
  }

  void pause() {
    sensing.controller.pause();
  }

  void resume() async {
    sensing.controller.resume();
  }

  void stop() async {
    sensing.stop();
  }

  void dispose() async {
    sensing.stop();
  }
}

final bloc = SensingBloc();
