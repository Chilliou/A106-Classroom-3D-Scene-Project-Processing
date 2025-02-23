PShape bordTableauBas,bordTableauBas2,bordTableauDroite,bordTableauGauche,bordTableauHaut;
PShape tableauShape;
PImage imageArdoise ;
PShape oTableau;



PShape objectTableau()
{
   PShape tableau = createShape(GROUP);
   
   int iTableauVertical = 125;
   int iTableauHorizontal = 400;
   int iTableauBordLargeur = 2;

  
  tableauShape = cubeMagique(iTableauHorizontal,iTableauVertical,iTableauBordLargeur,imageArdoise);
  
  bordTableauBas = cubeMagique(iTableauHorizontal,iTableauBordLargeur,iTableauBordLargeur,imageMetal);
  bordTableauBas2 = cubeMagique(iTableauHorizontal+2+2,iTableauBordLargeur,iTableauBordLargeur,imageMetal);
  bordTableauHaut = cubeMagique(iTableauHorizontal,iTableauBordLargeur,iTableauBordLargeur,imageMetal);
  bordTableauDroite = cubeMagique(iTableauBordLargeur,iTableauVertical+2,iTableauBordLargeur,imageMetal);
  bordTableauGauche = cubeMagique(iTableauBordLargeur,iTableauVertical+2,iTableauBordLargeur,imageMetal);

  
  tableau = createShape(GROUP);

  
  tableau.addChild(tableauShape);
  
  tableau.addChild(bordTableauBas);
  tableau.addChild(bordTableauBas2);
  tableau.addChild(bordTableauHaut);
  tableau.addChild(bordTableauDroite);
  tableau.addChild(bordTableauGauche);

  tableauShape.translate(0,-100,-50);
  
  bordTableauBas.translate(0,25,-50);
  bordTableauBas2.translate(0,25,-54);
  bordTableauHaut.translate(0,-227,-50);
  
  bordTableauDroite.translate(402,-100,-50);
  bordTableauGauche.translate(-402,-100,-50);

  tableau.rotateY(PI/2); 
  return tableau;
}
