class Camera {
  PVector position;
  PVector lookAt;
  float moveSpeed = 6;
  float angleX = 0;
  float angleY = 0;
  
  int taillePerso = 300;
  
  Camera() {
    position = new PVector(0, 300, 500);
    lookAt = new PVector(0, 0, 0);
  }
  
  void update() {
    // Calculer la direction de vue
    PVector direction = PVector.sub(lookAt, position);
    direction.normalize();
    
    // Vecteur latéral
    PVector right = direction.cross(new PVector(0, 1, 0));
    right.normalize();
    
    // Mouvements ZQSD
    if (keyPressed) {
      if (key == 'z' ||key == 'Z' ) {
        position.add(PVector.mult(direction, moveSpeed));
        lookAt.add(PVector.mult(direction, moveSpeed));
      }
      if (key == 's' ||key == 'S') {
        position.sub(PVector.mult(direction, moveSpeed));
        lookAt.sub(PVector.mult(direction, moveSpeed));
      }
      if (key == 'q' ||key == 'Q') {
        position.add(PVector.mult(right.mult(-1), moveSpeed));
        lookAt.add(PVector.mult(right.mult(-1), moveSpeed));
      }
      if (key == 'd' ||key == 'D' ) {
        position.add(PVector.mult(right, moveSpeed));
        lookAt.add(PVector.mult(right, moveSpeed));
      }
      
      // Monter/descendre
      if (key == ' ') {
        position.y -= moveSpeed;
        lookAt.y -= moveSpeed;
      }
      if (keyCode == SHIFT) {
        position.y += moveSpeed;
        lookAt.y += moveSpeed;
      }
    }
    
    // Rotation avec souris
    angleY -= (mouseX - pmouseX) * 0.005;
    angleX += (mouseY - pmouseY) * 0.005;
    
    // Limiter l'angle X
    angleX = constrain(angleX, -PI/2, PI/2);
    
    // Recalculer lookAt
    PVector direction2 = new PVector(
      sin(angleY) * cos(angleX),
      sin(angleX),
      cos(angleY) * cos(angleX)
    );
    lookAt = PVector.add(position, direction2);
    
    
  }
  
  void apply() {
    camera(position.x, position.y, position.z, 
           lookAt.x, lookAt.y, lookAt.z, 
           0, 1, 0);
           
  }
}
