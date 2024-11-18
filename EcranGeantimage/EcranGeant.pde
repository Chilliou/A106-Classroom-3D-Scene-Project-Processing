PImage[] images;  // Tableau pour stocker les images pour le front de l'écran
int imageIndex = 0;  // Indice de l'image actuelle
int changeInterval = 60;  // Intervalle de changement en millisecondes
int lastChangeTime = 0;  // Temps du dernier changement d'image

float angle = 0f;
PShape socle, pied, support;
PShape bordEcranBas, bordEcranDroite, bordEcranGauche, bordEcranHaut;
PShape ecranShape, frontShape;
PImage imageMetal;
PShape object;

void setup() {
  size(600, 600, P3D);
  imageMetal = loadImage("metal.jpg");

  // Charger plusieurs images pour le front de l'écran
  images = new PImage[53];
  for(int i=0;i<images.length;i++)
    images[i] = loadImage("./gif/giphy-"+i+".jpg");

  // Créer l'objet écran
  object = objectEcran();
}

PShape objectEcran() {
  PShape ecran = createShape(GROUP);

  int iSocleLargeur = 60;
  int iSocleLongueur = 80;
  int iSocleHauteur = 10;
  
  int iSupportLargeur = 20;
  int iSupportLongueur = 80;
  int iSupportHauteur = 50;
  
  int iPiedLargeur = 30;
  int iPiedLongueur = 50;
  int iPiedHauteur = 150;
  
  int iEcranVertical = 100;
  int iEcranHorizontal = 180;
  int iEcranBordLargeur = 10;

  socle = cubeMagique(iSocleLongueur, iSocleHauteur, iSocleLargeur, imageMetal, false);
  support = cubeMagique(iSupportLongueur, iSupportHauteur, iSupportLargeur, imageMetal, false);
  pied = cubeMagique(iPiedLongueur, iPiedHauteur, iPiedLargeur, imageMetal, false);

  // Créer l'écran avec une face avant animée
  
  bordEcranBas = cubeMagique(iEcranHorizontal, iEcranBordLargeur, iEcranBordLargeur, imageMetal, false);
  bordEcranHaut = cubeMagique(iEcranHorizontal, iEcranBordLargeur, iEcranBordLargeur, imageMetal, false);
  bordEcranDroite = cubeMagique(iEcranBordLargeur, iEcranVertical + 20, iEcranBordLargeur, imageMetal, false);
  bordEcranGauche = cubeMagique(iEcranBordLargeur, iEcranVertical + 20, iEcranBordLargeur, imageMetal, false);
  
   ecranShape = cubeMagique(iEcranHorizontal, iEcranVertical, iEcranBordLargeur, imageMetal, true);


  ecran.addChild(socle);
  ecran.addChild(pied);
  ecran.addChild(support);
  ecran.addChild(bordEcranBas);
  ecran.addChild(bordEcranHaut);
  ecran.addChild(bordEcranDroite);
  ecran.addChild(bordEcranGauche);
  ecran.addChild(ecranShape);


  socle.translate(0, 150, 0);
  support.translate(0, -100, -30);
  ecranShape.translate(0, -100, 50);
  
  bordEcranBas.translate(0, 10, -50);
  bordEcranHaut.translate(0, -210, -50);
  bordEcranDroite.translate(190, -100, -50);
  bordEcranGauche.translate(-190, -100, -50);
  
  ecranShape.rotateY(PI);

  return ecran;
}

PShape cubeMagique(int tailleX, int tailleY, int tailleZ, PImage texture, boolean ecran) {
  PShape cube = createShape(GROUP);
  PShape tabShape[] = new PShape[6];

  PShape topShape = createShape();
  PShape bottomShape = createShape();
  PShape leftShape = createShape();
  PShape rightShape = createShape();
  frontShape = createShape();  // La face avant de l'écran
  PShape backShape = createShape();

  tabShape[0] = topShape;
  tabShape[1] = bottomShape;
  tabShape[2] = leftShape;
  tabShape[3] = rightShape;
  tabShape[4] = frontShape;  // Attribuer frontShape pour la face avant
  tabShape[5] = backShape;

  for (PShape p : tabShape) {
    p.beginShape(QUADS);
  }

  // Définir les sommets de chaque face (comme dans le code original)
  topShape.vertex(tailleX, -tailleY, tailleZ, 0, 0);
  topShape.vertex(-tailleX, -tailleY, tailleZ, 0, 1);
  topShape.vertex(-tailleX, -tailleY, -tailleZ, 1, 1);
  topShape.vertex(tailleX, -tailleY, -tailleZ, 1, 0);
  
  bottomShape.vertex(-tailleX, tailleY, tailleZ, 0, 0);
  bottomShape.vertex(tailleX, tailleY, tailleZ, 0, 1);
  bottomShape.vertex(tailleX, tailleY, -tailleZ, 1, 1);
  bottomShape.vertex(-tailleX, tailleY, -tailleZ, 1, 0);

  leftShape.vertex(-tailleX, tailleY, tailleZ, 0, 0);
  leftShape.vertex(-tailleX, -tailleY, tailleZ, 0, 1);
  leftShape.vertex(-tailleX, -tailleY, -tailleZ, 1, 1);
  leftShape.vertex(-tailleX, tailleY, -tailleZ, 1, 0);

  rightShape.vertex(tailleX, -tailleY, tailleZ, 0, 0);
  rightShape.vertex(tailleX, -tailleY, -tailleZ, 0, 1);
  rightShape.vertex(tailleX, tailleY, -tailleZ, 1, 1);
  rightShape.vertex(tailleX, tailleY, tailleZ, 1, 0);

  frontShape.vertex(tailleX, -tailleY, tailleZ, 0, 0);
  frontShape.vertex(tailleX, tailleY, tailleZ, 0, 1);
  frontShape.vertex(-tailleX, tailleY, tailleZ, 1, 1);
  frontShape.vertex(-tailleX, -tailleY, tailleZ, 1, 0);

  backShape.vertex(-tailleX, -tailleY, -tailleZ, 0, 0);
  backShape.vertex(tailleX, -tailleY, -tailleZ, 0, 1);
  backShape.vertex(tailleX, tailleY, -tailleZ, 1, 1);
  backShape.vertex(-tailleX, tailleY, -tailleZ, 1, 0);

  for (PShape p : tabShape) {
    p.textureMode(NORMAL);
    p.texture(texture);
    if (p == frontShape && ecran) {
      frontShape.texture(images[imageIndex]);  // Appliquer la première image à frontShape
      frontShape.emissive(200, 0, 0);
    }
    p.shininess(200.0);
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

  // Mise à jour de la texture du frontShape toutes les `changeInterval` millisecondes
  if (millis() - lastChangeTime > changeInterval) {
    imageIndex = (imageIndex + 1) % images.length;
    frontShape.setTexture(images[imageIndex]);  // Changer la texture de frontShape uniquement
    lastChangeTime = millis();
  }

  if (!mousePressed) {
    angle += 0.05;
  }
}
