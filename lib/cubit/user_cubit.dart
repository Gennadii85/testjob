// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import '../data_json/json_convert_users.dart';
import '../services/users_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository userRepository;
  UserCubit(this.userRepository) : super(UserLoadingState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> loadedUserList = await userRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }
}
