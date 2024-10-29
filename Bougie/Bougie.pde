float angle = 0f;
PShape oui;
PShape boite;
PShape oui2;
float norme = 0;
PShader lightShader;

float rayon = 800;
float theta = 0;
float phi = 0;
float camX = 0;
float camY = 0;
float camZ = 0;



void setup() {
  size(600, 600, P3D);
  lightShader = loadShader("Phong1DiffuseFrag.glsl", "Phong1DiffuseVert.glsl");
  oui2 = dorianIco(100);
}

PShape dorianIco(int iCote){
    PShape ico = createShape();
   ico.beginShape(TRIANGLES);
    ico.fill(255);
     float c = 1*iCote;
     float or = ((1 + sqrt(5))/2)*iCote;
     
     //ROUGE
     PVector zero = new PVector(or,c,0);  
     PVector quatre = new PVector(or,-c,0);  
     PVector onze = new PVector(-or,c,0); 
     PVector sept = new PVector(-or,-c,0); 
     
     norme = zero.mag();
     
     //GREEEN
     PVector un = new PVector(c,0,or);  
     PVector deux = new PVector(-c,0,or); 
     PVector neuf = new PVector(c,0,-or);  
     PVector dix = new PVector(-c,0,-or); 
     
     //BLUE
     PVector trois = new PVector(0,or,c); 
     PVector huit = new PVector(0,or,-c); 
     PVector cinq = new PVector(0,-or,c); 
     PVector six = new PVector(0,-or,-c); 
       
     int reca = 4;
     
     ico.vertex(zero.x,zero.y,zero.z);
     ico.vertex(un.x,un.y,un.z);
     ico.vertex(quatre.x,quatre.y,quatre.z);
     
     recTriangle(reca,zero,un,quatre,ico);
     
     ico.vertex(zero.x,zero.y,zero.z);
     ico.vertex(neuf.x,neuf.y,neuf.z);
     ico.vertex(quatre.x,quatre.y,quatre.z);
     
      recTriangle(reca,zero,neuf,quatre,ico);

     
     ico.vertex(onze.x,onze.y,onze.z);
     ico.vertex(deux.x,deux.y,deux.z);
     ico.vertex(sept.x,sept.y,sept.z);
     
     recTriangle(reca,onze,deux,sept,ico);

     
     ico.vertex(onze.x,onze.y,onze.z);
     ico.vertex(dix.x,dix.y,dix.z);
     ico.vertex(sept.x,sept.y,sept.z);
     
      recTriangle(reca,onze,dix,sept,ico);


    /////////////////////

     ico.vertex(trois.x,trois.y,trois.z);
     ico.vertex(zero.x,zero.y,zero.z);
     ico.vertex(huit.x,huit.y,huit.z);
     
      recTriangle(reca,trois,zero,huit,ico);

     
     ico.vertex(trois.x,trois.y,trois.z);
     ico.vertex(onze.x,onze.y,onze.z);
     ico.vertex(huit.x,huit.y,huit.z);
     
      recTriangle(reca,trois,onze,huit,ico);

     
     ico.vertex(cinq.x,cinq.y,cinq.z);
     ico.vertex(quatre.x,quatre.y,quatre.z);
     ico.vertex(six.x,six.y,six.z);
     
       recTriangle(reca,cinq,quatre,six,ico);

     
     ico.vertex(cinq.x,cinq.y,cinq.z);
     ico.vertex(sept.x,sept.y,sept.z);
     ico.vertex(six.x,six.y,six.z);
     
      recTriangle(reca,cinq,sept,six,ico);

     
     //////////////////////////////
          
     ico.vertex(sept.x,sept.y,sept.z);
     ico.vertex(dix.x,dix.y,dix.z);
     ico.vertex(six.x,six.y,six.z);
     
      recTriangle(reca,sept,dix,six,ico);

     
     ico.vertex(zero.x,zero.y,zero.z);
     ico.vertex(un.x,un.y,un.z);
     ico.vertex(trois.x,trois.y,trois.z);
     
      recTriangle(reca,zero,un,trois,ico);

     
     ico.vertex(onze.x,onze.y,onze.z);
     ico.vertex(deux.x,deux.y,deux.z); 
     ico.vertex(trois.x,trois.y,trois.z);
     
      recTriangle(reca,onze,deux,trois,ico);

     
     ico.vertex(quatre.x,quatre.y,quatre.z);
     ico.vertex(neuf.x,neuf.y,neuf.z); //bon
     ico.vertex(six.x,six.y,six.z); //  8  6
     
      recTriangle(reca,quatre,neuf,six,ico);

     
     
     //bas
     ico.vertex(quatre.x,quatre.y,quatre.z);
     ico.vertex(un.x,un.y,un.z); 
     ico.vertex(cinq.x,cinq.y,cinq.z);
     
      recTriangle(reca,quatre,un,cinq,ico);

     
     ico.vertex(sept.x,sept.y,sept.z);
     ico.vertex(deux.x,deux.y,deux.z); 
     ico.vertex(cinq.x,cinq.y,cinq.z);
     
      recTriangle(reca,sept,deux,cinq,ico);

     
     //haut
     ico.vertex(zero.x,zero.y,zero.z);
     ico.vertex(neuf.x,neuf.y,neuf.z); 
     ico.vertex(huit.x,huit.y,huit.z);
     
      recTriangle(reca,zero,neuf,huit,ico);

     
     ico.vertex(onze.x,onze.y,onze.z);
     ico.vertex(dix.x,dix.y,dix.z); 
     ico.vertex(huit.x,huit.y,huit.z);
     
     recTriangle(reca,onze,dix,huit,ico);


   
     ico.vertex(un.x,un.y,un.z);
     ico.vertex(cinq.x,cinq.y,cinq.z);
     ico.vertex(deux.x,deux.y,deux.z);
          recTriangle(reca,un,cinq,deux,ico);

     
     ico.vertex(neuf.x,neuf.y,neuf.z);
     ico.vertex(six.x,six.y,six.z);
     ico.vertex(dix.x,dix.y,dix.z);
          recTriangle(reca,neuf,six,dix,ico);

     
     ico.vertex(un.x,un.y,un.z);
     ico.vertex(trois.x,trois.y,trois.z);
     ico.vertex(deux.x,deux.y,deux.z);
          recTriangle(reca,un,trois,deux,ico);

     
     
     ico.vertex(neuf.x,neuf.y,neuf.z);
     ico.vertex(huit.x,huit.y,huit.z);
     ico.vertex(dix.x,dix.y,dix.z);
          recTriangle(reca,neuf,huit,dix,ico);


    
    ico.endShape(); 

  return ico;
}


  void recTriangle(int n, PVector a, PVector b, PVector c,PShape boite)
{    
    PVector ab;
    PVector ac;
    PVector bc;
  
  if(n > 0 )
  {
     ab = new PVector((a.x+b.x)/2, (a.y+b.y)/2,(a.z+b.z)/2);
     ac = new PVector((a.x+c.x)/2, (a.y+c.y)/2,(a.z+c.z)/2);
     bc = new PVector((b.x+c.x)/2, (b.y+c.y)/2,(b.z+c.z)/2);
     
     ab.normalize().mult(norme);
     ac.normalize().mult(norme);
     bc.normalize().mult(norme);

    n = n-1;
    recTriangle(n,ab,ac,bc,boite);
    recTriangle(n,a,ac,ab,boite);
    recTriangle(n,b,ab,bc,boite);    
    recTriangle(n,c,ac,bc,boite);
    
  }else{
    boite.noStroke();
    boite.fill(255,255,255  );
    
    PVector aCopy = new PVector(a.x,a.y,a.z).normalize();
    PVector bCopy = new PVector(b.x,b.y,b.z).normalize();
    PVector cCopy = new PVector(c.x,c.y,c.z).normalize();

    boite.shininess(200);
    boite.normal(aCopy.x,aCopy.y,aCopy.z);
    boite.vertex(a.x,a.y,a.z);
    
    boite.normal(bCopy.x,bCopy.y,bCopy.z);
    boite.vertex(b.x,b.y,b.z); 
    
    boite.normal(cCopy.x,cCopy.y,cCopy.z);
    boite.vertex(c.x,c.y,c.z);

  }

}

