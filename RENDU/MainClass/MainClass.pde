private PShape shapeMonde;
Camera cam;

private PImage imageMetal;
PShader lightShader;

void setup() {
  size(1500, 1000, P3D);
  shapeMonde = objectMonde();
  objectVitre1();
  lightShader = loadShader("LightShaderTexFrag.glsl", "LightShaderTexVert.glsl");
   boite = carre();
   boite.translate(0,-3000,0); // On mets le monde a notre niveau et JAMAIS l'inverse

  
  cam = new Camera();
  noCursor();
}

PShape objectMonde()
{
  imageSol = loadImage("img/sol.jpg");
  imageMur = loadImage("img/mur.jpg");
  imageVitre = loadImage("img/blanc.png");
  imageEcran = loadImage("img/metal.jpg");
  imageMetal = loadImage("img/tablePied.jpg");
  imageBois = loadImage("img/tableBois.jpg");
  imageArdoise = loadImage("img/ardoise.jpg");
  
 imageEst = loadImage("monde/nx.png");
 imageOuest = loadImage("monde/nz.png");
 imageNord = loadImage("monde/px.png");
 imageSud = loadImage("monde/pz.png");
 imageHeaven = loadImage("monde/py.png");
 imageHell = loadImage("monde/ny.png");
 


  
  PShape monde = createShape(GROUP);
  oRangee1 = objectRangee(4);
  oRangee2 = objectRangee(6);
  oRangee3 = objectRangee(6);
  oRangee4 = objectRangee(5);
  oRangee5 = objectRangee(3);

  pObjectSalle = objectSalle();
  monde.addChild(oRangee1);
  monde.addChild(oRangee2);
  monde.addChild(oRangee3);
  monde.addChild(oRangee4);
  monde.addChild(oRangee5);
  

  oRangee1.translate(640,235,607);
  oRangee2.translate(260,235,607);
  oRangee3.translate(-140,235,607);
  oRangee4.translate(-540,235,607);
  oRangee5.translate(-940,235,607);
  
  
/////////////// Bureau du prof //////////////////
  oTableProf = objectTableProf();
  chaiseProf = objectChaise();
  
  monde.addChild(oTableProf);
  monde.addChild(chaiseProf);

  oTableProf.translate(640,212,-290);
  chaiseProf.rotateY(-PI/2);  

  chaiseProf.translate(760,185,-290);
///////////////////////////////////////////////


/////////////// Matos //////////////////
  oTableau = objectTableau();
  
  monde.addChild(oTableau);
  oTableau.translate(1235,50,0);
  
/////////////////////////////////////////////  
  images = new PImage[53];
  for(int i=0;i<images.length;i++)
    images[i] = loadImage("./gif/giphy-"+i+".jpg");

  // Créer l'objet écran
  oEcranGeant = objectEcranGeant();
  
  monde.addChild(oEcranGeant);
    oEcranGeant.rotateY(PI/1.5);
  oEcranGeant.translate(1000,120,-500);

  
///////////////////////////////////////////////

  
  monde.addChild(pObjectSalle);
  
  
  return monde;
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

    
    // TOP (haut)
    topShape.normal(0, -1, 0);
    topShape.vertex(tailleX, -tailleY, tailleZ, 1, 0);
    topShape.vertex(-tailleX, -tailleY, tailleZ, 0, 0);
    topShape.vertex(-tailleX, -tailleY, -tailleZ, 0, 1);
    topShape.vertex(tailleX, -tailleY, -tailleZ, 1, 1);

    // BOTTOM (bas)
    bottomShape.normal(0, 1, 0);
    bottomShape.vertex(-tailleX, tailleY, tailleZ, 0, 0);
    bottomShape.vertex(tailleX, tailleY, tailleZ, 1, 0);
    bottomShape.vertex(tailleX, tailleY, -tailleZ, 1, 1);
    bottomShape.vertex(-tailleX, tailleY, -tailleZ, 0, 1);

    // LEFT (gauche)
    leftShape.normal(-1, 0, 0);
    leftShape.vertex(-tailleX, tailleY, tailleZ, 1, 0);
    leftShape.vertex(-tailleX, -tailleY, tailleZ, 0, 0);
    leftShape.vertex(-tailleX, -tailleY, -tailleZ, 0, 1);
    leftShape.vertex(-tailleX, tailleY, -tailleZ, 1, 1);

    // RIGHT (droite)
    rightShape.normal(1, 0, 0);
    rightShape.vertex(tailleX, -tailleY, tailleZ, 0, 0);
    rightShape.vertex(tailleX, tailleY, tailleZ, 1, 0);
    rightShape.vertex(tailleX, tailleY, -tailleZ, 1, 1);
    rightShape.vertex(tailleX, -tailleY, -tailleZ, 0, 1);

    // FRONT (avant)
    frontShape.normal(0, 0, 1);
    frontShape.vertex(tailleX, -tailleY, tailleZ, 1, 1);
    frontShape.vertex(tailleX, tailleY, tailleZ, 1, 0);
    frontShape.vertex(-tailleX, tailleY, tailleZ, 0, 0);
    frontShape.vertex(-tailleX, -tailleY, tailleZ, 0, 1);

    // BACK (arrière)
    backShape.normal(0, 0, -1);
    backShape.vertex(-tailleX, -tailleY, -tailleZ, 0, 1);
    backShape.vertex(tailleX, -tailleY, -tailleZ, 1, 1);
    backShape.vertex(tailleX, tailleY, -tailleZ, 1, 0);
    backShape.vertex(-tailleX, tailleY, -tailleZ, 0, 0);

      
    
    for(PShape p : tabShape) // Normalement cette section devrait etre spécifique a chaque texture
    {
      p.textureMode(NORMAL);
      p.texture(texture);
      p.shininess(200.0); 
      p.emissive(0, 0, 0);
      p.endShape();
      cube.addChild(p);
    }
     
     return cube;
}

int hauteurLumiere = 220; // normalement 220

PVector[] lightPos = { 
  new PVector(0, hauteurLumiere, 0),
  new PVector(400, hauteurLumiere, 0),
  new PVector(800, hauteurLumiere, 0),
  new PVector(1600, hauteurLumiere, 0),
  
};




void draw() {
  background(255);
  stroke(255);
  shader(lightShader);


  cam.update();
  cam.apply();
  
  ambientLight(10, 10, 10); // + rend les mur trop blanc mais pas assez rend les bords du monde invisible
  
  for(int i=0; i<lightPos.length; i++) {
      //lightSpecular(10, 10, 10); pas beau avec
      pointLight(120, 120, 120, 
                 lightPos[i].x, lightPos[i].y, lightPos[i].z);

  }  
  

  pushMatrix();
    translate(width/2, height/2, 0);
    
    resetShader();
    shape(boite);
    shader(lightShader);
    
    shape(shapeMonde);    
    
    shape(vitreOuest);
    shape(vitreEst);      
  popMatrix();
  

  for(int i=0; i<lightPos.length; i++) {
      pushMatrix();
          noStroke();
          emissive(255, 255, 255);
          translate(lightPos[i].x, lightPos[i].y, lightPos[i].z);
          box(50, 5, 100);
      popMatrix();
  }
  
  // Mise à jour de la texture du frontShape toutes les `changeInterval` millisecondes
  if (millis() - lastChangeTime > changeInterval) {
    imageIndex = (imageIndex + 1) % images.length;
    frontShape.setTexture(images[imageIndex]);  // Changer la texture de frontShape uniquement
    lastChangeTime = millis();
  }


}
