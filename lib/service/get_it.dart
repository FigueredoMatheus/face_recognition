import 'package:face_recognition/controller/face_movement_controller.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupSingletonClasses() {
  getIt.registerLazySingleton(() => FaceMovementController());
}
