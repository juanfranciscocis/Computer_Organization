void swaplong(long *d1p, long *d2p) 
{
  // Esta función intercambia los valores de las variables mediante el uso de punteros, usando la variable temporal temp0 y temp1 que son de tipo long.
  long temp0 = *d1p;
  long temp1 = *d2p;
  *d1p = temp1;
  *d2p = temp0;
}