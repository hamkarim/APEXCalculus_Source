import graph3;
import apexstyle;


//ASY file for figdouble23D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(1.6,-5.5,12.4);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={1,2,3,4};
real[] myychoice={1};
real[] myzchoice={2,4,6,8};
defaultpen(0.5mm);

pair xbounds=(0,2.5);
pair ybounds=(0,1.5);
pair zbounds=(0,9);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//Draw the surface//{z=3xy-x^2-y^2+6};
triple f(pair t) {
  return (t.x,t.y,3*t.x*t.y-t.x^2-t.y^2+6);
}
surface s=surface(f,(-0.1,-0.1),(2.1,1.1),12,20,Spline);
pen p=rgb(0,0,.7);
draw(s,emissive(surfacepen),meshpen=apexmeshpen);


//Draw triangle in plane
draw((0,0,0)--(2,0,0)--(0,1,0)--(0,0,0),rgb(.1,.1,.1)+linewidth(2));
label("$R$",(0,0.5,0),E);

//Draw triangle on surface
triple g(real t) {return (t,0,6-t^2);}
path3 mypath=graph(g,0,2,operator ..);
draw(mypath,rgb(.1,.1,.1)+linewidth(2));

triple g(real t) {return (0,t,6-t^2);}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,rgb(.1,.1,.1)+linewidth(2));

triple g(real t) {return (2-2*t,t,3*(2-2*t)*(t)-(2-2*t)^2-(t)^2+6);}
path3 mypath=graph(g,0,1,operator ..);
draw(mypath,rgb(.1,.1,.1)+linewidth(2));

//Draw vertical lines
draw((2,0,0)--(2,0,2),rgb(.1,.1,.1)+dashed+linewidth(0.75));
draw((0,1,0)--(0,1,5),rgb(.1,.1,.1)+dashed+linewidth(0.75));



// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,emissive(surfacepen),meshpen=apexmeshpen);

//draw(s,palergb(.1,.1,.1));
//draw(s,lightrgb(.1,.1,.1),meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+rgb(.1,.1,.1));

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);

//pen p=rgb(0,0,1);
//draw(s,palergb(.1,.1,.1)+opacity(.5),meshpen=p,render(merge=true));