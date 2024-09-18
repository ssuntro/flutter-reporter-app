mixin WorkerDelegate {
  void onWorkDone();
}

class Manager with WorkerDelegate {
  void onWorkDone() {
    print("Work was done");
  }
}

class Worker {
  final WorkerDelegate delegate;

  Worker({required this.delegate});

  void doWork() {
    delegate.onWorkDone();
  }
}

void main() {
  final manager = Manager();
  final worker = Worker(delegate: manager);

  worker.doWork();
}
