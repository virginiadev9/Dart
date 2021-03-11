import 'dart:io';

void main(){
  print("Digite o seu cpf no formato xxx.xxx.xxx-xx: ");
  var input = stdin.readLineSync();// O dart só consegue ler ou toda linha e ai vc que faz o tratamento , ou tambeém bites que tem retorno inteiro
  String cpf =input.toString();
  // print(cpf);
  // print("Digite o numero de bytes:");
  // int idade = stdin.readByteSync();
  // print("O numero de bites que contem é: $idade");
  print("O seu cpf é :${validaCpf(cpf)}");

}
                            //  0 1 2 3 4 5 6 7 8 9 10   11 12 13
bool validaCpf(String cpf){ //  1 1 6 . 0 0 8 . 0 8  4    -  4  1
  if(cpf[3]!='.' || cpf[7]!='.' || cpf[11]!='-'){ // Se contem os divisores do cpf
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
  List<int> numerosCpf = List.empty(growable: true);//indica que pode ser vazia
  //Faço passagem de string para numeros
  for(int i=0;i<=10;i++){//cpf.lenght da o tamnho da string
    if(cpf[i]!='.'){
      numerosCpf.add(int.parse(cpf[i]));
    }
  }
  //Varro List de inteiros * por começo=10 decrementando
  int resultado1=0;
  int regra1 = 10;
  for(int num in numerosCpf){
    resultado1 =(num * regra1)+resultado1;
    regra1-=1;//5 * 10 + 2 * 9 + 9 * 8 + 9 * 7 + 8 * 6 + 2 * 5 + 2 * 4 + 4 * 3 + 7 * 2
  }
  int resultado2=0;
  int regra2 = 11;
  for(int num in numerosCpf){// 8  4    -  4  1
    resultado2 =(num * regra2)+resultado2;//11,10,71,0,0,48,0,32,12 +8
    regra2-=1;
  }
  resultado2 =(verificador1*2)+resultado2; //5 * 11 + 2 * 10 + 9 * 9 + 9 * 8 + 8 * 7 + 2 * 6 + 2 * 5 + 4 * 4 + 7 * 3 + 2 * 2

  // print("r1-> ${(resultado1*10)%11} r2-> ${(resultado2*10)%11}");
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