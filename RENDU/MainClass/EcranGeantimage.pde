PImage[] images;  // Tableau pour stocker les images pour le front de l'écran
int imageIndex = 0;  // Indice de l'image actuelle
int changeInterval = 60;  // Intervalle de changement en millisecondes
int lastChangeTime = 0;  // Temps du dernier changement d'image

PShape socleGeant, piedGeant, supportGeant;
PShape bordEcranGeantBas, bordEcranGeantDroite, bordEcranGeantGauche, bordEcranGeantHaut;
PShape ecranGeantShape, frontShape;
PShape oEcranGeant;


PShape objectEcranGeant() {
  PShape ecranGeant = createShape(GROUP);

  int iSocleLargeur = 60;
  int iSocleLongueur = 80;
  int iSocleHauteur = 10;
  
  int iSupportLargeur = 20;
  int iSupportLongueur = 80;
  int iSupportHauteur = 50;
  
  int iPiedLargeur = 30;
  int iPiedLongueur = 50;
  int iPiedHauteur = 150;
  
  int iEcranGeantVertical = 100;
  int iEcranGeantHorizontal = 180;
  int iEcranGeantBordLargeur = 10;

  socleGeant = cubeMagique(iSocleLongueur, iSocleHauteur, iSocleLargeur, imageMetal, false);
  supportGeant = cubeMagique(iSupportLongueur, iSupportHauteur, iSupportLargeur, imageMetal, false);
  piedGeant = cubeMagique(iPiedLongueur, iPiedHauteur, iPiedLargeur, imageMetal, false);

  // Créer l'écran avec une face avant animée
  
  bordEcranGeantBas = cubeMagique(iEcranGeantHorizontal, iEcranGeantBordLargeur, iEcranGeantBordLargeur, imageMetal, false);
  bordEcranGeantHaut = cubeMagique(iEcranGeantHorizontal, iEcranGeantBordLargeur, iEcranGeantBordLargeur, imageMetal, false);
  bordEcranGeantDroite = cubeMagique(iEcranGeantBordLargeur, iEcranGeantVertical + 20, iEcranGeantBordLargeur, imageMetal, false);
  bordEcranGeantGauche = cubeMagique(iEcranGeantBordLargeur, iEcranGeantVertical + 20, iEcranGeantBordLargeur, imageMetal, false);
  
   ecranGeantShape = cubeMagique(iEcranGeantHorizontal, iEcranGeantVertical, iEcranGeantBordLargeur, imageMetal, true);


  ecranGeant.addChild(socleGeant);
  ecranGeant.addChild(piedGeant);
  ecranGeant.addChild(supportGeant);
  ecranGeant.addChild(bordEcranGeantBas);
  ecranGeant.addChild(bordEcranGeantHaut);
  ecranGeant.addChild(bordEcranGeantDroite);
  ecranGeant.addChild(bordEcranGeantGauche);
  ecranGeant.addChild(ecranGeantShape);


  socleGeant.translate(0, 150, 0);
  supportGeant.translate(0, -100, -30);
  ecranGeantShape.translate(0, -100, 50);
  
  bordEcranGeantBas.translate(0, 10, -50);
  bordEcranGeantHaut.translate(0, -210, -50);
  bordEcranGeantDroite.translate(190, -100, -50);
  bordEcranGeantGauche.translate(-190, -100, -50);
  
  ecranGeantShape.rotateY(PI);

  return ecranGeant;
}

PShape cubeMagique(int tailleX, int tailleY, int tailleZ, PImage texture, boolean ecranGeant) {
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
    if (p == frontShape && ecranGeant) {
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
