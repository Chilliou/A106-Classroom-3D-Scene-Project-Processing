float angle = 0f;
PShape clavier;
PShape touche[][]; //22x6
PShape object;

void setup() {
  size(600, 600, P3D);

  object = objectClavier();

}

PShape objectClavier()
{
   PShape clavierShape = createShape(GROUP);
   
   touche = new PShape[44/2][13/2];
   
   
   int iClavierLargeur = 13;
   int iClavierLongueur = 44;
   int iClavierHauteur = 2;

  
  
  clavier = cubeMagique((iClavierLargeur/2)+2,iClavierHauteur,iClavierLongueur/2+2,0);

 
  for(int i =0;i<iClavierLongueur-1;i++)
  {
    for(int y =0;y<iClavierLargeur-1;y++)
    {
      if(i%2 == 0 && y%2 == 0)
      {
         touche[i/2][y/2] = cubeMagique(1,1,1,255);
        System.out.println("i : "+i+"et y : "+y );
        touche[i/2][y/2].translate(i,-2,y);
        clavierShape.addChild(touche[i/2][y/2]);
      }
     
    }
  }
  

  
  clavierShape.addChild(clavier);
  clavier.rotateY(PI/2);
  clavier.translate(21,0,6);


  return clavierShape;
}


PShape cubeMagique(int tailleX, int tailleY, int tailleZ,int couleur) {
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

    topShape.fill(couleur);
    topShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    topShape.vertex(-tailleX,-tailleY,tailleZ, 0, 1); //Point D
    topShape.vertex(-tailleX,-tailleY,-tailleZ, 1, 1);//Point E
    topShape.vertex(tailleX,-tailleY,-tailleZ, 1, 0); //Point F
       
    bottomShape.fill(couleur);   
    bottomShape.vertex(-tailleX,tailleY,tailleZ, 0, 0);  //Point C
    bottomShape.vertex(tailleX,tailleY,tailleZ, 0, 1);   //Point B
    bottomShape.vertex(tailleX,tailleY,-tailleZ, 1, 1);  //Point G
    bottomShape.vertex(-tailleX,tailleY,-tailleZ, 1, 0); //Point H
      
     leftShape.fill(couleur);
    leftShape.vertex(-tailleX,tailleY,tailleZ, 0, 0);  //Point C
    leftShape.vertex(-tailleX,-tailleY,tailleZ, 0, 1); //Point D
    leftShape.vertex(-tailleX,-tailleY,-tailleZ, 1, 1);//Point E
    leftShape.vertex(-tailleX,tailleY,-tailleZ, 1, 0); //Point H
      
    rightShape.fill(couleur);
    rightShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    rightShape.vertex(tailleX,-tailleY,-tailleZ, 0, 1); //Point F
    rightShape.vertex(tailleX,tailleY,-tailleZ, 1, 1);  //Point G
    rightShape.vertex(tailleX,tailleY,tailleZ, 1, 0);   //Point B
      
    frontShape.fill(couleur);
    frontShape.vertex(tailleX,-tailleY,tailleZ, 0, 0);  //Point A
    frontShape.vertex(tailleX,tailleY,tailleZ, 0, 1);   //Point B
    frontShape.vertex(-tailleX,tailleY,tailleZ, 1, 1);  //Point C
    frontShape.vertex(-tailleX,-tailleY,tailleZ, 1, 0); //Point D

    backShape.fill(couleur);
    backShape.vertex(-tailleX,-tailleY,-tailleZ, 0, 0);//Point E
    backShape.vertex(tailleX,-tailleY,-tailleZ, 0, 1); //Point F
    backShape.vertex(tailleX,tailleY,-tailleZ, 1, 1);  //Point G
    backShape.vertex(-tailleX,tailleY,-tailleZ, 1, 0); //Point H
      
    
    for(PShape p : tabShape)
    {
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
    scale(8);
    rotateY(angle);
    rotateX(0.2);

     shape(object);
  popMatrix();
  
  if(!mousePressed)
  {
      angle += 0.05;

  }
}
