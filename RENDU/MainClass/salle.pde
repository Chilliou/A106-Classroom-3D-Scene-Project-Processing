PShape murBasEst,murHautEst,vitreEst;
PShape murBasOuest,murHautOuest,vitreOuest;

PShape murSud,murNord;
PShape plafond, sol;
PShape vitre;
PImage imageSol,imageMur,imageVitre ;
PShape pObjectSalle;


void objectVitre1()
{
     vitreEst = createShape(GROUP);
     vitreOuest = createShape(GROUP);

  
     int iLongueurSalle = 1000;
   int iLargeurSalle = 600;
   int iLhauteurSalle = 250;
   
   int iHauteurMurBas = 80;
   int iHauteurMurHaut = 11;
   int iHauteurVitre = 150;
   
   int iEpaisseurMur = 10;
  vitreEst = cubeMagique(iLongueurSalle,iHauteurVitre,iEpaisseurMur,imageVitre);
  vitreEst.translate(0,-70,iLargeurSalle);
  
   vitreOuest = cubeMagique(iLongueurSalle,iHauteurVitre,iEpaisseurMur,imageVitre);
  vitreOuest.translate(0,-70,-iLargeurSalle);
  
  vitreEst.scale(1.2);
  vitreOuest.scale(1.2);
  
}


PShape objectSalle()
{
   PShape salle = createShape(GROUP);
   
        int iLongueurSalle = 1000;
   int iLargeurSalle = 600;
   int iLhauteurSalle = 250;
   
   int iHauteurMurBas = 80;
   int iHauteurMurHaut = 11;
   int iHauteurVitre = 150;

   
   int iEpaisseurMur = 10;

   

  murBasEst = cubeMagique(iLongueurSalle,iHauteurMurBas,iEpaisseurMur,imageMur);
  murHautEst = cubeMagique(iLongueurSalle,iHauteurMurHaut,iEpaisseurMur,imageMur);
  
  murBasOuest = cubeMagique(iLongueurSalle,iHauteurMurBas,iEpaisseurMur,imageMur);
  murHautOuest = cubeMagique(iLongueurSalle,iHauteurMurHaut,iEpaisseurMur,imageMur);
  
  murSud = cubeMagique(iEpaisseurMur,iLhauteurSalle,iLargeurSalle,imageMur);
  murNord = cubeMagique(iEpaisseurMur,iLhauteurSalle,iLargeurSalle,imageMur);
  
  plafond = cubeMagique(iLongueurSalle,iEpaisseurMur,iLargeurSalle,imageMur);
  sol = cubeMagique(iLongueurSalle,iEpaisseurMur,iLargeurSalle,imageSol);
  
  salle = createShape(GROUP);
  salle.addChild(murSud);
  salle.addChild(murBasEst);
  salle.addChild(murHautEst);
  salle.addChild(murBasOuest);
  salle.addChild(murHautOuest);
  salle.addChild(murNord);
  salle.addChild(plafond);
  salle.addChild(sol);
  
  
  murSud.translate(iLongueurSalle,0,0);
  murNord.translate(-iLongueurSalle,0,0);
  
  murBasEst.translate(0,160,iLargeurSalle);
  murHautEst.translate(0,-231,iLargeurSalle);
  
  murBasOuest.translate(0,160,-iLargeurSalle);
  murHautOuest.translate(0,-231,-iLargeurSalle);
  
  plafond.translate(0,-iLhauteurSalle,0);
  sol.translate(0,iLhauteurSalle,0);
  
  salle.scale(1.2);
  
  return salle;
}


   
  
