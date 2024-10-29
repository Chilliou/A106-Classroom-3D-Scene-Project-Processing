float angle = 0f;
PShape oui;
PShape boite;
PShape oui2;
float norme = 0;

float x, y, z;             // Coordonnées de position
float speed = 5;           // Vitesse de déplacement
float angleX = 0;          // Angle de rotation horizontal (autour de l'axe Y)
float angleY = 0;          // Angle de rotation vertical (autour de l'axe X)
float sensibility = 0.01; // Sensibilité de la souris
float dx, dz;              // Composantes de direction du mouvement

PImage imageEst ;
PImage imageOuest ;
PImage imageNord;
PImage imageSud;
PImage imageHeaven ;
PImage imageHell ;



void setup() {
  size(600, 600, P3D);
  
 imageEst = loadImage("negx.jpg");
 imageOuest = loadImage("negz.jpg");
 imageNord = loadImage("posx.jpg");
 imageSud = loadImage("posz.jpg");
 imageHeaven = loadImage("posy.jpg");
 imageHell = loadImage("negy.jpg");
 
  x = width / 2;         // Position initiale au centre
  y = height / 2;
  z = 0;
  noCursor();            // Masquer le curseur pour une meilleure expérience de jeu

  
  boite = carre();
}



PShape carre(){
  float size = 1000;
  PShape s = createShape(GROUP);

    
      
      PShape ouest = createShape();
      ouest.beginShape(QUADS);
      ouest.textureMode(NORMAL);
      ouest.texture(imageOuest);
      ouest.shininess(200.0);
      ouest.emissive(0, 0, 0);
      ouest.normal(0, 0, 1);
      ouest.scale(1, -1);  //bizarre

      
      PShape est = createShape();
      est.beginShape(QUADS);
      est.textureMode(NORMAL);
      est.texture(imageEst);
      est.shininess(200.0);
      est.emissive(0, 0, 0);
      est.normal(0, 0, 1);
      
      PShape sud = createShape();
      sud.beginShape(QUADS);
      sud.textureMode(NORMAL);
      sud.texture(imageSud);
      sud.shininess(200.0);
      sud.emissive(0, 0, 0);
      sud.normal(0, 0, 1);
      
      PShape nord = createShape();
      nord.beginShape(QUADS);
      nord.textureMode(NORMAL);
      nord.texture(imageNord);
      nord.shininess(200.0);
      nord.emissive(0, 0, 0);
      nord.normal(0, 0, 1);
      
      PShape heaven = createShape();
      heaven.beginShape(QUADS);
      heaven.textureMode(NORMAL);
      heaven.texture(imageHeaven);
      heaven.shininess(200.0);
      heaven.emissive(0, 0, 0);
      heaven.normal(0, 0, 1);

      PShape hell = createShape();
      hell.beginShape(QUADS);
      hell.textureMode(NORMAL);
      hell.texture(imageHell);
      hell.shininess(200.0);
      hell.emissive(0, 0, 0);
      hell.normal(0, 0, 1);
         
      ouest.vertex(-size,-size,-size,0,0);
      ouest.vertex(size,-size,-size,0,1);
      ouest.vertex(size,size,-size,1,1);
      ouest.vertex(-size,size,-size,1,0);
      ouest.rotate(PI/2.0);
      ouest.noStroke();
      ouest.endShape();
      
      est.vertex(-size,-size,-size,0,0);
      est.vertex(size,-size,-size,0,1);
      est.vertex(size,-size,size,1,1);
      est.vertex(-size,-size,size,1,0);
      est.rotate(PI/2.0);
      est.noStroke();
      est.endShape();

      nord.vertex(-size,size,size,0,0);
      nord.vertex(size,size,size,0,1);
      nord.vertex(size,size,-size,1,1);    
      nord.vertex(-size,size,-size,1,0);
      nord.rotate(PI/2.0);
      nord.noStroke();
      nord.endShape();

      heaven.vertex(-size,-size,-size,0,0);
      heaven.vertex(-size,-size,size,0,1);
      heaven.vertex(-size,size,size,1,1);
      heaven.vertex(-size,size,-size,1,0);
      heaven.rotate(PI/2.0);     
      heaven.noStroke();
      heaven.endShape();

      hell.vertex(size,-size,size,0,0);
      hell.vertex(size,-size,-size,0,1);
      hell.vertex(size,size,-size,1,1);
      hell.vertex(size,size,size,1,0);
      hell.rotate(PI/2.0);
      hell.noStroke();
      hell.endShape();

      sud.vertex(-size,-size,size,0,0);
      sud.vertex(size,-size,size,0,1);
      sud.vertex(size,size,size,1,1);
      sud.vertex(-size,size,size,1,0);
      sud.rotate(PI/2.0);
      sud.noStroke();
      sud.endShape();
      
      
  s.addChild(ouest);
  s.addChild(est);
  s.addChild(sud);
  s.addChild(nord);
  s.addChild(hell);
  s.addChild(heaven);
  
  return s;
}


void bouger() {
  dx = 0;  
  dz = 0;
  
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      dz = -1;  
    } 
    if (key == 's' || key == 'S') {
      dz = 1;  
    } 
    if (key == 'q' || key == 'Q') {
      dx = 1;
    } 
    if (key == 'd' || key == 'D') {
      dx = -1;   
    }
    if (key == ' ') {  
      y -= speed;
    } 
    if (keyCode == SHIFT) {  
      y += speed;
    }
  }
  
  float moveX = cos(angleX) * dz + cos(angleX + HALF_PI) * dx;
  float moveZ = sin(angleX) * dz + sin(angleX + HALF_PI) * dx;
  
  x += moveX * speed;
  z += moveZ * speed;
}

void gererSouris() {
  float mouseDeltaX = (mouseX - width / 2) * sensibility;
  System.out.println("La valeur y est "+mouseY);
 float mouseDeltaY = -(mouseY - height / 2) * sensibility;

  angleX = mouseDeltaX;
  angleY = mouseDeltaY;
  
}

void draw() {
  background(255);
  stroke(255);

  bouger();        
  gererSouris();  
   camera(x + cos(angleX) * cos(angleY),  
         y + sin(angleY),                
         z + sin(angleX) * cos(angleY),  
         x, y, z, 
         0, 1, 0);                       
         
         
  pushMatrix();
    shape(boite);
  popMatrix();


}
