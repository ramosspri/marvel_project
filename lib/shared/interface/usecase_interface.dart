abstract class UsecaseInterface<Type, Params> {
  Future<Type> call(Params params);
}
