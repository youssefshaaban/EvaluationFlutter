abstract class Mapper<To, From> {
  To? map(From? from);
  List<To>? mapList(List<From>? from) => from?.map((e) => map(e)!).toList();
}
