PVector size=new PVector(600,600);
PVector translate;
Complex comp;
Color c;
void settings(){
  size(600,600);
}
void setup(){
  translate=new PVector(width/2,height/2);
  translate(translate.x,translate.y);
  comp=new Complex(0,0);
  c=new Color();
  background(0);
  stroke(20);
  line(-translate.x,0,translate.x,0);
  line(0,-translate.y,0,translate.y);
  result=new Result();
}
void draw(){
  if(comp.imag>translate.y){
    comp=new Complex(comp.real+1,-translate.y);
    //c=new Color(); //Uncomment this to make the color of each pair of lines random
  }
  set(int(comp.real+translate.x),int(-comp.imag+translate.y),c.col);
  set(int(-comp.real+translate.x),int(comp.imag+translate.y),c.col);
  c.changeColor();
  comp=new Complex(comp.real,comp.imag+1);
}