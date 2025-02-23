PShape boite;

PImage imageEst ;
PImage imageOuest ;
PImage imageNord;
PImage imageSud;
PImage imageHeaven ;
PImage imageHell ;

PShape carre(){
  
  
  float size = 5000;
  PShape s = createShape(GROUP);

    
      
      PShape ouest = createShape();
      ouest.beginShape(QUADS);
      ouest.textureMode(NORMAL);
      ouest.texture(imageOuest);
      ouest.shininess(200.0);
      ouest.emissive(255);
      ouest.normal(-1, 0, 0);
      ouest.scale(1, -1);  //bizarre

      
      PShape est = createShape();
      est.beginShape(QUADS);
      est.textureMode(NORMAL);
      est.texture(imageEst);
      est.shininess(200.0);
      est.emissive(255);
      est.normal(1, 0, 0);
      
      PShape sud = createShape();
      sud.beginShape(QUADS);
      sud.textureMode(NORMAL);
      sud.texture(imageSud);
      sud.shininess(200.0);
      sud.emissive(255);
      sud.normal(0, 0, -1);
      
      PShape nord = createShape();
      nord.beginShape(QUADS);
      nord.textureMode(NORMAL);
      nord.texture(imageNord);
      nord.shininess(200.0);
      nord.emissive(255);
      nord.normal(0, 0, 1);
      
      PShape heaven = createShape();
      heaven.beginShape(QUADS);
      heaven.textureMode(NORMAL);
      heaven.texture(imageHeaven);
      heaven.shininess(200.0);
      heaven.emissive(255);
      heaven.normal(0, -1, 0);

      PShape hell = createShape();
      hell.beginShape(QUADS);
      hell.textureMode(NORMAL);
      hell.texture(imageHell);
      hell.shininess(200.0);
      hell.emissive(255);
      hell.normal(0, 1, 0);
         
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
