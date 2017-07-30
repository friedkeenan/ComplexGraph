class Complex{
  final float real,imag;
  final float theta,radius;
  Complex(float a,float b){
    real=a;
    imag=b;
    radius=sqrt(pow(real,2)+pow(imag,2)); // "Convert" the number to polar form for easier calculations
    theta=atan2(imag,real);
  }
  Complex(float r,float t,boolean polar /* And this, folks, is why Python functions are better */){
    if(polar){
      radius=r;
      theta=t;
      real=radius*cos(theta);
      imag=radius*sin(theta);
    }else{
      real=r;
      imag=t;
      radius=sqrt(pow(real,2)+pow(imag,2));
      theta=atan2(imag,real);
    }
  }
  Complex conjugate(){
    return new Complex(real,-imag);
  }
  Complex ln(){ //Gets the natural log of the complex number
    return new Complex(log(radius),theta);
  }
  Complex ePower(){ //Takes e to the power of the complex number
    return new Complex((float)Math.pow(Math.E,real),imag,true);
  }
  Complex csin(){ //Gets the sine of the complex number
    return (new Complex(1,theta,true).add((new Complex(1,-theta,true)).mult(-1))).div(new Complex(0,2));
  }
  Complex ccos(){ //Gets the cosine of the complex number
    return ((new Complex(1,theta,true)).add(new Complex(1,-theta,true))).mult(0.5);
  }
  Complex mult(float n){
    return new Complex(n*real,n*imag);
  }
  Complex mult(Complex z){
    return new Complex(radius*z.radius,theta+z.theta,true);
  }
  Complex div(float n){
    return mult(1/n);
  }
  Complex div(Complex z){
    return mult(z.conjugate()).div(pow(z.real,2)+pow(z.imag,2));
  }
  Complex add(float n){
    return new Complex(real+n,imag);
  }
  Complex add(Complex z){
    return new Complex(real+z.real,imag+z.imag);
  }
  Complex sub(float n){
    return add(-n);
  }
  Complex sub(Complex z){
    return add(z.mult(-1));
  }
  Complex power(float n){
    return (new Complex(cos(n*theta),sin(n*theta))).mult(pow(radius,n));
  }
  Complex power(Complex z){ //Takes the complex number to the power of another complex number
    Complex first=power(z.real);
    Complex second=power(z.imag);
    second=second.ln();
    second=second.mult(new Complex(0,1));
    second=second.ePower();
    return first.mult(second);
  }
}
