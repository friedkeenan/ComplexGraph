Result result;
Complex[] root(Complex z,int n){ //Make eq() return this to get the roots of complex numbers
  Complex[] comps=new Complex[n]; //Might want to multiply each value by 10 or something
  for(int k=0;k<n;k++)
    comps[k]=new Complex(pow(z.radius,1.0/n),(z.theta+(float)Math.PI*2*k)/n,true);
  return comps;
}
Complex[] circ(Complex z){ //Make eq() return this to get a cool circle effect
  Complex[] comps=new Complex[150]; //150 is completely arbitrary, feel free to change it
  for(int i=0;i<comps.length;i++)
    comps[i]=new Complex(z.radius,random((float)Math.PI*2),true); //A complex number with the same radius as the input, but with a random angle
  return comps;
}
Complex[] eq(Complex z){
  return new Complex[]{z.power(2).mult(new Complex(1,7*(float)Math.PI/6,true))};
}
class Result extends PApplet{
  Result(){
    super();
    PApplet.runSketch(new String[]{this.getClass().getSimpleName()},this);
  }
  void settings(){
    size(600,600);
  }
  void setup(){
    translate(translate.x,translate.y);
    background(0);
    stroke(20);
    line(-translate.x,0,translate.x,0);
    line(0,-translate.y,0,translate.y);
  }
  void draw(){
    Complex[] w=eq(comp);
    Complex[] f=eq(comp.mult(-1));
    for(Complex d:w)
      set(int(d.real+translate.x),int(-d.imag+translate.y),c.col);
    for(Complex d:f)
      set(int(d.real+translate.x),int(-d.imag+translate.y),c.col);
  }
}
