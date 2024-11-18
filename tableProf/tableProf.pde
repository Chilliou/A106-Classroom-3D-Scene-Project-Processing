float angle = 0f;
PShape piedHorizontal1,piedHorizontal2,piedHorizontal3,piedHorizontal4;
PShape plateau;
PImage imageMetal,imageBois ;
PShape object;

void setup() {
  size(600, 600, P3D);
  imageMetal = loadImage("tablePied.jpg");
  imageBois = loadImage("tableBois.jpg");
  object = objecttable();

}

PShape objecttable()
{
   PShape table = createShape(GROUP);
   
   
   int iEpaisseurPied = 3;
   int iHauteurPiedVertical = 75;
   
   int iLargeurPlateau = 65;
   int iEpaisseurPlateau = 2;
   int iLongueurPlateau = 130;
  
  plateau = cubeMagique(iLongueurPlateau,iEpaisseurPlateau,iLargeurPlateau,imageBois);

  piedHorizontal1 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  piedHorizontal2 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  piedHorizontal3 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  piedHorizontal4 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);

  table.beginShape(GROUP);
  table.addChild(piedHorizontal1);
  table.addChild(piedHorizontal2);
  table.addChild(piedHorizontal3);
  table.addChild(piedHorizontal4);
  table.addChild(plateau);
  
  iLargeurPlateau = 65-3;
  iLongueurPlateau = 130-3;
  piedHorizontal1.translate(iLongueurPlateau-2,0,iLargeurPlateau);
  piedHorizontal2.translate(-iLongueurPlateau,0,iLargeurPlateau);  
  piedHorizontal3.translate(iLongueurPlateau,0,-iLargeurPlateau);
  piedHorizontal4.translate(-iLongueurPlateau,0,-iLargeurPlateau);  
  plateau.translate(0,-77,0);

  
  return table;
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
      angle += 0.02;

  }
}
