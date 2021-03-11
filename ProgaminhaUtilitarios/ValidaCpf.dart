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
bool validaCpf(String cpf){
  if(cpf[3]!='.' || cpf[7]!='.' || cpf[11]!='-'){
    return false;
  }
  // else if(calculaDigitos(parseInt(cpf[12]),parseInt(cpf[13])){
  //   return true;
  // }

  return false;
}
bool calculaDigitos(int digito1, int digito2){
  return true;
}