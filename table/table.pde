float angle = 0f;
PShape pad1,pad2,pad3,pad4 ;
PShape piedHorizontal1,piedHorizontal2;
PShape piedVertical1,piedVertical2;
PShape plateauBois;
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
   
   int iEpaisseurPad = 2;
   int iTaillePad = 10;
   
   
   int iEpaisseurPied = 10;
   int iLargeurPiedHorizontal = 100;
   int iHauteurPiedVertical = 75;
   
   int iLargeurBois = 100;
   int iEpaisseurBois = 5;
   int iHauteurBois = 100;
  
  pad1 = cubeMagique(iTaillePad,iEpaisseurPad,iTaillePad,imageMetal);
  pad2 = cubeMagique(iTaillePad,iEpaisseurPad,iTaillePad,imageMetal);
  pad3 = cubeMagique(iTaillePad,iEpaisseurPad,iTaillePad,imageMetal);
  pad4 = cubeMagique(iTaillePad,iEpaisseurPad,iTaillePad,imageMetal);

  
  piedHorizontal1 = cubeMagique(iEpaisseurPied,iEpaisseurPied,iLargeurPiedHorizontal,imageMetal);
  piedHorizontal2 = cubeMagique(iEpaisseurPied,iEpaisseurPied,iLargeurPiedHorizontal,imageMetal);
  
  piedVertical1 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  piedVertical2 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  
  plateauBois = cubeMagique(iLargeurBois,iEpaisseurBois,iHauteurBois,imageBois);
  
  table = createShape(GROUP);
  table.addChild(pad1);
  table.addChild(pad2);
  table.addChild(pad3);
  table.addChild(pad4);
  
  table.addChild(piedHorizontal1);
  table.addChild(piedHorizontal2);
  
  table.addChild(piedVertical1);
  table.addChild(piedVertical2);
  
  table.addChild(plateauBois);
  
  int iEcartement = iLargeurPiedHorizontal-iTaillePad;
  pad1.translate(iEcartement,50,iEcartement);
  pad2.translate(-iEcartement,50,iEcartement);  
  pad3.translate(iEcartement,50,-iEcartement);
  pad4.translate(-iEcartement,50,-iEcartement);  
  
  piedHorizontal1.translate(iEcartement,38,0);
  piedHorizontal2.translate(-iEcartement,38,0);
  
  piedVertical1.translate(-iEcartement,-28,iEcartement);
  piedVertical2.translate(iEcartement,-28,iEcartement);
  
  plateauBois.translate(0,-108,0);

  
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
