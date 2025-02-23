private PShape clavier;
private PShape ecran;
private PShape chaise;
private PShape table;
private PShape object;


PShape objectBureau()
{
   PShape bureau = createShape(GROUP);
   
  clavier = objectClavier();
  ecran = objectEcran();
  chaise = objectChaise();
  table = objectTable();
  
  bureau.addChild(clavier);
  bureau.addChild(ecran);
  bureau.addChild(chaise);
  bureau.addChild(table);
  
  chaise.translate(0,-50,-100);
  ecran.translate(0,-155,50);
  clavier.translate(0,-115,0);
  
  return bureau;
}
