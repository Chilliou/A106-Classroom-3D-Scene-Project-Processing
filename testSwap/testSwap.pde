PImage[] images;  // Tableau pour stocker les images
int imageIndex = 0;  // Indice de l'image actuelle
int changeInterval = 60;  // Intervalle de changement en millisecondes
int lastChangeTime = 0;  // Temps du dernier changement d'image

PShape texturedRect;  // Shape pour stocker le rectangle texturé

void setup() {
  size(800, 600, P3D);  // Mode 3D nécessaire pour utiliser les textures
  
  // Charger les images dans un tableau
  images = new PImage[53];
  for(int i=0;i<images.length;i++)
    images[i] = loadImage("./gif/giphy-"+i+".jpg");


  // Créer la forme (rectangle) avec texture une seule fois
  texturedRect = createShape();
  texturedRect.beginShape();
  texturedRect.noFill();
  texturedRect.texture(images[imageIndex]);  // Appliquer l'image initiale comme texture
  texturedRect.vertex(100, 100, 0, 0);  // Coin supérieur gauche
  texturedRect.vertex(700, 100, images[imageIndex].width, 0);  // Coin supérieur droit
  texturedRect.vertex(700, 500, images[imageIndex].width, images[imageIndex].height);  // Coin inférieur droit
  texturedRect.vertex(100, 500, 0, images[imageIndex].height);  // Coin inférieur gauche
  texturedRect.endShape(CLOSE);
}

void draw() {
  background(255);
  
  // Vérifier s'il est temps de changer d'image
  if (millis() - lastChangeTime > changeInterval) {
    imageIndex = (imageIndex + 1) % images.length;  // Passer à l'image suivante
    lastChangeTime = millis();  // Mettre à jour le dernier changement

    // Mettre à jour la texture de la forme
    texturedRect.setTexture(images[imageIndex]);
  }
  
  // Afficher la forme texturée
  shape(texturedRect);
}
