part of client.model;

class Lattice {
  String image;
  String story;
  num energy;
  List<String> pos;
  
  Future charge(num power) {
    final List json = _jsonOfCharge(power);
    return const WriteCommand(SC_USE_SPELL).send(json);
  }
  
  Future update() {
    final List json = _jsonOfUpdate();
    return const WriteCommand(SC_USE_SPELL).send(json);
  }
  
  List _jsonOfCharge(num power) {
    return new List();
  }
  
  List _jsonOfUpdate() {
    return new List();
  }
}