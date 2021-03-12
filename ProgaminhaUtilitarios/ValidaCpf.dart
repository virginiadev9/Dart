import 'dart:io';

void main(){
  print("Digite o seu cpf no formato xxx.xxx.xxx-xx: ");
  var input = stdin.readLineSync();// O dart só consegue ler ou toda linha e ai vc que faz o tratamento , ou também bites que tem retorno inteiro
  String cpf =input.toString();
  // print(cpf); # print("Digite o numero de bytes:"); # int idade = stdin.readByteSync(); # print("O numero de bites que contem é: $idade");
  print("O seu cpf é :${validaCpf(cpf)}");
}
                            //  0 1 2 3 4 5 6 7 8 9 10   11 12 13
bool validaCpf(String cpf){ //  1 1 1 . 0 0 1 . 0 8  4    -  4  1
  if(cpf[3]!='.' || cpf[7]!='.' || cpf[11]!='-'){ // Se não contem os divisores do cpf
    return false;
  }
  if(calculaDigitosVerificador(cpf)){
    return true;
  }
  return false;
}
bool calculaDigitosVerificador(String cpf){
  int verificador1=int.parse(cpf[12]);
  int verificador2=int.parse(cpf[13]);
  int resultado1 = 0;int resultado2 = 0;
  int regra1 = 10;                                             //1º * 10 + 2º * 9 + 3º * 8 + 4º * 7 + 5º * 6 + 6º * 5 + 7º * 4 + 8º * 3 + 9º * 2
  int regra2 = 11;                                            // 1º * 11 + 2º * 10 + 3º * 9 + 4º * 8 + 5º * 7 + 6º * 6 + 7º * 5 + 8º * 4 + 9º * 3 + 11º *2
  List<int> numerosCpf = List.empty(growable: true);//indica que pode ser vazia
  //Faço passagem de string para numeros,cpf.lenght da o tamanho da string mas nem usei
  for(int i=0;i<=10;i++){
    if(cpf[i]!='.'){
      numerosCpf.add(int.parse(cpf[i]));
    }
  }
  //Varrer List de inteiros * por começo=10 decrementando
  for(int num in numerosCpf){
    resultado1 =(num * regra1) + resultado1;
    regra1-=1;
  }
  for(int num in numerosCpf){
    resultado2 =(num * regra2) + resultado2;
    regra2-=1;
  }resultado2 =(verificador1*2)+resultado2;

  if((resultado1*10)%11==verificador1 && (resultado2*10)%11==verificador2){
    return true;
  }
  return false;
}
















/**
 * Transformar uma String em numero com dart
 * int x =int.parse('1');
 * 
 * String para Double
 * double x = double.parse('1.1');
 * 
 * Ao contarrio, de Inteiro para String
 * String oneAsString = 1.toString();
 * 
 * Double para STring
 * String piAsString = 3.14159.toStringAsFixed(2); 
 */
