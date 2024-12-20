import '../model/Home_model.dart';

abstract class shopAppState {


}

class shopAppIntialState extends  shopAppState {}
class shopAppLoadingState extends  shopAppState {}
class shopAppSuccessfulState extends  shopAppState {
  late final  homemodel loginmodel ;
  shopAppSuccessfulState(this.loginmodel);

}
class shopAppErrorState extends  shopAppState {
final String Error ;
  shopAppErrorState(
      this.Error
      );
}
class Ispassword extends  shopAppState {}
class currentIndex extends  shopAppState {}


class homemodelLoadingState extends  shopAppState {}
class homemodelSuccesfulState extends  shopAppState {}
class homemodelerrorState extends  shopAppState {}

