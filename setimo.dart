//Herança no dart
class Pessoa{
  String _nome;
  int _idade;
  double _altura;

  //construtor
  Pessoa(this._nome,this._idade,this._altura);


  //metodos gets e sets
  String get nome{
    return this._nome;
  }
  set nome(String nome){
    this._nome=nome;
  }

  int get idade{
    return this._idade;
  }
  set idade(int idade){
    this._idade=idade;
  }

  double get altura{
    return this._altura;
  }
  set altura(double altura){
    this._altura=altura;
  }

}
class Cliente{
  String _cpf;
  Cliente(this._cpf);
  void comprar(){
    print("comprar");
  }
}
void main(){




}