void bougerCamera() {
  camX = rayon * cos(phi) * sin(theta);
  camY = rayon * sin(phi);
  camZ = rayon * cos(phi) * cos(theta);

  theta += 0.01;
  phi   = -0.5;   
}

PVector[] lightPos = { 
  new PVector(300, -300, 300),
  new PVector(-300, 300, 300),
  new PVector(-300, 300, -300),
  new PVector(0, -300, 0)
};

PVector[] lightColor = {
  new PVector(255, 255, 0),
  new PVector(255, 100, 0),
  new PVector(255, 200, 0),
  new PVector(255, 0, 0)
};

int variationCoul = 60;
boolean monteDescend = true;
void bougie(){
  if (variationCoul >= 150) {
        monteDescend = false;
        variationCoul = 150; // Assurer de ne pas dépasser 150
    } else if (variationCoul <= 80) {
        monteDescend = true;
        variationCoul = 80; // Assurer de ne pas descendre en dessous de 50
    }

    if (monteDescend) {
        variationCoul += 1;
    } else {
        variationCoul -= 1;
    }
}

void draw() {
  background(0);
  stroke(255);
  shader(lightShader);
  
  bougerCamera();
  camera(camX, camY, camZ, 0, 0, 0, 0, 1, 0);
  
  ambientLight(10, 10, 10);
  
  for(int i=0; i<lightPos.length; i++) {
      lightSpecular(lightColor[i].x, variationCoul, lightColor[i].z);
      pointLight(lightColor[i].x, variationCoul, lightColor[i].z, 
                 lightPos[i].x, lightPos[i].y, lightPos[i].z);
  }  


  pushMatrix();
    shape(oui2);
  popMatrix();
  
  for(int i=0; i<lightPos.length; i++) {
      pushMatrix();
          noStroke();
          emissive(lightColor[i].x, variationCoul, lightColor[i].z);
          translate(lightPos[i].x, lightPos[i].y, lightPos[i].z);
          box(10, 10, 10);
      popMatrix();
  }
  emissive(0, 0, 0);
  bougie();

  
}
