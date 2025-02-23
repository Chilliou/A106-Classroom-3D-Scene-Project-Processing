PShape piedHorizontalTable1,piedHorizontalTable2,piedHorizontalTable3,piedHorizontalTable4;
PShape plateau;
PShape oTableProf;

PShape chaiseProf;


PShape objectTableProf()
{
   PShape table = createShape(GROUP);
   
   
   int iEpaisseurPied = 3;
   int iHauteurPiedVertical = 50;
   
   int iLargeurPlateau = 65;
   int iEpaisseurPlateau = 2;
   int iLongueurPlateau = 130;
  
  plateau = cubeMagique(iLongueurPlateau,iEpaisseurPlateau,iLargeurPlateau,imageBois);

  piedHorizontalTable1 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  piedHorizontalTable2 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  piedHorizontalTable3 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  piedHorizontalTable4 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);

  table.beginShape(GROUP);
  table.addChild(piedHorizontalTable1);
  table.addChild(piedHorizontalTable2);
  table.addChild(piedHorizontalTable3);
  table.addChild(piedHorizontalTable4);
  table.addChild(plateau);
  
  iLargeurPlateau = 65-iEpaisseurPied;
  iLongueurPlateau = 130-iEpaisseurPied;
  piedHorizontalTable1.translate(iLongueurPlateau-2,0,iLargeurPlateau);
  piedHorizontalTable2.translate(-iLongueurPlateau,0,iLargeurPlateau);  
  piedHorizontalTable3.translate(iLongueurPlateau,0,-iLargeurPlateau);
  piedHorizontalTable4.translate(-iLongueurPlateau,0,-iLargeurPlateau);  
  plateau.translate(0,-52,0);

  table.scale(1.5);
  table.rotateY(PI/2);  
  return table;
}
