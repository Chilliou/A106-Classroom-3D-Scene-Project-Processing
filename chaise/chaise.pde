float angle = 0f;
PShape piedAvant1, piedAvant2;
PShape piedArriere1, piedArriere2;
PShape assise, dossier;
PImage imageMetal,imageBois ;
PShape oui;

void setup() {
  size(600, 600, P3D);
   imageMetal = loadImage("chaisePied.jpg");
   imageBois = loadImage("chaiseBois.jpg");
  oui = objectChaise();
  
}

PShape objectChaise()
{
   PShape chaise = createShape(GROUP);
   
   int iEpaisseurPied = 10;
   int iHauteurPetitPied = 50;
   int iHauteurGrandPied = 100;
   int iLargeurBois = 50;
   int iEpaisseurBois = 2;
   int iHauteurBois = 30;

  
  piedAvant1 = cubeMagique(iEpaisseurPied,iHauteurPetitPied,iEpaisseurPied,imageMetal);
  piedAvant2 = cubeMagique(iEpaisseurPied,iHauteurPetitPied,iEpaisseurPied,imageMetal);
  
  piedArriere1 = cubeMagique(iEpaisseurPied,iHauteurGrandPied,iEpaisseurPied,imageMetal);
  piedArriere2 = cubeMagique(iEpaisseurPied,iHauteurGrandPied,iEpaisseurPied,imageMetal);
  
  assise = cubeMagique(iLargeurBois,iEpaisseurBois,iHauteurBois,imageBois);
  dossier = cubeMagique(iLargeurBois,iHauteurBois,iEpaisseurBois,imageBois);
  
  chaise = createShape(GROUP);
  chaise.addChild(piedAvant1);
  chaise.addChild(piedAvant2);
  chaise.addChild(piedArriere1);
  chaise.addChild(piedArriere2);
  chaise.addChild(assise);
  chaise.addChild(dossier);
  
  piedAvant1.translate(-40,50,-30);
  piedAvant2.translate(40,50,-30);
  
  piedArriere1.translate(-40,0,30);
  piedArriere2.translate(40,0,30);
  
  assise.translate(0,0,-10);
  dossier.translate(0,-70,20);
  
  return chaise;
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

    
    topShape.beginShape(QUADS);
    topShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    topShape.vertex(-tailleX,-tailleY,tailleZ, 0, 1); //Point D
    topShape.vertex(-tailleX,-tailleY,-tailleZ, 1, 1);//Point E
    topShape.vertex(tailleX,-tailleY,-tailleZ, 1, 0); //Point F
       
    bottomShape.beginShape(QUADS);
    bottomShape.vertex(-tailleX,tailleY,tailleZ, 0, 0);  //Point C
    bottomShape.vertex(tailleX,tailleY,tailleZ, 0, 1);   //Point B
    bottomShape.vertex(tailleX,tailleY,-tailleZ, 1, 1);  //Point G
    bottomShape.vertex(-tailleX,tailleY,-tailleZ, 1, 0); //Point H
      
   
    leftShape.beginShape(QUADS);
    leftShape.vertex(-tailleX,tailleY,tailleZ, 0, 0);  //Point C
    leftShape.vertex(-tailleX,-tailleY,tailleZ, 0, 1); //Point D
    leftShape.vertex(-tailleX,-tailleY,-tailleZ, 1, 1);//Point E
    leftShape.vertex(-tailleX,tailleY,-tailleZ, 1, 0); //Point H
      
    
    rightShape.beginShape(QUADS);
    rightShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    rightShape.vertex(tailleX,-tailleY,-tailleZ, 0, 1); //Point F
    rightShape.vertex(tailleX,tailleY,-tailleZ, 1, 1);  //Point G
    rightShape.vertex(tailleX,tailleY,tailleZ, 1, 0);   //Point B
      
    
    frontShape.beginShape(QUADS);
    frontShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    frontShape.vertex(tailleX,tailleY,tailleZ, 0, 1);   //Point B
    frontShape.vertex(-tailleX,tailleY,tailleZ, 1, 1);  //Point C
    frontShape.vertex(-tailleX,-tailleY,tailleZ, 1, 0); //Point D

    
    backShape.beginShape(QUADS);
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

     shape(oui);
  popMatrix();
  
  if(!mousePressed)
  {
      angle += 0.05;

  }
}
