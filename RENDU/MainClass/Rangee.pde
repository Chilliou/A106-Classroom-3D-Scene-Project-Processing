private PShape bureau;
private PShape oRangee1,oRangee2,oRangee3,oRangee4,oRangee5;

PShape objectRangee(int nombre)
{
   PShape rangee = createShape(GROUP);
  
  for(int i=0;i<nombre;i++)
  {
      bureau = objectBureau();
      rangee.addChild(bureau);
      bureau.translate(200*i,0,0);

  }
  rangee.rotateY(PI/2);
  return rangee;
}
