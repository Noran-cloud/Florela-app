
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:iti2/cubit/counter_state.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() :super(CounterInitial());

  void increment(){
    emit(CounterUpdate(state.counter+1));
  }

  void decrement(){
    emit(CounterUpdate(state.counter-1));
  }
}