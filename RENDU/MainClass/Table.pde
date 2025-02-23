private PShape pad1,pad2,pad3,pad4 ;
private PShape piedHorizontal1,piedHorizontal2;
private PShape piedVertical1,piedVertical2;
private PShape plateauBois;
private PImage imageBois;

PShape objectTable()
{
   PShape table = createShape(GROUP);
   
   int iEpaisseurPad = 2;
   int iTaillePad = 10;
   
   
   int iEpaisseurPied = 10;
   int iLargeurPiedHorizontal = 100;
   int iHauteurPiedVertical = 75;
   
   int iLargeurBois = 100;
   int iEpaisseurBois = 5;
   int iHauteurBois = 100;
  
  pad1 = cubeMagique(iTaillePad,iEpaisseurPad,iTaillePad,imageMetal);
  pad2 = cubeMagique(iTaillePad,iEpaisseurPad,iTaillePad,imageMetal);
  pad3 = cubeMagique(iTaillePad,iEpaisseurPad,iTaillePad,imageMetal);
  pad4 = cubeMagique(iTaillePad,iEpaisseurPad,iTaillePad,imageMetal);

  
  piedHorizontal1 = cubeMagique(iEpaisseurPied,iEpaisseurPied,iLargeurPiedHorizontal,imageMetal);
  piedHorizontal2 = cubeMagique(iEpaisseurPied,iEpaisseurPied,iLargeurPiedHorizontal,imageMetal);
  
  piedVertical1 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  piedVertical2 = cubeMagique(iEpaisseurPied,iHauteurPiedVertical,iEpaisseurPied,imageMetal);
  
  plateauBois = cubeMagique(iLargeurBois,iEpaisseurBois,iHauteurBois,imageBois);
  
  table = createShape(GROUP);
  table.addChild(pad1);
  table.addChild(pad2);
  table.addChild(pad3);
  table.addChild(pad4);
  
  table.addChild(piedHorizontal1);
  table.addChild(piedHorizontal2);
  
  table.addChild(piedVertical1);
  table.addChild(piedVertical2);
  
  table.addChild(plateauBois);
  
  int iEcartement = iLargeurPiedHorizontal-iTaillePad;
  pad1.translate(iEcartement,50,iEcartement);
  pad2.translate(-iEcartement,50,iEcartement);  
  pad3.translate(iEcartement,50,-iEcartement);
  pad4.translate(-iEcartement,50,-iEcartement);  
  
  piedHorizontal1.translate(iEcartement,38,0);
  piedHorizontal2.translate(-iEcartement,38,0);
  
  piedVertical1.translate(-iEcartement,-28,iEcartement);
  piedVertical2.translate(iEcartement,-28,iEcartement);
  
  plateauBois.translate(0,-108,0);

  
  return table;
}



   
