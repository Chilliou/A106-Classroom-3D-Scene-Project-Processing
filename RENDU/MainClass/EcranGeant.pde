private PShape socle,pied,support;
private PShape bordEcranBas,bordEcranDroite,bordEcranGauche,bordEcranHaut;
private PShape ecranShape;
private PImage imageEcran;

PShape objectEcran()
{
   PShape ecran = createShape(GROUP);

   
   int iSocleLargeur = 20;
   int iSocleLongueur = 30;
   int iSocleHauteur = 3;
   
   int iSupportLargeur = 7;
   int iSupportLongueur = 30;
   int iSupportHauteur = 15; 
   
   int iPiedLargeur = 10;
   int iPiedLongueur = 15;
   int iPiedHauteur = 40;
   
   int iEcranVertical = 30;
   int iEcranHorizontal = 50;
   int iEcranBordLargeur = 3;
  
  socle = cubeMagique(iSocleLongueur,iSocleHauteur,iSocleLargeur,imageEcran);
  
  support = cubeMagique(iSupportLongueur,iSupportHauteur,iSupportLargeur,imageEcran);
  
  pied = cubeMagique(iPiedLongueur,iPiedHauteur,iPiedLargeur,imageEcran);
  
  ecranShape = cubeMagique(iEcranHorizontal,iEcranVertical,iEcranBordLargeur,imageEcran);
  
  bordEcranBas = cubeMagique(iEcranHorizontal,iEcranBordLargeur,iEcranBordLargeur,imageEcran);
  bordEcranHaut = cubeMagique(iEcranHorizontal,iEcranBordLargeur,iEcranBordLargeur,imageEcran);
  bordEcranDroite = cubeMagique(iEcranBordLargeur,iEcranVertical+6,iEcranBordLargeur,imageEcran);
  bordEcranGauche = cubeMagique(iEcranBordLargeur,iEcranVertical+6,iEcranBordLargeur,imageEcran);

  
  ecran = createShape(GROUP);
  ecran.addChild(socle);
  ecran.addChild(pied);
  ecran.addChild(support);
  
  ecran.addChild(ecranShape);
  
  ecran.addChild(bordEcranBas);
  ecran.addChild(bordEcranHaut);
  ecran.addChild(bordEcranDroite);
  ecran.addChild(bordEcranGauche);

  socle.translate(0,40,0);
  support.translate(0,-30,-10);
  ecranShape.translate(0,-30,-15);
  
  bordEcranBas.translate(0,3,-15);
  bordEcranHaut.translate(0,-63,-15);
  
  bordEcranDroite.translate(53,-30,-15);
  bordEcranGauche.translate(-53,-30,-15);

  scale(0.1); //Plus très géant du coup
  return ecran;
}
