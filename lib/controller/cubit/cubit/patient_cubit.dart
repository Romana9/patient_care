import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../constants/asset_path.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientInitial());
  static PatientCubit get(context) => BlocProvider.of(context);
  List notification = [];

  Future addNotification({required String heading}) async {
    notification.addAll([
      {
        'image': const AssetImage(AssetPath.appointmentReminder),
        'heading': 'Appointment set with $heading',
        'details': 'You set a appointment for 30 June 2023'
      }
    ]);
    print(notification);
  }

  Future deleteAllNotification() async {
    notification.removeRange(0, notification.length);
  }
}
