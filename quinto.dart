//Funçoes em dart

void main(){
  printIntro();
  int num1=10;int num2=20;
  int result = somaDoisnumeros(num1,num2);
  print(result);
  print(result =somaDoisnumeros2(num1, num2));


}
void printIntro(){
  print("Seja bem vindo");
  
}
int somaDoisnumeros(int x,int y){
    return x+y;
}
//Funçoes com corpo so de 1 linha
int somaDoisnumeros2(int x,int y)=> x+y;