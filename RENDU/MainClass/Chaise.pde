
private PShape piedAvant1, piedAvant2;
private PShape piedArriere1, piedArriere2;
private PShape assise, dossier;



PShape objectChaise()
{

    PShape chaise = createShape(GROUP);
   
   int iEpaisseurPied = 10;
   int iHauteurPetitPied = 50;
   int iHauteurGrandPied = 100;
   int iLargeurBois = 50;
   int iEpaisseurBois = 2;
   int iHauteurBois = 30;

  
  piedAvant1 = cubeMagique(iEpaisseurPied,iHauteurPetitPied,iEpaisseurPied,imageMetal);
  piedAvant2 = cubeMagique(iEpaisseurPied,iHauteurPetitPied,iEpaisseurPied,imageMetal);
  
  piedArriere1 = cubeMagique(iEpaisseurPied,iHauteurGrandPied,iEpaisseurPied,imageMetal);
  piedArriere2 = cubeMagique(iEpaisseurPied,iHauteurGrandPied,iEpaisseurPied,imageMetal);
  
  assise = cubeMagique(iLargeurBois,iEpaisseurBois,iHauteurBois,imageBois);
  dossier = cubeMagique(iLargeurBois,iHauteurBois,iEpaisseurBois,imageBois);
  
  chaise = createShape(GROUP);
  chaise.addChild(piedAvant1);
  chaise.addChild(piedAvant2);
  chaise.addChild(piedArriere1);
  chaise.addChild(piedArriere2);
  chaise.addChild(assise);
  chaise.addChild(dossier);
  
  piedAvant1.translate(-40,50,-30);
  piedAvant2.translate(40,50,-30);
  
  piedArriere1.translate(-40,0,30);
  piedArriere2.translate(40,0,30);
  
  assise.translate(0,0,-10);
  dossier.translate(0,-70,20);
  
  chaise.rotateY(PI);
  return chaise;
}
