import '../models/lagoa.dart';

class ListarLagoas {
  const ListarLagoas();

  List<Lagoa> call() => List<Lagoa>.unmodifiable(listaLagoas);
}
