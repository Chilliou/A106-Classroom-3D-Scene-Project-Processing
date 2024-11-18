float angle = 0f;
PShape socle,pied,support;
PShape bordEcranBas,bordEcranBas2,bordEcranDroite,bordEcranGauche,bordEcranHaut;
PShape ecranShape;
PImage imageMetal,imageVert ;
PShape object;

void setup() {
  size(600, 600, P3D);
  imageVert = loadImage("chaisePied.jpg");
  imageMetal = loadImage("metal.jpg");
  object = objectEcran();

}

PShape objectEcran()
{
   PShape ecran = createShape(GROUP);
   
   int iEcranVertical = 125;
   int iEcranHorizontal = 400;
   int iEcranBordLargeur = 2;
   
   
   
   

  
  
  ecranShape = cubeMagique(iEcranHorizontal,iEcranVertical,iEcranBordLargeur,imageVert);
  
  bordEcranBas = cubeMagique(iEcranHorizontal,iEcranBordLargeur,iEcranBordLargeur,imageMetal);
  bordEcranBas2 = cubeMagique(iEcranHorizontal+2+2,iEcranBordLargeur,iEcranBordLargeur,imageMetal);
  bordEcranHaut = cubeMagique(iEcranHorizontal,iEcranBordLargeur,iEcranBordLargeur,imageMetal);
  bordEcranDroite = cubeMagique(iEcranBordLargeur,iEcranVertical+2,iEcranBordLargeur,imageMetal);
  bordEcranGauche = cubeMagique(iEcranBordLargeur,iEcranVertical+2,iEcranBordLargeur,imageMetal);

  
  ecran = createShape(GROUP);

  
  ecran.addChild(ecranShape);
  
  ecran.addChild(bordEcranBas);
  ecran.addChild(bordEcranBas2);
  ecran.addChild(bordEcranHaut);
  ecran.addChild(bordEcranDroite);
  ecran.addChild(bordEcranGauche);

  ecranShape.translate(0,-100,-50);
  
  bordEcranBas.translate(0,25,-50);
  bordEcranBas2.translate(0,25,-54);
  bordEcranHaut.translate(0,-225,-50);
  
  bordEcranDroite.translate(402,-100,-50);
  bordEcranGauche.translate(-402,-100,-50);


  return ecran;
}


PShape cubeMagique(int tailleX, int tailleY, int tailleZ, PImage texture) {
    PShape cube = createShape(GROUP);
    PShape tabShape[] = new PShape[6];
    
    PShape topShape = createShape();
    PShape bottomShape = createShape();
    PShape leftShape = createShape();
    PShape rightShape = createShape();
    PShape frontShape = createShape();
    PShape backShape = createShape();
    
    tabShape[0] = topShape;
    tabShape[1] = bottomShape;
    tabShape[2] = leftShape;
    tabShape[3] = rightShape;
    tabShape[4] = frontShape;
    tabShape[5] = backShape;
    
    for(PShape p : tabShape)
    {
      p.beginShape(QUADS);
    }

    
    topShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    topShape.vertex(-tailleX,-tailleY,tailleZ, 0, 1); //Point D
    topShape.vertex(-tailleX,-tailleY,-tailleZ, 1, 1);//Point E
    topShape.vertex(tailleX,-tailleY,-tailleZ, 1, 0); //Point F
       
    bottomShape.vertex(-tailleX,tailleY,tailleZ, 0, 0);  //Point C
    bottomShape.vertex(tailleX,tailleY,tailleZ, 0, 1);   //Point B
    bottomShape.vertex(tailleX,tailleY,-tailleZ, 1, 1);  //Point G
    bottomShape.vertex(-tailleX,tailleY,-tailleZ, 1, 0); //Point H
      
   
    leftShape.vertex(-tailleX,tailleY,tailleZ, 0, 0);  //Point C
    leftShape.vertex(-tailleX,-tailleY,tailleZ, 0, 1); //Point D
    leftShape.vertex(-tailleX,-tailleY,-tailleZ, 1, 1);//Point E
    leftShape.vertex(-tailleX,tailleY,-tailleZ, 1, 0); //Point H
      
    
    rightShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    rightShape.vertex(tailleX,-tailleY,-tailleZ, 0, 1); //Point F
    rightShape.vertex(tailleX,tailleY,-tailleZ, 1, 1);  //Point G
    rightShape.vertex(tailleX,tailleY,tailleZ, 1, 0);   //Point B
      
    
    frontShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    frontShape.vertex(tailleX,tailleY,tailleZ, 0, 1);   //Point B
    frontShape.vertex(-tailleX,tailleY,tailleZ, 1, 1);  //Point C
    frontShape.vertex(-tailleX,-tailleY,tailleZ, 1, 0); //Point D

    
    backShape.vertex(-tailleX,-tailleY,-tailleZ, 0, 0);//Point E
    backShape.vertex(tailleX,-tailleY,-tailleZ, 0, 1); //Point F
    backShape.vertex(tailleX,tailleY,-tailleZ, 1, 1);  //Point G
    backShape.vertex(-tailleX,tailleY,-tailleZ, 1, 0); //Point H
      
    
    for(PShape p : tabShape)
    {
      p.textureMode(NORMAL);
      p.texture(texture);
      p.shininess(200.0);
      p.emissive(0, 0, 0);
      p.normal(0, 0, 1);
      p.endShape();
      cube.addChild(p);
    }
    
     
     return cube;
   }
   
  

void draw() {
  background(255);
  stroke(255);
  pushMatrix();
    translate(width/2, height/2, 0);
    rotateY(angle);
    rotateX(0.2);

     shape(object);
  popMatrix();
  
  if(!mousePressed)
  {
      angle += 0.05;

  }
}
